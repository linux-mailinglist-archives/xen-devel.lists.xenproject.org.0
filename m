Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25F41182C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 17:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190991.340838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLCX-0005I1-C5; Mon, 20 Sep 2021 15:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190991.340838; Mon, 20 Sep 2021 15:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLCX-0005F4-8z; Mon, 20 Sep 2021 15:27:25 +0000
Received: by outflank-mailman (input) for mailman id 190991;
 Mon, 20 Sep 2021 15:27:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSLCV-0005Ey-El
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 15:27:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91b039d0-aeb2-458d-9527-ff1d2b050976;
 Mon, 20 Sep 2021 15:27:22 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-Hp1YB1QYMzqPWNkWfdNeiw-1; Mon, 20 Sep 2021 17:27:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Mon, 20 Sep
 2021 15:27:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 15:27:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.7 via Frontend Transport; Mon, 20 Sep 2021 15:27:17 +0000
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
X-Inumbo-ID: 91b039d0-aeb2-458d-9527-ff1d2b050976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632151641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hru8/lXqXLGXNNtX+i6pB/Pt1GzcKkUt1FUwYH+4Bw=;
	b=eK8sPH+erm4D5NFsybLxjvXEDb+O7NWwarNypbQjR06nr7CjIyxb/NpeMPHvJ/IhHD/7VA
	TzJDdlosmz1+eg+T9/Hbr+eS+nvhZHuUOMS5l4TAq0lG3u9QicfQ7ilz22gsQIBlOUB/Iu
	BKwX0Hkfz6cmN9kSRNdiaoulAmcNTKM=
X-MC-Unique: Hp1YB1QYMzqPWNkWfdNeiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E25hpfpD9fizYHQHS5010nJggpjTf47Oogy1teD56Bo7GHKIMX0I23VbZ5hEB8APr+3Ft7XDto1HLakymC3EIfLDI2s/QnQ188sg/rJbKqsnZLSAP67WG5xmZcMAZ+K2zLUahWQHNFd/mLd2jv2U4aF1K1H9/FvOEmMVdXmOX8fP30J8axPDllCkjP8dP0ytT0j4+lFcNPvxfpuc/oZSWD8P9Us77eTovZ/K3+5ICGt7SZl35SOUHRWmNb2NqH6q4IJt2aCR0t7OELS0hYbFXqYoOFrLQXV/0ZKZgibp78XAdN/rwbOEdoL2XuyeJGQ9sZPFkHASS6K4ROS+whp89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9xHMM1ePrv4Vr/9K70ZCf92wFZaFxdeMKR/JT3xeIxM=;
 b=FDTHpZ4IhBcTZhCGh7KrgfjI5sOiUm2/POrrX+A+B6Z6ln8Fe6t36zxazFilwAuwoZtO8EZqxrm1XKODOV3bbNxXeueiJnLcBNyqEb0XTQBd+7xA9sx6P0VqNszOa39IelUxSt9nja6NOYqTiD0shMBtvqB5p5SAAA0UoWHRk2mqSVxSMgg7q6VpXR3QgB4dCnxKZ18gb9KyjZOgmMqxXRtNXH/pR4n6v5ESgF4pIIEOMdzmVz9m6epXmdN+78E6+VkBUE2NGoGhsoegv83wAA/kDCBJXEjZHWE/0MS3+qMLE0oAvuLeqey9eguSjfWSmZSn28yE0KTW0dydFGv2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
Date: Mon, 20 Sep 2021 17:27:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcfc9444-a51d-460a-11fb-08d97c4b21b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472B36CE062AA8F493DBA36B3A09@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4aA1BeRvu05Z00NcR4VWTKl5yKCoLNlYUdPtf5wdCmDTlztMWlq3YlKnG7vNNyLnhtGhsAr6+kUSwflvXz+UAaBIDE30dKcA4vVk9fFeag0jHi6FlmHBVid3rPgwdyLzZQ0M8Nf/KaKgOZE+vGSmkARhELNhhWTTIetHVYMinbvOIMirm/jsE27cP2Zg9Tax0ZAMTr5G+IWBUfW/S+3J0d5EamNOeN+dP7W2M+gQEdX4IVTurfePLsRmxfjZBdZSw1A+IJQEDmIzFuXCFo0DPjoEAU2jfIL2zAwt16HaQHErJJJQ/jdx2PBf9jVnWlJ4lXAT0OYpqwGr4wRqpTw8u/L9MpAsj3WVN4hxQ9v5AcDFnYpt9DPuZc7GqaiLtqxNEHWicGAwODpkNB+0mHAG+PpnVhRK1XFGNosWHNTFUPySBqPEjoTlF9Y1rpPUGL85u/jUP7FHIhzKXFMrrIYOgMYvn4Ap0ePwcEIxp5sZLuoIP1x+9L4dWtdHTVAzARb0SADUOijZshD9QjwSJWuoFk4Y5jo7ERJUHl2Pe42Cew6p/pvD5wQioh1axAUlaMHq8z+BruJUiESOUEt+nyTGo/9DEykdKCroBZey7WMJNKEhuQb5U51WTXVRg/wc8zbbgEl4cSRhZkoROlcblB4Nj7LsHsJyXcdkSw4UnUVAvgXKEc48WMnmVxe7qOnVslAZ8KpV6YL4ZDPVGIvQ5Ei2rdcB14T2jRIR0j/V/BiFOdxQpi8YbYgNezljWaHunA5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(346002)(39860400002)(396003)(66476007)(66556008)(86362001)(66946007)(6486002)(36756003)(54906003)(31686004)(478600001)(316002)(8676002)(31696002)(53546011)(5660300002)(4326008)(38100700002)(2616005)(956004)(8936002)(83380400001)(6916009)(186003)(16576012)(2906002)(26005)(76704002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yTb5LrO1hvuZ38deHzL1rklfQ5kfp5pA45zHhbyuvpuuPpO9GlnSFEy3c7Zm?=
 =?us-ascii?Q?fOV0XNPmInonMoKYGGjbal2tfiw2im5hpzNDu+DwD5Tb4oVWwxgpb95wviOv?=
 =?us-ascii?Q?Gr+9ZMzAqqMbowI/jwfGZn5Zh9aFzNEG0A0hgVzEDwP8WfP1XfFi1jo4eY2H?=
 =?us-ascii?Q?BWO1NCgbOkdF5vBhJe6T5V8f1NlSKzAbTnXNWFjbma7Ti2dEJjibJnzvgEUw?=
 =?us-ascii?Q?9RBBPhDxtNpd59EdTGvwlPT3q7/xrCRKdTfg7fGgau7wnn+nu5ZyGleei3Uh?=
 =?us-ascii?Q?o7e4gZCwUzzuLcTAUVHR4p243yxcz2U7r33Is28nvkphALAn/AxewY9W7Bsf?=
 =?us-ascii?Q?Qw+gX2u8ocMsD0c4IgFyDV6Ypv/XnfX3uXFqUvAgV+oSdIJfQovV7R06xv8H?=
 =?us-ascii?Q?mdpoB6lie0q/pLsRvPAByIE4wynUuY/1kuAVWRYjy0THeCmMBLDkmZsNrirD?=
 =?us-ascii?Q?lRGHM8oCeoZCCsFeOnVTlFP5prSGspd0X2RIReOsy4YbpGTWH42SVPlzjJq4?=
 =?us-ascii?Q?/Cv+36G4srlvYwY5+UNq0XvLZ9yXHVJR/htgUZYgbdxk+mWTGWrSIpWvnBZ2?=
 =?us-ascii?Q?4kQ2NUB8eatsnmZJ4Ud4UTxbBSxbZ2zrJAhUGxwt5fMoYL7E28ZXhUxOmcDl?=
 =?us-ascii?Q?ClC3CX8p0v4sBPNYvLRavxBZ64FBkVsNOVeqyeTCDzFQugdtAL6WLbXyO4QF?=
 =?us-ascii?Q?/r2D2AsGfduunMQXohFn7sNDM8Y3+DrmxLOhQxtDWtQJzVGRyZ+8UGCpf7bK?=
 =?us-ascii?Q?az4T/ucSwh+uUoVkIDqyqWjtLzREXhv51VB7lwv373wLVEAHlpy7XcdW02RC?=
 =?us-ascii?Q?2wdokuc3nzJZr70wqRXCufLLJOlB4ki21As18ITqflE0Ts684aAtuj2mtEJV?=
 =?us-ascii?Q?30NHwDLOTj/61ZZEvk3Uuv7k+bHtVFLkoyMAVpVSTvh0RPgKXBX/UtNtGX7A?=
 =?us-ascii?Q?Zxzb+ZPa+gAYoIJOFyd9E44FKxjfKj/QcQ60z/7YtX3ks26+U7UkyHosR9LK?=
 =?us-ascii?Q?lVSDHba0ntvfQwFKMxe7o1UG2tdspfuTvzep5up2YiIgVdr1sOE3dRUWSfVQ?=
 =?us-ascii?Q?3zF8PGKLYiOr2l5x63GtLMk0M5M9vuUsuPiPK6SPsSzcVFtC5KssJqjUjAas?=
 =?us-ascii?Q?pnP9jZRDKyD/HBMVtMWHMNHwSitlqafEmPwM7biLivp3q9iG9G7GkS30geHf?=
 =?us-ascii?Q?/Z2qXTarHJn6QGPHzpq0aR92JKyp2IU56jPlO/LYa9F6AEENTZsJ1TGOnLNH?=
 =?us-ascii?Q?2onEdES3vCU6WlQ8HjH122O5KSa+H71u+Yy4w+F0SeHhE9ChTclaWeoN5AXR?=
 =?us-ascii?Q?Yzrj1pXTt2kDu1PX8sTFAk+E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfc9444-a51d-460a-11fb-08d97c4b21b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 15:27:18.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jy61KaO99DK5viqAXb/mnl8VXQvrEfl71cOSauuQ5IfX7xMAnUogbJG5oP7IkcexIrqAbwBRZnLojvgzcj1tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 20.09.2021 12:20, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
>> --- a/xen/include/asm-arm/grant_table.h
>> +++ b/xen/include/asm-arm/grant_table.h
>> @@ -71,11 +71,17 @@ int replace_grant_host_mapping(unsigned
>>          XFREE((gt)->arch.status_gfn);                                  =
  \
>>      } while ( 0 )
>> =20
>> -#define gnttab_set_frame_gfn(gt, st, idx, gfn)                         =
  \
>> -    do {                                                               =
  \
>> -        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =3D=
    \
>> -            (gfn);                                                     =
  \
>> -    } while ( 0 )
>> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                    =
  \
>> +    ({                                                                 =
  \
>> +        int rc_ =3D 0;                                                 =
    \
>> +        gfn_t ogfn =3D gnttab_get_frame_gfn(gt, st, idx);              =
    \
>=20
> Newline maybe? Not sure whether we decided that macros should also
> follow coding style regarding variable definition followed by newline.

To be honest in macros I'm always on the fence: A long line of all blanks
and just a trailing backslash is about as ugly to me as the missing
separator. I think normally I opt for the way chosen above, but I'm not
going to claim to know I'm consistent with this.

>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||         =
  \
>=20
> I'm slightly confused by this checks, don't you need to check for
> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
> guest_physmap_remove_page?

Why? It's ogfn which gets passed to the function. And it indeed is the
prior GFN's mapping that we want to remove here.

> Or assuming that ogfn is not invalid can be used to imply a removal?

That implication can be (and on x86 is) used for the incoming argument,
i.e. "gfn". I don't think "ogfn" can serve this purpose.

> Also the check for ogfn =3D=3D gfn is only used on Arm, while I would
> assume a similar one would be needed on x86 to guarantee the same
> behavior?

Things are sufficiently different on Arm and x86. As said above, on
x86 I'm indeed using "gfn" being INVALID_GFN as an indication that a
removal is requested. This is simply transforming the behavior from
prior to this change, with the function invocation moved into the
per-arch macros. It may be relevant to note that
gnttab_unpopulate_status_frames() calls gnttab_set_frame_gfn() with
INVALID_GFN only when gnttab_get_frame_gfn() didn't return
INVALID_GFN, i.e. the gnttab_get_frame_gfn() used in
gnttab_set_frame_gfn() won't return this value either (we've not
dropped any locks in between). And the only other caller of
gnttab_set_frame_gfn() guarantees "gfn" not to be INVALID_GFN. A
little fragile (towards hypothetical further callers of the macro/
function), yes, but I couldn't think of anything substantially
better.

Jan


