Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD45321ED0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 19:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88341.166051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFeE-0001u8-Lx; Mon, 22 Feb 2021 18:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88341.166051; Mon, 22 Feb 2021 18:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFeE-0001tj-If; Mon, 22 Feb 2021 18:09:30 +0000
Received: by outflank-mailman (input) for mailman id 88341;
 Mon, 22 Feb 2021 18:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEFeC-0001te-AF
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 18:09:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee3fca0e-a983-443e-b871-7049ab4b7c16;
 Mon, 22 Feb 2021 18:09:27 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ee3fca0e-a983-443e-b871-7049ab4b7c16
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614017367;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=68GMU/d8w61sL2gVWlk7/rEqldzOfeH8vue3EcjpiH8=;
  b=dEW9/2utrNVjA15GxLe6Kb/wGhoxzchgLt/SGY8WEKCoS+RYRiHt64JF
   ofcnQby7g+FZK57XZp/5JZ5Bdt6lsz04xa+yW63eOvXXPv3W+EMQnb9kZ
   ZVTsR2Pkhtrbmca0TbjYeROL/dDMbnBmGtXaJA6+iAKmshhw9vYiot/a2
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yDsdRUbJ7KM4I+QvzUp1Gqnn/xx8ICl5qIYivn4mBhHKsh+yuZ2/y4iz+hHUbmQU/cjFIh8eG0
 lt/i338d5LtnN63rkIwyDqMyGisGgjdxl74BfvJv2t8pwGiVrlRXlTMkZGEyrK6QNf+wWi98O5
 u2gMLDtWxLHZCaQ52G0vfc6VbgmZbbTy1BG6Ds9DOtjrH/mDDKdLITbO7IQaTHfkOwuxLBk/JB
 Qy0KVAts0K/4Zspwe2Kr4wcPD1wkuqbwUk9FhSb+OJa/HT+mo+v6MI3GLRWxLM0EFmhdg2tFqw
 dRw=
X-SBRS: 5.2
X-MesageID: 38132271
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="38132271"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFkYcmfDm4HnsQlTcdc2AG/3W7WO9z4hZBnRunwAIx3eqqBbTyY+P9yj+ilN8pieU31CJJfxH9+iJUJojEXsGLY8NGZMvDaYcu/99mLC3V2vR7A7+HDdbSfUTL+pnTg/xQL1cwjtxjceiR4G9K96mi5u7p5Jicl/wThhHLX847cQVo0UiWaFAKwe/PPcvfDFvxBCUIQJYaqZkpQ3t1nNeFI37hOlYn1Pi9oddrJ4ZxrHPVn9xUJv0M8QB6XMVdHnuz6WSKYFsKBtqqRLHa1CWmxRyyaXW06vHG9AA7ANPitzzCBxA0yVHmfFJMlI/miuLO0i3GgRpveRpn8SRz0H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHZUAWCWjBNgta8jX/wgNCI+u2JFcJkmEeK4YD5rPPI=;
 b=ZzRKYQY2Y9mV0ZoYaEyZKYC3YJ1mo2Vx/6U45sRpxH2IHK6F4nt4WaZ9maR001rAgsv8CN63F/soo/13fLNii9E/gw/yze0wfOBZWgPstNCOyeBDaKsnhsN0jxJtXfRW9aU0kjJOeKwO0CjkNXKHwXatAvJ9rTIO2Kqf0keIJTv+cz2B+dxn03VxuaFO6Nqw2mDzfqqLLyG0gYXD1J4FFMfTsS8CTZZWpxGwjQD2he+a0j1RMfA9D7nwoApUNSOGqyryBCVVCBNEgpSEnVFnlP8hfmtS7oWSVJzpZhNVvgc0tY4ItWMzFwb15k5MJPnUCc3qkFdGhR0qXxMSSGnmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHZUAWCWjBNgta8jX/wgNCI+u2JFcJkmEeK4YD5rPPI=;
 b=ahbxScop+R65N9O9jIK0ZicbUb6GHGHbQtH4kST1g/R67+uATXl3r4BtHs4xbO91meIlHuKnaSSr+Gllu2hSKc/l2LVllYlOaeokaTah3/j1pe2BWexb4/Zgtnsi6PHeL4lTCfhNWJ4xr1XP4CXtXqzV084BBry7bgqsTFFbGQg=
Subject: Re: Stable ABI checking (take 2)
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xen.org>
References: <68c93553-7db5-f43b-b3cd-b9112a8a57dc@citrix.com>
 <78eec55c-ac2c-467e-0a2c-9acb44eba850@suse.com>
 <a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
 <24627.59405.114762.685265@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c28f25ed-c9e2-429e-f65e-34b9ecda487d@citrix.com>
Date: Mon, 22 Feb 2021 18:09:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <24627.59405.114762.685265@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0408.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a9ea7ba-0d64-498c-a519-08d8d75cfa23
X-MS-TrafficTypeDiagnostic: BYAPR03MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4165A067DBBFA2876F1EE08ABA819@BYAPR03MB4165.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTROc70/rKvPDzvedOGJVgTfBTv4z+eTpX8PvqJcbbaqYI9SSfXdHkgFdROWb90n0RzEzWqUs+kuWRTwP/9KsnQ9TxV31leX1bA/W4bvyg8gfQyXPWA3iETL4XKsT/dcfHgQjHO0WNtFN+XHWcViRC8MtAj0ifSoATH6I8+OJd2msF7OQ0fSfK/PHrVJvxCWihAKk+FYK/szdEJJFZ9uq8B/h+rBEcSUktPcX5EPgTG3BPcnyzknbHkTtXNMMLdMNJ7BcOFsX2yRIJ49Ny0RkdDxbHt3t4Z6n4PECTHQD3uXPh5leX01l5T2eyELVZE9dPASC4foAua5IiJI/a6Rp8PxCgCaRtNsz4G2Ue8Nu6utyDckbLrVJpIw67Tokd4JJxOUBABxqovMm4SIF+X1miJJ8zojfgdDe3F3kNQd44iAibQpJbmHzGlQnOKO9DtjXpdzsOO6/a22RhRL5kM5oF9jEQdSXCrN/yYgxogNMg0DGwLXH6PDbsIq+mpe0hREyBPGRt5IphdorfqaQXgsB1+AgqqoRjPjj644A4KqbjKFUjLicAg4W16FRYT5Arg6Dg/0x9zspijIagJTnxdmPOKeg95UQoT5GJ65vVXjwL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(31696002)(186003)(16576012)(31686004)(26005)(54906003)(8676002)(8936002)(36756003)(316002)(2906002)(16526019)(86362001)(66556008)(956004)(478600001)(53546011)(6916009)(6666004)(4326008)(66946007)(6486002)(5660300002)(66476007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TkZKeDR3Z2lKanFaTTNiSWxZRVpSK0hZRDIySWZhOVdmRmpBT0FFNVA3Y29T?=
 =?utf-8?B?K1BVOXJxQWJSNWlKTTlXeTBXZTl4NnNHRDFJTkFJQllnZmN5WDgxMlk1aDJG?=
 =?utf-8?B?KzFydVU0dDJKMTA3akhFOGpIYUxRZCtHdjdqakdScnZub2ZQM2RDTVNFMkdu?=
 =?utf-8?B?NE1wQXhvT1U5Ym0rY243RVd2NjJYbzQrWUhsY3kxeGFEY0tob3lSWUlpbTVx?=
 =?utf-8?B?eFNwL1BGQXE0ZGpOOG9vSDdCdTVhdFlwekMxNUJneGs2WjBuaUdCcHBjVmk4?=
 =?utf-8?B?WTc5MkNJQ1dXcDMyMjI4SWlhNUdiRnI4dWkxUDVWelBOWUFhTExFMVBZRnl4?=
 =?utf-8?B?ZDZiaEx6SDZwb2oxSnk2bzhmRlhreTRvVTFQVlNXZmJvbjd5WVhuZnlHQXFQ?=
 =?utf-8?B?c1daOVlYa2VMSUNhbElUa0hVT2lHdjl4MExPQXA1eG9Sdy9DUzJKdXZaUHJv?=
 =?utf-8?B?dDgvRnFQcXJMMEQ1ZjRsS3RvWWpVMXBtc25nd1VRQVVzQXZ5RFJ4bWY5dTly?=
 =?utf-8?B?VWRFNERDMm13WDVEcXlNcjFYMi82aFdjbi9nQUxNYm9GalRlMGdvNThuSEU5?=
 =?utf-8?B?Tm5ZVXIwbldDYUhTbGRCbThjUzZ4OGZ3VHp4MlFuWDdLWnVzRExtNVJpZEd6?=
 =?utf-8?B?R1l3WllBdFNUV0tvWFJqTG55cWUvdnlZZ2pvWjF0YVgxaFJXWnNrb080S1Rv?=
 =?utf-8?B?cmdYdmx0c0g1ellSWGVhdXFkOU1ud21qcnJleGxmUDh6b3lLays2TUJySHAw?=
 =?utf-8?B?Wll3K2xxMS8rdFBFbVdEVTJQUVowSG9aK0lsSDc3Tk5OS0ZwMnBXT1E5MXl4?=
 =?utf-8?B?OUs5K0hmWXFnekp5U2haRW01bWM4K21pRUtjSWk1U2dCMGc4bWZ2bUsvSEdv?=
 =?utf-8?B?VHg0a3hZQjlFS0xlZnNHaDlVZ3V6cW5KYTNPT2htb1BXVjJ4NFBTOVlpWE9s?=
 =?utf-8?B?UlBNMCt0TWlnd1dXYTB2YjZPYlUrMzU5Si8yWFUrNmN1SkRPb0dWcC8xUGRY?=
 =?utf-8?B?T3M0b1NYeGpkaXdkYmJPNGZTdnJIQmRBM2xsRm0rRFVmc0lTNndxUG45SjUw?=
 =?utf-8?B?N1J3Z2NBMGtJVytmZDVXRzFSejlRZ3VVVnA1Q0U3YU80TVlsQ2xDSi81NGNy?=
 =?utf-8?B?a2cyemhDZVdTUEVEcUp1YlAzV1Q0MmNyL0tMeUZtKzZYaVlnOEJxc3Y4TzNv?=
 =?utf-8?B?WVY1cGhieG0wdXpXbjhFcllGNGN6V1RqU2tMUk5uWnpSMENyOG5POXBTcTBr?=
 =?utf-8?B?VjJLSGttK2V1WWxLRGU0TUhHUFFrd0pKOE8vNWxYNzBZWkRzOEFRd2o5L1oy?=
 =?utf-8?B?VS9VRTUvM3ZHRWVQbU92MEFFTjNqT01sZytxYzZVSUQxWm14TzNsdTlueTNh?=
 =?utf-8?B?RlFvTnR6cU5LQytOVStrYlB0ZWlsUW1NUkZEckVxOFl5Z2FjazZFQzhGTmIx?=
 =?utf-8?B?ZFhrKzBwSzFzMDVSMTFGbmdhTHJxajVDWVczUStzckhWN2llenI4MjVEQW41?=
 =?utf-8?B?dCtJZWtsbG04Q1o4SU10cWFqVTY0TThROG5UVmdDNGFZVmZxMFlzelVsRVNX?=
 =?utf-8?B?Umg2SkkrMXZHSGdFUzBrVENrNGJPRTZVWVVTb1RjdzRjMUU0T0taMytWR1Ay?=
 =?utf-8?B?b3YxNkdPdkg5cFVBSkxDT3ZzcStvaVhQQUJYekQ3bURtbkphMDA2MHRrZSto?=
 =?utf-8?B?MDRJR2VpNU5uZDV4cEtEbmFvZlhOUjg0dk1UczZhZEJ3TnZvWkwySWxXSVZl?=
 =?utf-8?Q?6S6ep/PEzJMTOyLdblrJBS28Tj8tr//gB/zaP4U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9ea7ba-0d64-498c-a519-08d8d75cfa23
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 18:09:20.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lu3vdXUSbztLJqgCbNfmm4mGsDdjB/sXAYqXzXGSdeNNGi9mcZWWyyAlTjiklUP+hzcysMG93p+6BsH2ldHggHsqtwJ7lM4+p0A84XaUN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4165
X-OriginatorOrg: citrix.com

On 22/02/2021 17:21, Ian Jackson wrote:
> Jan Beulich writes ("Re: Stable ABI checking (take 2)"):
>> On 22.02.2021 15:03, Andrew Cooper wrote:
>> +1 for option 2, fwiw.
> I'm in favour of option 2.

Option 2 it is then.

>
> Andrew Cooper writes ("Re: Stable ABI checking (take 2)"):
>> As far as RPM is concerned, splitting the two is important, as %build
>> and %check are explicitly separate steps.  I have no idea what the deb
>> policy/organisation is here.
> The reason why distro build systems like to distinguish "build" from
> "check" (run tests) is that often the tests are time-consuming (or
> have intrusive dependencies or other practical problems).
>
> IMO if the ABI check is very fast there is no reason not to run it by
> default.  (We have configure to deal with the dependency issue.)

It turns out that libxl causes abi-dumper to churn for ~4s or so, which
isn't ideal.  All the other libraries are in the noise.

If we are going for a check-by-default policy, then we obviously need to
exclude the non-stable libraries by default.

However, to fix problems pertaining to the unstable libraries,
downstreams do need to be able to invoke checking on the other libraries
as well.

I'll have a think as to how best to make that happen.

~Andrew

