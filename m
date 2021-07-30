Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E973DB702
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 12:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162463.297940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PVe-0006dB-0M; Fri, 30 Jul 2021 10:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162463.297940; Fri, 30 Jul 2021 10:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PVd-0006bN-Sr; Fri, 30 Jul 2021 10:12:53 +0000
Received: by outflank-mailman (input) for mailman id 162463;
 Fri, 30 Jul 2021 10:12:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJOD=MW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m9PVc-0006bH-7n
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 10:12:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0651bb40-dd3f-43c4-9a4d-af705a20f7b5;
 Fri, 30 Jul 2021 10:12:50 +0000 (UTC)
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
X-Inumbo-ID: 0651bb40-dd3f-43c4-9a4d-af705a20f7b5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627639970;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n3kN6L8HccTp0nLUxNgV+cyd0Lcll3qfUd1v2G/Ir8I=;
  b=E+ZtBxgrSomTchC4rlHhHAqpZBwxG9xVfF/Ku/XmIo6aAVOL39S9Z+Ww
   3TtCOSDuuZk3BW3r07h2MlGWOsChlniXV+uLlJiiHkH0iwMf6eqDxO3ta
   Wym7FEGq2lFNIYjY3bDUbQ8/VOeUcXjbP9c3ly8yCdfK8FHpjKj1JIUMS
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: F/y1hQ3cvlFqfBbGo4Jcp5+dfy2GTEnGLDBSpKDmFJJJ8vu3N6d9Yvn6Px1G7BQIwSvc4ZSGw6
 D9zFD6mCS1X66BMn7VW+1t98kBAadJLKhLP2udEnU1dYEz/AxrQ+TF9iL/5vO4cseiEHCsIHEd
 YfaDlPvcFh/PqZ0mp3lZ0gc3NqxhLe9KSVy+SzZm5AorrMKJu+b0DQzbOukex+0B3Xmq6w7m6l
 cZAhZcB6KlEDtm5GfLjbbfQskHS5oAC17GOwdyOQ+X5GUkyUvyEJCzn0slvZLnpB6IFbUDc2NO
 a8bP4cg6itcS47TYOVOF14DX
X-SBRS: 5.1
X-MesageID: 51129381
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fS9yKK/3LJt9MtFLnmBuk+FYdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc29qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQts5
 uINpIOdeEYbmIK/voSgjPIa+rIqePvmMvD6Ja8vhUdOD2CKZsQiDuRYjzrYnGeLzM2fKbReq
 Dsg/av6wDQA0j+Oa+Adwg4tqX41pP2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrGG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bToVOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsNuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0D8fuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjLkV1FUsZuRt0kIb1G7qhBogL3N79EWpgE786Ig/r1aop9an6hNE6Wtjo
 //Q9ZVfLIndL5dUUsyPpZbfSMbYla9CC4kC1jiVmgPIpt3cE4lm6SHlInd29vaDqDg7KFC1K
 gpA2ko+lLbRSrVeIWzNdtwg0rwfFk=
X-IronPort-AV: E=Sophos;i="5.84,281,1620705600"; 
   d="scan'208";a="51129381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF1yTn/Xjg8gdLhRnaCvvGS3Os8e63gaMpf96ZTppr7jMsOwo0b0KJSjYNBojVN0Rng6kjs/280IIENl98gnuAPWkGkE3iytZT03PnLSrbAdWFFNRjmweyCybNTLcLwMJPagfYsyFsecaXtYGCqeJa1ejkvW0i+fA7rUQ1ZoBdOGZBLIfX1VpQVOG5feZShnRhG3Dpaf626eiSYK8fJ+vUsFthuqWPnSql+Z+CpJUlotfalbX/ZHJlQyDeycQ1ZcTVRGYi0pRGNjKonhzP/qqOZqcBI3v/TvRuoRaeKFNYnOTYZrjJCyiMcy+D2IGDieOROR/QQfM7oEp5q7g2F3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE6/4WW4sIiXbBb5N2uvrbE4CjYGV5flH4D5d8/c3KE=;
 b=AG6A8BhgAM5nJ2FZAPiB+bAJMjuU27qi25UR1x0S1lzDctxX6Icw2OAzXDCMNVLLERVKSCVnWJFoEXt9PNmLY41oMZiNpioEsunObMqo3Gp2hzPF0Xy2YV9udnoQxgBkfuLcIBHr0Ciw+2kGMXcCFPLTwmaZV461YeJNCSmkkG9JdBsvbARFdJyJ/AM1OHQFjr/X5r1iCjd+xjTQSLBLJjMhalJ5jtrWjL6eicmFlaNtTTpBJcWdDpyoIq1d4vlR1JtVtRHZI1nHoPK6hVodnAF/6XUueKaNSDMTMA0jM3QZbzR6iVwp7GvYgqPOTiac6Yin0EEPDos+eTYTmL6+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE6/4WW4sIiXbBb5N2uvrbE4CjYGV5flH4D5d8/c3KE=;
 b=CmHqLpRu7hLqEC/xe3nD5Yo5AeRbBS/uv6O7w1GNfXezl3gch+xo8ZNrIM8Mh7qpjVr7A4/bQZ6keRpjps68a5+Q49X/9WoEC/+BqAQ9E3WU7Slz1iXuKmco39160HOUbZ5lYgJEUSIbQWPQPr6kc1X2tEhKcS5pnsUTTTTC84w=
To: Jane Malalane <jane.malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210727184715.17699-1-jane.malalane@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/lib: Fix strcmp() and strncmp()
Message-ID: <f5ef0640-4975-1306-0a40-d3fd7cbf52d3@citrix.com>
Date: Fri, 30 Jul 2021 11:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210727184715.17699-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03d7d498-0ae6-4b9c-b15d-08d953428716
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5597A5733C936FF02A86BA70BAEC9@SJ0PR03MB5597.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0qkZusUtTZ+NliFjslsGUSAZt9SBlXCjITnZ7JBecvnSfYuLd2dfgqKwoCi7tU5tHv41jm/YdeyFPE7HxA8PQQUWIJ1cJOOuq6ZbUyAH1HsR1UerLHp2/HIp+7G5yhVqh7vpUa3ZZyfEhPDczn4nQrvatgnE0ULVuGk/LUvvWuy7TdqwFS9MNhUaeMH0E01FkY0AHQEoeoxq1b3g1nRd8rbZW6HhcFLHmHNCn4MCHI6XP1otiqR83xYW4MlO7cxqEvCnujf7lduJYggRUBvLBTQnVHCWyvPjZj8fkaspxmX7qn/mrlxazB2kOBV8xuuovVQxvWjbvCzFSSFqtryZIoXf84FhS8b+oQchFV4EX88pSeHJ785Oxz2YZiAYiJT39xlR8DGu4KaitXujtUX4L0wPB6xwaFoffQTMFuJxuNJIbJ/qimrWY0ccNkVsx8l37HYfpTGvdYQuqls3PQi+L6Y+XvddH5/xLzgSRicpYozP3xjjjnOI1KY/QiOaNvAQty4xFs5fKJgJYNRqd0Q4KtV1LFSV0j/d+oc7mlfl0FIkLwxBsYu0GP07ooUUWQZgOh+U8L7/Y56m3RN1+Q+rYMAfFTaC2KnKVuAtFziYECOq5Wxw56CaYu3yxExC5RIebmrBYlohbsMujcX7iU0QJ9a/wp+GjsVunDoUr8GgcFOfXM4F4lrnQLsJsmgpuPIDG5iLErTaPTpd37oUbNgaSQmLA4DdR2xkhdvd/TixKgZpv4GTgGSgQKk/trDinSG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(2906002)(2616005)(8676002)(956004)(6486002)(4326008)(36756003)(316002)(54906003)(16576012)(6666004)(86362001)(26005)(110136005)(5660300002)(4744005)(478600001)(8936002)(38100700002)(186003)(66556008)(31686004)(31696002)(53546011)(66476007)(66946007)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZMTWtIODJqWlg4NHpuNUdLa1E1TGtwUTI3VzVURkQ3eVpiTFp3dTQyQW1C?=
 =?utf-8?B?RFBIK0tQM0ZkcW1sK1lkVDR2OGNObnRFc2RQbXV1VVA1a1J4REJhRWF5RzFE?=
 =?utf-8?B?NnRmZWFzNS9hRTBIZklOMzVtblI1NFZHMFdKek1CVGM4cjVnUDRjcVlmZ0s0?=
 =?utf-8?B?Qmd0R2wyQWlkNHZOR3FobmlENTJ0R2Z1d2pvcVVRNWZHaDJBQTVabUYzQkR0?=
 =?utf-8?B?eldIS0NyLzg5V2tIdStsMExTSk90dm9aK0xsNFhYd0JxR0FYZnQrcEdYTlM1?=
 =?utf-8?B?TC9RNm9RenhXVmkrUExFYy95ODdzTlpWbFJSd2p4ZTZXODJBMnVWQzNqSkVX?=
 =?utf-8?B?c2hHSE5IcWVMSDJVNHNKd2dCclVWcVJNUlJNcXJkWlNVY0dMN3gzMHNRTWls?=
 =?utf-8?B?cE91bTJNcWxQTUVqWUNpOSt5d3JUcHVwM2Nxemw1TWM3N1NUZUZ5bGtBRDZ4?=
 =?utf-8?B?RTB2WFMzaXRzMDNvWXFDVXVJelE2UEx1M0lLa3hsL2NDWllUYlVjREY3T3hk?=
 =?utf-8?B?Sk8ybE9OOXJ2R2VGSk5jN0NsbUtjNTBlczNHODBUMGNab3h2d1J4cmNKaUdi?=
 =?utf-8?B?MEQ4RTRWVk95N0UrdWVzVHlQaSs0UGU2Um9BUUNGMzJmamVZOWx2RVp2dTdZ?=
 =?utf-8?B?TU1neTM1MG81cGJHL3ZYbEpNSzVmb0xJOHlyTGNYcG5BMURaa01KaUR2M3ZI?=
 =?utf-8?B?VS9QRjJTRU9qS2h0RnJXTlRtQ214ZjdMSVZBQnVUTmlIL2FlY3BvQ0tIQUk0?=
 =?utf-8?B?d2tGQnRNVkZERWtlNmQwQTBpc1Q0RFlWNXAxdWp5eFNQSDYrV2pHWTVlVHBM?=
 =?utf-8?B?Z095SXgzY01ZaWt3T1pUd0JtWm5qMDBVK25sdEdPVlNPcEI0V1BNQUdtSW1T?=
 =?utf-8?B?b3ljTVlJU05KSlhENnhWWXJXNjFGN0RYeUFUVXEyY3VYS0R0MUZDNm5ET3hu?=
 =?utf-8?B?Q1RsZHVKUENwdG41ZlQzck05NHRxanhzSHpFZmppa1B5TGxvM3ZYSzFDMytS?=
 =?utf-8?B?enVpZ3dtR1B0VC9kVzdDaEZMTXFXVHYvZkczYzNWVFUzczc3Q3Y1ODFyRW9p?=
 =?utf-8?B?YU1oQ2VHaENUVzkyNVpMOHF2RHJMbi9HMlhPM3BCTjZRQjdSV2dQc2hzaGxE?=
 =?utf-8?B?SUNWYk94eWxJWXRiTkkrdGpLcTFoVlJPMHJsZld2Z3NDcVVQT3FnT0dXNWhT?=
 =?utf-8?B?SnlXS3FIK1V4V2hBOVdNdEdSOHFXTjMzT3VxL3ZXbXFETExWRHdNUGs5QktI?=
 =?utf-8?B?ckJLRlliWDZ0bDEySGJBa09mRHRsMXErSk1QMFQ5Z0g5VndkOTNMVm02S2JK?=
 =?utf-8?B?b283M0trSXFBUUZCMktidG9PbHIxeFB2RE0vWWwwS3N4Q1p6bzNMV0hYY1Vy?=
 =?utf-8?B?TTUxWXhNR0hnb3JvRkQ5c2MyMk44ZFhoVDJpOWY3MzVqbHJGUHZmSzVkS2pS?=
 =?utf-8?B?QWwyd2JHcHRLZEd2ZkVMRGVjTHdQNzIxS1RZbzN3YW5id2UvbUlTaEdkQVZW?=
 =?utf-8?B?dGJjS3FsQVNRc0ZGYzd5bmZQSjBnVklUbXlqWlVWMmZHUTN2R1lpUlRLUlIy?=
 =?utf-8?B?Z29DWVlHb0IvcW5sN005ODB3SW5XTUJ1MDJjVElZVnM0eU1rd3Y2UlBCajNr?=
 =?utf-8?B?VyttenFGVEdPaldyR2l0QzZOaUUwWjhZL3J1TnFNcmRKMjU3NGV0Nmp5ODky?=
 =?utf-8?B?NjNlRDBFUjA3YS9id1N0ZEFaR0RCSVdjbVVYRk1wVHFNcndBeUdWNjZOV2Nr?=
 =?utf-8?Q?TXWDTPXMAGgm+ZgyejJgVfR35beHVo3XgT84BLa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d7d498-0ae6-4b9c-b15d-08d953428716
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 10:12:25.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbIB9XHmKgZDl9IpcqvrPJeQjdf7uKHPm3/k2CFDt6aI2GwukI7Gv0WW3TjfsRhLeUeffWLgmHsM1mUQ5L0NOdFmbak9iX/X6dmEH4zX+Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5597
X-OriginatorOrg: citrix.com

On 27/07/2021 19:47, Jane Malalane wrote:
> diff --git a/xen/lib/strcmp.c b/xen/lib/strcmp.c
> index 465f1c4191..f85c1e8741 100644
> --- a/xen/lib/strcmp.c
> +++ b/xen/lib/strcmp.c
> @@ -11,14 +11,16 @@
>   */
>  int (strcmp)(const char *cs, const char *ct)
>  {
> -	register signed char __res;
> +	unsigned char *csu =3D (unsigned char *)cs;
> +	unsigned char *ctu =3D (unsigned char *)ct;

So there was actually one final thing, but it is holiday season, hence
the lack of replies from others.

We should not be casting away const-ness on the pointers, because that
is undefined behaviour and compilers are starting to warn about it.=C2=A0
Therefore, we want something like:

const unsigned char *csu =3D (const unsigned char *)cs;

~Andrew


