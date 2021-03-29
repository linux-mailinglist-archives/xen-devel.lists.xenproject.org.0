Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616034D604
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 19:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103211.196952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvfM-0007Ct-H7; Mon, 29 Mar 2021 17:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103211.196952; Mon, 29 Mar 2021 17:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvfM-0007CU-D2; Mon, 29 Mar 2021 17:27:04 +0000
Received: by outflank-mailman (input) for mailman id 103211;
 Mon, 29 Mar 2021 17:27:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vlU=I3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lQvfK-0007CP-Td
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:27:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54b08051-8b87-40f5-a8da-fe6591cba76a;
 Mon, 29 Mar 2021 17:27:01 +0000 (UTC)
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
X-Inumbo-ID: 54b08051-8b87-40f5-a8da-fe6591cba76a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617038821;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GvLuvzrCqFz8ikOr9+NaVdINDkt9OQKXKrDm4hATpnU=;
  b=b0hDyFkvraIy6jbzrqmzTFUU/AAeDbhWdeM83q6jIc0sDhZNUAmXJbvb
   ry/17Bh0/+cNeT48nQKgwg6OjNN92+543RrZMQ1+nPSs0Zovm7TidxAGz
   pdGeulpLzmbJDzDM4X+wp6oLyc7tqib1e4qJc3Ij3NxW3xty9v7pnNj7A
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7c3cC6cEsLt1Jm1l8jywSJPcLSTxQStdqkjW6XCC/xFjLn0bd/Ic5n9BxavQsdhg0C2L+CuRsU
 QMmf5rZdBIEZkQv5nWdTKvyEAqsjayWq1Kd7rpXHXKQDcThelV7yb2z95ejwyxvi9vi69zdtKn
 NcmPcAYb7cLUrLRuJGcRNpFEftPC8i0ns89mBgbdkvU3e//PMkLu5xDTAy/G+atl+HCLBxJTZQ
 OBSBeN1EPRKpmrdsay0GzNgHetxaoxxM3Zd+YzxRR5s6dEJjpng5IJe3u9TXXNEuvK7umYO3i2
 uvw=
X-SBRS: 5.2
X-MesageID: 40353357
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:I4Zba69Gj6VTKk18Y2puk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="40353357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC5TN5RyWh0EdKtnAkdAmohEwPTT447jznpOHCRpBLjb9xaxrgpCp8DAV9N7LYcS/Z0Nn0Vzb2/Wes1XK2+2lSMP5D5JSWbFdqCi4pmdOwLH0AAAU5HP8yTuwLwv39gJDA2NezqkO2DZB6GvRhjowUVdg6CSb8StJx8bg4YvwihMD+IfORXVuUakH6BSySBp8AXx431iKOtyWGLQeKv9Q/JuQfQkOwYjz+92Ag6pUwpr3Om6ry1D1qhvzCWJaiHuF28E17U7Nqs9jdfvJuBcfXfWvNEjg2tE6RQSDNXE6Mgm3YprrUousnEgIqk0+WHDxX+24Yk+fPZZhdeChus46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaI4ifJcGWIHAzTW+OAFbcQycLKrEC6x66SMaOzAg4o=;
 b=HJzuBCn+bfwLNQ31TxLAIx0I33SncYYLPCMbE7B/G+cn7zgJJlJmYe0FjqIwxZrJfXz6ajINjez4vaKunGeZZ8+qI+QiTXsMcOvRKx35RFMHzY/Qt5lcRxSv2i4XpiO/WMfWsMeRitgS5Qr5QVV3jw+sirmxICx2vFcTJOQDq4m4g13Go1mHW27wM5AKU2cHJoRgs9eQhGUBoHBPeUzV0SFZzeCoQ1uWsYz07RocKcbuwXO2f0ojdyZk8jRqr0q1R6zU6rC7zz68DstuGj//FxLk0o7Qc1mYPJYDk8TGVKbL43kDZABN/oeB57OzNZN2TjlkbAwww+y/uYmowr5QhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaI4ifJcGWIHAzTW+OAFbcQycLKrEC6x66SMaOzAg4o=;
 b=hmducad3rh9W6kpkknzMLx+r9ZH9mAi7ugx4m2hw9t6+KT1PnZrPT6iRWHXZM4+zHkkoFw6UkF7YhafyDvNOy2LqgNIHQBVw4+gmbP1TkiU6oOpadGPg1LRAZkdjZPgWvsMinjidHNXEQ7zae+VwhLwYIAhXjmb8p+Bc2eN2dRk=
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
Date: Mon, 29 Mar 2021 18:26:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e777b45-cc9b-45df-e209-08d8f2d7da90
X-MS-TrafficTypeDiagnostic: BN3PR03MB2129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB21295689AE0E9403D29DD0DFBA7E9@BN3PR03MB2129.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D8gJ99OeKf9Zk67EXOOFKJ7vFZMpOxi5PlWlJNLezdoXUZtCdmyjvlTGZcwPhplP520CiFPJXN7Fv9uuLPlamwHLSOAhoq32USVZJG/poHmdUIddI4OYBpI199kkrmGsEiIGueY9ECDtcsYd25620YRcg3kzGC9yqFfmA1pwWwEZslLqqrskqKzTSQm8n3XCRVKGyMSyvYPXEctDJEXkt46yZElbLP/brEZBiRoZ+QQUQGlp66h+LxJMqn49WKErJskIYd6GupEoPoVpLRua4F3vpeZYXM89lw3j3FL6Ge7culdL8slWDDs7hmdLFtp4NbGdMIpKSdX/AFnj0d2Z2hKIAuXDRsSPiZniaX8zfTKZtaY9y8P61Z8z9X8WdjbJCDsCTBe3EF10IzdSZatXUl45uteAt5ZSyoBPc/SiJKdii5ctOJ2hZpZMewnvz+Y8P3yhRrxnJ2OOSS1X1ssGsJaf0cniGeBUYXTNs3daR65+G3CJME147R6XR8gV+w4H3SDtWU1u1rj19rOBBaRO+A5Suw4sMjp3FuOrBZycD5sSjm01ajk6PQ0g8n5a8FFEC6+JkKCWNY5CaKki8t+AhFV2T60cMrxlqMrFNLHEp20o8B51ljmt1AcAmpp8x0iTQ300H/JrbxwtKTsNeRGgZDl01ncStU0RbvKNx93f5AIowOUKA8DR36njhJvAfyj7CTeY9v653n7v2hadFH7EbgYZpGGXUzpxxqup6M7wy6K0fWgGsJtlsHiSsnLgPJ6fhwoc4JMYA0H/zLptF37LCxMQCbhlSpjsgjrIAZIDXnLpl7vcFmKpmdhZ00wli9qaLjUdTDe9bQU5p5yB1aFJYtEnrYRdGXFsXsHGj2PjKoc3rXeMK7+93alm2ruvjFk/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(2906002)(26005)(53546011)(4326008)(6666004)(186003)(2616005)(36756003)(956004)(8676002)(16576012)(31696002)(6486002)(316002)(86362001)(16526019)(8936002)(110136005)(478600001)(54906003)(66946007)(66556008)(31686004)(6636002)(38100700001)(66476007)(5660300002)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHF3Zlc4ZWZLRGZzZVRZWjJNUjZya0l2aU8wd3RtVXZVL05CMFRzbjlJZjk1?=
 =?utf-8?B?MDZrMldBVStKeHR2TGtNMWJIOGl1OFlvT1ZvcHBEWWRoYllTSVlkdEFqVzBE?=
 =?utf-8?B?Q3BSQVcwTGdINHRDRnltcnhuL3NieVp2L0N3Z0gyRVBSdWxDV2JjbC9JZ2Jp?=
 =?utf-8?B?UFU3UmZIcUQ3a0tYSE8rY1RQWmowTmw4VG9TdEhXRFkwS2g2YnpFUzVaZE83?=
 =?utf-8?B?Y1dldjlDcjYwZ1p5Z3c5dHFOV2N2bGdpVm9DQnhGTTdndWdkZFhJZWlmZlFF?=
 =?utf-8?B?WFZPYzVqcWY3MFZGOThqL09ZdWlkWnJJRG9MWXNvUXhMdjJ6QXluZ2pPZW1u?=
 =?utf-8?B?TVJza2FIUEJ4c2pSVlRyaUJXV2tCcGhQMDVDNWVmckprMnd4Nk96cW15ak84?=
 =?utf-8?B?cENRdmErL3VFcHY5RmRFbTFOMXRlSUcrd3J1eUNpOG9YSzJzcnI5OW93ajRM?=
 =?utf-8?B?TzZVaWNxWGxHdzloSCtJYkR3Tlo0SGFwNEdSckVRQXRpd3V4QkNac3ovQ3JG?=
 =?utf-8?B?S0hZYXJ0T2g0Wk5YZHpQREthbWgyTnVvbDBTdkFFN0k1YWRnR0xnOURodmlv?=
 =?utf-8?B?aWczcUdqaEN4NHVyK2c1bWJQTmQrbnVIamwxbFBZaHh0YW9sQnRaV3Y2aVZr?=
 =?utf-8?B?RERkd3orek1HVmdkREJsL0Y2ajVzVUhUb0dvSEFOK0xiRWlZaWsyRkE2blV0?=
 =?utf-8?B?bHBDemtFN1BNUGZuTkgrT3pQamgrdHNib1plMkJVRXYvNjZqWWhhKzdhdzcv?=
 =?utf-8?B?Y25pWERpbUVvMUxsQ2JVYzcxRzhYOWJUbTdJNzRMMWdWcksxSFZtamN4K2Jt?=
 =?utf-8?B?QjFnR01jbDNvOVV1ZG8rdlloQVJvV2t2Smo4RTdUQ1NhVGtULytxaFlZMHJX?=
 =?utf-8?B?T01rSFBiQjllSjljc1NHQ3NwaGZuTG5SeVFGWUtKR3JDQ1hxODRCUW1IaTFt?=
 =?utf-8?B?emh4NjMzTVZFVm9Nc1BsTzZWZ2JxdWZmTWJleW9xaVMzRVhLNXM0VmpuNFFr?=
 =?utf-8?B?QlFzS1Y1WjlobWk0WUQ3SENUT0hoMDNWYjUyaGFoQThJbUpqSlZVdWV4N1hn?=
 =?utf-8?B?V1JoQ1lhSTFmbHdibHlEcXMxNVJQeGdicXdEMG4yOU5TTDhqVzR4dHVwNTJM?=
 =?utf-8?B?TWVtVUE5SUpnUWtNSkNpdDFKOTVzUGZsd2xaV3JzaWZHQ28xL3pWdlNJcXpM?=
 =?utf-8?B?STlkdHhYQTNzUHRmWVIwdXUxNUt5N0duQmttSlVyL2h1aHJYR001dlZIYVpu?=
 =?utf-8?B?VDVYNnpxSDhYMVQrWk4zckdsQWNCK21USkpQQ2ErUFVGVVpxakxyZEhUSVlj?=
 =?utf-8?B?UDhMYnhRVkhxdSt6bXB4bmlTbTllTjROek9vajR1MTdpSU1ybmlJc0JPS1dS?=
 =?utf-8?B?VHNIVE5yTDB4enNrbnJhZEZVWXRFSEpIbDlsYVBsOTBVejBEWHQweXp6V2J3?=
 =?utf-8?B?K2hrWGVQYU11WWZkVCtCM2dpazNuRWRkYTdlTFZaZmtmWTMvV2NsMHdkam5V?=
 =?utf-8?B?STlVWW9uWnJMTGExdTZac3VTN3V5V1l2MG85WXBWck84bWMwTzZOVzNUaHlN?=
 =?utf-8?B?UFJCMkZ4VzRxN0w2bDBjZzltYUh2cFFIYlNadkllM29kUmRWV0l6bU9mSkdO?=
 =?utf-8?B?eXlEK24yeEs4eExIUGRRNUMrSUErUWtwdW5jUXA3SWJGZlNuZGtkcHVvWVY1?=
 =?utf-8?B?bGNkMzZjemwvejh1YkpDZmU4cjhZTXRyczhoWkFlMXYxbDNrMkVzendFZVdN?=
 =?utf-8?Q?OUAhIBmF74juOcGlyjPgaTBBSfAQtwM9/6QJs3p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e777b45-cc9b-45df-e209-08d8f2d7da90
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 17:26:57.4762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUpCdcc46yT3wjuwmr9uIvvMly1wTcMPIhoOJzfhxas9Cib3HJdbuUkKSFWdGt28L8KLAf0CBoK2sc3/Hv116d0mvrizGuoPGp57ov2a2D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2129
X-OriginatorOrg: citrix.com

On 29/03/2021 17:23, Jan Beulich wrote:
> On 29.03.2021 18:12, George Dunlap wrote:
>>> On Mar 25, 2021, at 7:08 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>> On 24.03.2021 18:26, George Dunlap wrote:
>>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>>> ---
>>>> Missed one from my list when creating the other series
>>>>
>>>> CC: Ian Jackson <ian.jackson@citrix.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Roger Pau Monne <roger.pau@citrix.com>
>>>> ---
>>>> CHANGELOG.md | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>> index 15a22d6bde..49832ae017 100644
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -18,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>  - x86_emulate: Expanded testing for several instruction classes
>>>>  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
>>>>  - CI loop: Add dom0less aarch64 smoke test
>>>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
>>> But shadow code doesn't get included by default in shim-exclusive
>>> builds (and others are unlikely to disable HVM).
>> Can you propose some better text please?
> Does this need mentioning here in the first place?

I would recommend not.

We've been doing incremental improvements for the shim for several
releases now, and in this case, we're literally talking a few kb of
code.  As we already align to 2M boundaries for superpage reasons, there
almost certainly isn't actually a reduction in runtime size.

~Andrew

