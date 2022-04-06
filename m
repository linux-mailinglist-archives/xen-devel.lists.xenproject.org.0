Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221314F5E5E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299850.511097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc54f-0002tu-4n; Wed, 06 Apr 2022 12:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299850.511097; Wed, 06 Apr 2022 12:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc54f-0002r7-0D; Wed, 06 Apr 2022 12:47:49 +0000
Received: by outflank-mailman (input) for mailman id 299850;
 Wed, 06 Apr 2022 12:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc54d-0002r1-K2
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:47:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2256f51-b5a7-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 14:47:46 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-JbyS8qjFNdyyT1lPzYOEtQ-1; Wed, 06 Apr 2022 14:47:42 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7916.eurprd04.prod.outlook.com (2603:10a6:10:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 12:47:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 12:47:41 +0000
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
X-Inumbo-ID: c2256f51-b5a7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649249266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjRgFaDObSE/IXkSK7wEe5oFmwMpv5E9wi0+3bKzsG0=;
	b=ZzYPL5zyIWaBYKRYFYHX8wEuIv2CLKWT8/W0HSNSt3u10wLnEfvC8KGhOfh6IBEm7ahFiI
	9vb//30ex8TXh3xqYFrUZHhrHHrZCXRjxU3WpHNNweDsT21iYVIBRKkAILFlYcrHVIksIC
	x7VvvjgBjeBKCTVwRCnFPV7+jqtFSbc=
X-MC-Unique: JbyS8qjFNdyyT1lPzYOEtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc6ym7VEiGi3YVls5D6YJLBQX2MkFSmu7sL1wXDpfu9QJfCIwn1wITxgv8Y536G61UADReolWZYQyjcn62u3G9/wEq9BIe1sKWSBq9N1jWZbRy8VR4F+/1Q8yAbQTleQIDdcmgWFdCX/Z6aV85cecAh3n6o++YwHlCbgVl5HpO15YzP20SvfBTHmc3/YnkF5vN91TMTFpSuyer/zD12J5ftvzmwj0oGUP/sXQ7FMy9E+Cu6z5bufpmwA2UlWad+RDBCv6+Y9yLnY5HEyLks3XIBjzcY+kCEfCvnoLjiM4HlexAzWvGzXKVju1OfFIewsYuTH4dpTSR+wSu2U6lJdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWs+ei9QE7A9GeTJzx0157FB4uq+nJW9jftA2Flfz+o=;
 b=BLzOWZc1FpKoFRcPy6uTpUr7fMIa7+ltf7ytup4xnUNKveDWmD/OWN5oH1fPvDjlPA7QBtVL0fjS+aMtlLpKe0+wvpEZ19wxdfDdATLTEcPYwR5J8lnDFdPmuO3llo6YvVsvys/cxwM+6k4Yy5T1HjqAvN89yjSy5Aya4GxXemiVNuA3drxDw3Gw4sKRhSN6tUY6xKsTkraIprhueNCHKWfuDccH4Hl8laN7kHYtQBqvB20PwahAS4r5XUf6OS8PNLWCqHnXGFqpULD/TwQOAjhCmA2vqxiALBhTjQekqGLxQSr7JIfgzA5SrRSSdUDGdl0Fyu4hqje2IPHwspmw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <333e5dad-5a8d-a8b5-99b5-5d349c784b88@suse.com>
Date: Wed, 6 Apr 2022 14:47:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Questions about Cx and Px state uploading from dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
 <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
 <Yk1tvf7oqOf3jySX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk1tvf7oqOf3jySX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db58bb59-a3c0-4f2f-31bd-08da17cba312
X-MS-TrafficTypeDiagnostic: DBBPR04MB7916:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7916E1472F6808EB3EC4899EB3E79@DBBPR04MB7916.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycBkWMBR7nmLPurHZEx97InpkzBE2vmyRmR6+7nJKrrFJty3gIhVyzkSz6jBfcbdVvdxMBi9Qtf9HZJX0c8BcmuhUYGiQ6SE+mA+kxuh5ywHwb45dXFfj/wN4O+6toxiu/TLOhC9oxxW4+RKQFLvEFLXJ8Vp+y/vc8myEXgdOOcix6r4ApKL1yBJiXT9UoX84O3CrpL6EGUhUCLu0AJY2xXCok/9sbwDpUYDeMZAX+rqjGKfKp20cvwpjIX+TgBKJEP5hW3O55NsuP891uNiJKH5KktoKX1Kd3bxkVQUIrD69gtyuOfAkiejXy9LSk2wRkKRn2bFH78/2SuslKf122UQMKH3Mumbx/SVtbtkZhop77yfRNLcDEDEICGhyFBlGQiDNR/Rl1wrld9vhh3k6MtmWc/MaRD5w/FIaPM8NXCsvPzbpvDXVeqzwy6h7NEbYKGkarImXA2+xPa6l1pPg+t+FYlNx6H7Zl+YOrYtOJj50OYOSffp5DRhF65jKCpv1jEz7iN8ssZgahFCQ8KiFxow/jgw3uljcE5ErkPlcE5keSjI/iLASZmnd30c7uhQctLSlrd0+dSBb32em8W1WPMY9dIDNOEQWgVkkWzLKW/cw4rVL1H3BC+UTuEbjp2xwh50SPmkcJhga3aHV2M+bzuAU+kxHIctbvcZn7h0HKc53BYzKBM0zQm2AhD5QBXdDvfDBQQ6hJ6u3iCFPX1qsii/+V8XhrXLlsPKfsjT3Uk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(186003)(26005)(66556008)(2906002)(66476007)(66946007)(6916009)(4326008)(53546011)(38100700002)(83380400001)(316002)(8676002)(6666004)(6512007)(31696002)(86362001)(508600001)(8936002)(6486002)(6506007)(5660300002)(31686004)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LtgQU6P3XaEJTMqK/lAlBlSUOGKE8aRKzE7iQFHSzl++LYQcLpDZk5Qp04/T?=
 =?us-ascii?Q?Q6j845wvkSc75DCDI7CohvNUl+JCvXlhx+6rEFZpxUlO40sG0bU5EzHK18KR?=
 =?us-ascii?Q?1yfYEC+QGuaVouKvS4qY5TIUnw3tid1amAVBPA5Ab8m+S+GBS9vtrq4vpz5C?=
 =?us-ascii?Q?VNFXyGKDMccfarwfffrkfzkLFMhZtmVS0WIq544PsSNIawTwAKowjLpGYwgP?=
 =?us-ascii?Q?49qXon5HRlAVpOmwSj0CE/J31P3u5c4d1cnI9dPr6AeepWBjReFzM5nEdJYd?=
 =?us-ascii?Q?2ti8OjZGYNe8CIhNaHH5aW/09hcTkZEdpEnnZ1wRO4YE+ZHuz8zfQVvlRZWg?=
 =?us-ascii?Q?ZGEnuQBdqulphWRuRhASTRIi6PmZbCrfX3hCBygilVrbjw4bH90hoF/454SY?=
 =?us-ascii?Q?6X08VoJJTlVoJ5vurmrozXjmrxxEX0RgxIREKEIzzHbQEn4k+sWiXs641LbI?=
 =?us-ascii?Q?3gT/jrpJ/hGsGUykQyFgyUN8acXPkboFYKepWB2ME6RcdDKNj4A1YSxuwK/2?=
 =?us-ascii?Q?kPEu92ZogOhqYMwk6JZB3z9hop94cCS2cSGycSoPNxvBSCx2nkYDAv2v5/Q5?=
 =?us-ascii?Q?IMpADy6dKMpVoYku0gpavbwrrLCMTGAL3vZIerKyRItwgXCcLpD7w8Bf/Zo9?=
 =?us-ascii?Q?VReT6ZfdvkmgmKfJyfDzG37OHUqaE1iHqNFOI6xJGdBjX+eFnHfLVpfPzAUa?=
 =?us-ascii?Q?NKhyB3voAh17PzR3C67/0L/u/sFdB85JpYmjqRVgzhmlAMBYOxOI/szzKK4u?=
 =?us-ascii?Q?akxjMHa/sLz6MdWqqrSTpMo4qy+JSVAmbG9td/m5GICHsS/wXffX53aFr5ws?=
 =?us-ascii?Q?0n5zzrS9w5zJGIcJBWLRD8S3DWS7ivsK3d52csNtwx2iDGMDtlfrIegWZbL/?=
 =?us-ascii?Q?RKnp892Sxzi9NZftIzohX4xdDz3DTH8vRMwiyysoWajYkJ7wNwa2g6q1sBuf?=
 =?us-ascii?Q?Xk/mkgFyrVh5Mj0Sh5/dBvH7O+hXfMVG84t0KHaNHXaKYW6mWiTU6OMegGFp?=
 =?us-ascii?Q?VMSNAduwEeAKMLq+zRT/YtkBDIC8rXu2YpxgQcSSEBAZySVYszJivaTV96PR?=
 =?us-ascii?Q?gEl8wtZPEl3OU9tb6EDUfEB+nvVIws7/F419U4cNQtkTVcFqZfAWZfV81qZm?=
 =?us-ascii?Q?eM15w/8sy4xivyzKDWywrXkvU80S3VRI4A3TIlKVzrfV1UVmR121WpoMjYqO?=
 =?us-ascii?Q?gk+LlGMDWzuPHVHhlq+ADFH7LYDOFJ/WjGdO2sEr8rbZFLcDuapcWcd+ktVr?=
 =?us-ascii?Q?f47Pp9iE7FEnjmfh6gPSCw8qT80vuM7t3JxBp/H9bg9S/wBS1oVqurplo/+A?=
 =?us-ascii?Q?riDWiul58KlQQqRraLuR9XFV2Gj61SYWxQfVNWCrTOjKfFLT4NU4YLzmXIoc?=
 =?us-ascii?Q?+Hg692R3WxrvPyKFKErck3fdtgJHwXJTDtOkvoN9f1AwrBSQ/RFnNmcQctCq?=
 =?us-ascii?Q?J29N/uMXP9mcAMJ66ChzBlpwZKl0nI6Bwjd62sJZXJEsb/OUaTvzXWe1Pzuk?=
 =?us-ascii?Q?1MZAowMYe9QcDp41+US1hbcT/EElZqEu+6P+yx+OfdbiOqpSNkeTFkcF0svI?=
 =?us-ascii?Q?FY9tEUNfr2SF5fsmMSMF+9zTsXdjbph8cRkPKZUKdLVpRM55O1+hhy/WgvO9?=
 =?us-ascii?Q?sdE9ErFWd8SkBVpUMSA+NrxuqDjSGhN/MPuR4rzBSbCz1GMRUoGu7zdIWZs7?=
 =?us-ascii?Q?BCEfSG08hjBMFhtdFE9S16Jo8Agmr6elz98rHh3DfqEFfVp3eCTMMIMLvejI?=
 =?us-ascii?Q?itS4DCZJuQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db58bb59-a3c0-4f2f-31bd-08da17cba312
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 12:47:40.9899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4kcgmca4fIlF3S1fwgE+VQ5rtDICNrRKtOGBqAHoFyG9HLj5Jc7+6txvOGXVZtTjK6kL8TlngFwhtefzFPWwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7916

On 06.04.2022 12:38, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 10:13:41AM +0200, Jan Beulich wrote:
>> On 23.03.2022 09:54, Roger Pau Monn=C3=A9 wrote:
>>> Hello,
>>>
>>> I was looking at implementing ACPI Cx and Px state uploading from
>>> FreeBSD dom0, as my main test box is considerably slower without Xen
>>> knowing about the Px states.  That has raised a couple of questions.
>>>
>>> 1. How to figure out what features to report available by OSPM when
>>> calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
>>> this from Linux: it seems to be used to detect mwait support in
>>> xen_check_mwait but not when calling _PDC (ie: in
>>> acpi_processor_set_pdc).  I'm also not sure what the hypercall expects
>>> the caller to provide.  Should buf[2] be set to all the possible
>>> features supported by the OS and Xen will trim those as required?
>>
>> I'm afraid upstream Linux doesn't quite use this as originally
>> intended. Consulting my most recent (but meanwhile quite old) forward
>> port tree of XenoLinux that I still have readily available, I find in
>> drivers/acpi/processor_pdc.c:
>>
>> static acpi_status
>> acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc=
_in)
>> {
>> 	acpi_status status =3D AE_OK;
>>
>> #ifndef CONFIG_XEN
>> 	if (boot_option_idle_override =3D=3D IDLE_NOMWAIT) {
>> 		/*
>> 		 * If mwait is disabled for CPU C-states, the C2C3_FFH access
>> 		 * mode will be disabled in the parameter of _PDC object.
>> 		 * Of course C1_FFH access mode will also be disabled.
>> 		 */
>> #else
>> 	{
>> 		struct xen_platform_op op;
>> #endif
>> 		union acpi_object *obj;
>> 		u32 *buffer =3D NULL;
>>
>> 		obj =3D pdc_in->pointer;
>> 		buffer =3D (u32 *)(obj->buffer.pointer);
>> #ifndef CONFIG_XEN
>> 		buffer[2] &=3D ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
>> #else
>> 		op.cmd =3D XENPF_set_processor_pminfo;
>> 		op.u.set_pminfo.id =3D -1;
>> 		op.u.set_pminfo.type =3D XEN_PM_PDC;
>> 		set_xen_guest_handle(op.u.set_pminfo.u.pdc, buffer);
>> 		VOID(HYPERVISOR_platform_op(&op));
>> #endif
>> 	}
>> 	status =3D acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
>>
>> 	if (ACPI_FAILURE(status))
>> 		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
>> 		    "Could not evaluate _PDC, using legacy perf. control.\n"));
>>
>> 	return status;
>> }
>>
>> (This is a 4.4-based tree, for reference.)
>>
>> IOW the buffer is passed to Xen for massaging before invoking _PDC.
>=20
> Indeed.  I'm however confused by what should be pre-filled into the
> buffer by the OS.  _PDC is about the processor driver power management
> support, and none of this power management is done by the OS (I don't
> plan to let FreeBSD do CPU power management when running as hardware
> domain), so IMO passing an empty buffer and letting Xen fill it is the
> correct thing to do, at least for the use-case in FreeBSD.

I don't think that would work: Xen doesn't "fill in" the buffer, but
merely alters individual bits. The buffer really is IN/OUT here for
Xen.

>>> 2. When uploading Px states, what's the meaning of the shared_type
>>> field in xen_processor_performance?  I've looked at the usage of the
>>> field by Xen, and first of all it seems to be a layering violation
>>> because the values set in the field (CPUFREQ_SHARED_TYPE_*) are not
>>> exposed as part of the public interface.  This all works for Linux
>>> because the same values are used by Xen and the Linux kernel.
>>
>> Well, yes - that's the way code was written back at the time when
>> cpufreq support was introduced. It should rather have been
>> DOMAIN_COORD_TYPE_* to be used in the interface, which Linux
>> translates to CPUFREQ_SHARED_TYPE_*.
>=20
> I will send a patch to add those to the public headers.
>=20
>>> Secondly, this is not part of the data fetched from ACPI AFAICT, so
>>> I'm unsure how the value should be calculated.  I also wonder whether
>>> this couldn't be done by Xen itself from the uploaded Px data (but
>>> without knowing exactly how the value should be calculated it's hard
>>> to tell).
>>
>> As per above - while it's not fetched from ACPI directly, there
>> looks to be a direct translation from what ACPI provides (see
>> acpi_processor_preregister_performance()).
>=20
> Yes, the translation from DOMAIN_COORD_TYPE_ to CPUFREQ_SHARED_TYPE_
> is not a problem.
>=20
> My concern is that there's some logic in Linux to assert the
> correctness of the provided data in ACPI, checking the match of the
> domain and the coordination type between all the processor objects as
> part of setting the field.
>=20
> I see that Xen also does some checks on the uploaded data in
> cpufreq_add_cpu, so I wonder if I can get away with just setting the
> shared_type field based on the coord_type of the current processor
> object, without having to cross check it's coherent with the values on
> other processors.

I guess you'll get away as long as you don't hit systems with flawed
firmware. Whether the amount of checking Xen does is sufficient
depends on particular flaws found in the wild (which I lack knowledge
of).

Jan


