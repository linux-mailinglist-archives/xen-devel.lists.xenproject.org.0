Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD6328ED3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 20:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91953.173592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGoOn-00080t-NC; Mon, 01 Mar 2021 19:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91953.173592; Mon, 01 Mar 2021 19:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGoOn-00080U-Jt; Mon, 01 Mar 2021 19:40:09 +0000
Received: by outflank-mailman (input) for mailman id 91953;
 Mon, 01 Mar 2021 19:40:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGoOl-0007wR-Jr
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 19:40:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffb6400e-c950-429a-bcc3-27c6ea3368a6;
 Mon, 01 Mar 2021 19:40:06 +0000 (UTC)
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
X-Inumbo-ID: ffb6400e-c950-429a-bcc3-27c6ea3368a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614627605;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=K57017YMNXRpO3MY3QcSzcXK9lKnE84DB0+wh2OlDw0=;
  b=L5qrat81VTWyGnhxfQ4jnM+X0cELecuksq4of1+LIum7l7FhA7s71no6
   vIPEn28UMipu987x9GrZ+jqiLY7nAdqHmU9TYw3KcMB92mQtgiYonORQB
   aFj+rwgBs5VClIpt2fHo2BfmVIp9QtskH7qwVCj/bWx5+VlAI5080SIip
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y5ld+cTLDv8A7u1j6WCrYBQrAknbR4MrSxkz4noFOBdjeqao9TjJSeoZ98xqyS5NRRD/9O0SjN
 ztF1IC5tjvXTMo/hGrqWrO9qXffPDfAXPqXGM66jI55w9va00A/Ju5ZJkvmhW3/Ti8Nac6c3Co
 t1S0Ghr7SfKYxzsqXFZBy47LXVhJxOSKXyIqD3lF9hmkeQNGjaLkxZNdg/12fwIVqO/kj7KTR4
 2W1zK1Su3OejiPOroj1gUREGAKkOMtyYrSDCd4j6JJMc2X9x85F/IdcPtOuopUIcOb/tNEBsQo
 aJA=
X-SBRS: 5.2
X-MesageID: 39672513
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39672513"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDSQUeUvRZcKDJZPHLTMt+QPCNEiXuiZ7RFK6MnC7faI7Rg4BlYYeQSl/4Twtp/5FlRUxf4XLmUzImxQFHZtEqxc8f7ogJI5l0pGkQd/1lWT5PMPJ4W3mXn16hJymIZiTfuFLuD0AbIQdEHbkZ83jFa2m3VBoPR2VhJrt0FPqp5cNJtNNcXreLuVLSMpsYCbv1/s3yqdIQf2Q/nysJWDPv2K9Te7NE1sIM4oZWsP26xhbn6Ct4E/dviT+L2nnB2TvZzgzQv0JhNogDViTqczjznVpoOYtVwkCWlX3Twxt6/hxvCx3XZvQ1qbRt0BmeeR+fTtpYdGj7Iu31K9XwaYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K57017YMNXRpO3MY3QcSzcXK9lKnE84DB0+wh2OlDw0=;
 b=SEQj2Z6dgj7ehvMri7tALddPhmVOBuMUTqXl5TFSrebkRlVwHjj0TVUnaXfk6Wo89UtiuRsuOk+uFzzm2m235+2jpwgomYNk/nglE2DBN3V/RxfMOvUbo3129h2bRGj79tl0YYv4XpLpTL+88WrYMbwFW3l8mHl5A883rvN1j++P95s1oPrrRp/s/1doaPF9miE1AJhrbVvRfQRk6HKijeVUw8ZM+sQIhnULX7f2tIdQ9k8gMK/AGay6aV03usfzN28vbvHlNcQrK+NSFJrDjBYtCwaVn6+4AOxnIx5ir8IsPd8Vu22lAsMKFIEZf2apnxROd0pB/aLSXtTD1TKF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K57017YMNXRpO3MY3QcSzcXK9lKnE84DB0+wh2OlDw0=;
 b=Dmg4cUWMtEdYsNI9SjGpKjhmc4lJvz7Ig7ZGVKxlio5xhjLOAml6ie0V1S/7bdDk7RLeks8X93zyBRqJqcPoVw948aNRqPfJDkFaCGZ8aVTktBPG32NE9DEt2g8Zl+Nmqfvth9S8XwJVK2FPFFsNt5OgoLQwy7FMnpiDN+ljQ6U=
Subject: Re: [for-4.15] Re: [PATCH XENSTORE v1 00/10] Code analysis fixes
To: Julien Grall <julien@xen.org>, Norbert Manthey <nmanthey@amazon.de>,
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <759336de-727b-db67-b082-709d5ee735f8@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <144f2b06-d563-a699-8481-48b6787d502a@citrix.com>
Date: Mon, 1 Mar 2021 19:39:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <759336de-727b-db67-b082-709d5ee735f8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42286d66-27e7-478b-693d-08d8dce9c3d6
X-MS-TrafficTypeDiagnostic: BY5PR03MB5079:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5079B49045A9043EB5537AE2BA9A9@BY5PR03MB5079.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ds73RmjOQPgNvdm6pZVnkfF4zVxRdNY5nvIM1j89Oak53DrsAL3MawYi7fJOkZfeyedi2Kd/WDy4sTtRuhy3S+E61RdsZIHQ31YLg/d3BJ/YcMAhZ5dlafVVTaGXQhIOaewn9bvbbozkL9a9FrOMyL63b3uehxH7IWddVZKaOvmgy2RYm6L3cQ/sJnGdXy/C+b7VN+Y5RN9luZgXYH1lKBOQsBED1FCntBnFWzod25RttBdY6Gimu8hBwYC3IymIFACr3SCbxQE+8rW3nXe6MiyYWy/DayiwWIJc/BmJu82We5NBH0T0a5BZMxs3owVIHAEKQnQowxIAuZrnOB5gckUHJVyJczGHSZ0nXfMbybb80bIxKxsrKERfQbcbhzWcFtsuIfFZHLQZh8H5AKSEVW4OXT4nUUJTiRKCiuW/zkma/LMWEhaJkPDWHhX8moRMvxUb+t3EP9bzOspn2wuCfqiFv6liNQDW7Duu+mMqga9MNoUv+Mr48+s4V1g9/jpJBucAw27p+0z4PkNjW1ReoJBvrCAe8AB0BN9LOJEm3bMJ3acgwLKMAOuJuqAk1/vO+c/OEDefARmlnpWjBQl6LPD6HmYO03VwE0HthleJgHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(186003)(86362001)(8936002)(6486002)(8676002)(4326008)(36756003)(2906002)(83380400001)(31696002)(478600001)(6666004)(16526019)(316002)(54906003)(31686004)(53546011)(110136005)(16576012)(66946007)(66556008)(66476007)(26005)(956004)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1laQmpyTk5meVQ1eWdHUG9oUzNua29WTEhVa0I1OUN1ZVBtSXVib3FOZWRK?=
 =?utf-8?B?YTA5T2Z3c1diNVkwaHIvQUxWQ1BoR1g5YTRDallvQWJUS0RQdi9MMFpIVkw3?=
 =?utf-8?B?M24wMjlhTmpWYWhGck4vbWU2dC9SNi9UNWxVWWJRSTFGRzVURUhVeVB6U3Yr?=
 =?utf-8?B?b3dQQW5sQSttdGhwczFTZFRGR0R6VXRSSXRFMG5MMlZyM0JzM01mWHA5V2Ey?=
 =?utf-8?B?OXdZN3NCbXgweHVqTWM4U0FJcmF3cTUwTklkRjZtWitRL29mUE4vMWZCKzBu?=
 =?utf-8?B?SUFBSVpkSmI1MVJlVnFndnc2UUxLTGJJVHhEZENwR1c2cmY5VVlVcmhSMTR4?=
 =?utf-8?B?cHFsdlNmN2g5c3NwRHNVWHErdE1GZ1pVTk43UnVyK3Vxb0VCeVNrdjF2RlhU?=
 =?utf-8?B?NkxxdW9UK01CWitsTnlJUE5NemswNEhGb251QUM5ZjBWUWhlV0hybkU2em5C?=
 =?utf-8?B?dmEwYWVLbmRuVTdFelRla3NuMElLZWVmcGNxVG5PRnhXZDVPbzZhMjZIOWFQ?=
 =?utf-8?B?YVBuNlFoQnFGSDBEcTh6RG4vY056eFBXVmJuRGFvaWpMWWU1TUxZM2xGcEE1?=
 =?utf-8?B?SGZJeFVSMHpKZllGWGczQ2dicUxMSlQ0a0tXRk45bUVjQ2IyQVVCNmRWaHNK?=
 =?utf-8?B?Q0k0VjNFVnB2WkVKS2RpSHdGS1hrRE9pbmFIeTkwT01GUGU0cjZLUXBzUytt?=
 =?utf-8?B?ckdpcmEyeWJZMjlSS1ZZT0psaFl6MjJpUjNtTTBPMUU5RlJHNVgzZDBIbUVa?=
 =?utf-8?B?K1hPZU0zNlh3K1RTenFSTUhGRjUvVUhhdVc3aHVOZklaaG1mYTdXbXk4RU9B?=
 =?utf-8?B?UWUxR3N1Wk1ybWlLTWU5aFhkQ2xGWXVHd0QyWnk2ZWgvUVg0Z1JCWDVBQ1lY?=
 =?utf-8?B?UFdBb216ZGo3SkxveVNIQUhVRzltYVNDM0pFVDR2N1BvY2RKWHo2WVFQK1B0?=
 =?utf-8?B?RWUrTzBKWnd5UHk3OElwLzBqSXU1TWJFeG11eC9EV2pQR3JuMzU3cStYNXVl?=
 =?utf-8?B?RFlEemVFT3BsU1pJVlNydEF2bTcvSTdWRU9mcDVzVlFNOXkvTE5paHBmQnNJ?=
 =?utf-8?B?QjgrZWRXaXNIV0dzZ2dWeGJ3cTRhYm1GTHo2TDZ0VW1IQWx2SVptcUw5dzU0?=
 =?utf-8?B?dWF3K2gveDI0TDYrdVBBVWpnWEJVMUhqb3NaQTBGc2x3ZlR4MmRYbHYzM3VP?=
 =?utf-8?B?cWVqdFUwUFh3SndrcUl5Q3d0QngvblBpMnRzVFV6ZTFhbnNjTXMrOGE2dEV3?=
 =?utf-8?B?UkEzOUJsWS9jcXBObkt3OVNGZkJxMVl3c29uTzFkWmVHc0M2enNueFl6clo5?=
 =?utf-8?B?cy9HaHcrbXNDc1NMTnZRMHh1VTF1S0FNeDhXbTlXNHFVc0V2b05RQno3dEJV?=
 =?utf-8?B?dm4zSDUyYWVMTStDNklEYVJjc0xCR3BDckVKS01GRlFjK3JDVnhhd3pNc1hy?=
 =?utf-8?B?U1dSTWMvYWNxMVYzcEtIcUE0SHRPdnVDa25JMEp0T0pwWEh0SWpDVmJ5VVhi?=
 =?utf-8?B?UituMTczREpwTGZUOGJiZElQSFNLcFB5OXpjV0JFVnNucTlYWi8zZWRhaXk4?=
 =?utf-8?B?V09KRll0bHlNV3JkS3NjcVJzMWF1L0VjVGFwRm92eHNVc0ZlRG1RYi9GcTdn?=
 =?utf-8?B?eGJ2MXVmc0VUc0tmQTZ6bU1DUVI2WXNJK1FIRXhsSGtGQVBUM21Gc0g4WnRQ?=
 =?utf-8?B?azdIb0lxcmtkb2YreG9XUGszdUxIUG5xVUFrVTRTczAvNktMNk55dnBRS1F0?=
 =?utf-8?Q?JPQTa3BATlOx7fnREh6c/m50LHiYlK96WerrJ5A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42286d66-27e7-478b-693d-08d8dce9c3d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 19:39:44.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBdVXMHrvAXB/XRVowqG/Fxa1C3SSc0lVI/IndgvJnNj98o65htqMjvLOpUBdwQSFo4hSMRbmeRPen8jfPRXtyEPR90ckepErz+xkbaxGjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079
X-OriginatorOrg: citrix.com

On 01/03/2021 18:01, Julien Grall wrote:
> Hi,
>
> I have tagged the e-mail with 4.15 as I think we likely want some of
> the patches to be in the next release.
>
> As a minimum, we get the following:
>   - patch #7: xenstore: handle do_mkdir and do_rm failure
>   - patch #8: xenstore: add missing NULL check
>   - patch #10: xs: add error handling
>
> The first two add missing NULL check in runtime code in XenStored. The
> 3rd one adds a missing NULL check in xs_is_domain_introduced() in
> libxenstore (can be used at runtime by xenpaging at least).
>
> In addition to that, I would like to consider patch #3: xenstore:
> check formats of trace. It is allowing the compiler to check the
> format printf for trace(). This should be low-risk.
>
> For the rest is a mix of silencing coverity and potential errors
> either at init or in a standalone binaries.
>
> The init ones would be useful (patch #1, #5, #9) for Xenstored
> LiveUpdate as they would be potential triggered when upgrading the
> binary. But I am not sure whether we consider LiveUpdate supported.
>
> Any thoughts?

Live Update is a headline feature, even if only tech preview.

I'd say that all bugfixes are fair game, and low risk.  All these fixes
(other than the evtchn one which has an outstanding question) look to be
reasonable to take.  They're all simple and obvious fixes pointed out by
static analysis.

~Andrew

