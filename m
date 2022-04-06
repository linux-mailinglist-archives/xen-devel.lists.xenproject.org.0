Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863474F5745
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299693.510762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0nb-0001TH-7s; Wed, 06 Apr 2022 08:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299693.510762; Wed, 06 Apr 2022 08:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0nb-0001QS-4q; Wed, 06 Apr 2022 08:13:55 +0000
Received: by outflank-mailman (input) for mailman id 299693;
 Wed, 06 Apr 2022 08:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc0nZ-0001OM-OO
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:13:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7de66eaf-b581-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 10:13:51 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-maN39rXVMdOxdrWlHTsDEw-1; Wed, 06 Apr 2022 10:13:47 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4422.eurprd04.prod.outlook.com (2603:10a6:20b:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 08:13:43 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 08:13:43 +0000
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
X-Inumbo-ID: 7de66eaf-b581-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649232831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KAhFm75o+2XeZcJJ8JHN79AVdCTWjfnwFRiW3z7xoYg=;
	b=DLYZXCI7VkBUKb1jcWA0wyVumaUDPaL2JB9nT/AlWbLJt14XbJ5u4A50kjgzi/2XuRlE0N
	ngsBkz4pe8dt50/aMzcHt9vMuGsUuM+6rsyEi7Zv3G587tSpRyGqSjUX7RH/HfzqBhN/ni
	zaGbZP11pN1A9EgTqbeeqTRkLP0xWmo=
X-MC-Unique: maN39rXVMdOxdrWlHTsDEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpIUyCqQvl3pM+4XfgPRrtnLGP5gl7NxoDVqEc8qWM2FKEPzH8YxdhIt2m+4hVBSZqiU80N1Atfi9WMiqN6LLEVSoJm7OJxII/q8QzJOq0YKjlZR5cuxv/06alSOCYpncX3bc2Ums1wEOIYm29ndCI6GCwePQXMJAnBDxURjIkvgMUlX1ZZyjj6XGBf+1G/LRy3gbYT1lRXjD4/Db9XZimJtuarWWIYnfjni/Mt55OVfCAmmZY/GbMu6hlGCRkgR8hXSsD6pKFYlK/Qs2jrZ41l4OtZlKNaCACtuXY/IRdmpQuyJO+xGO1xsKHcaHY2EpeJLfrzgpOmmS6tDZOWZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHFRo10nxxd34oAFCmJsIBFTSpieO2iP9Czga7oiTmo=;
 b=StI6Q9ZxxgzvR4N/6seGAO2RdBgz1Ap8gAxsvbMlT2hGfhu5OUZUGP4ytTKju185K4Zc4CUBgRu9JWuc6vidh1ryLtIIWowkcWwtMtQTVzQofBT357NAP1PIWMntxM7gd4fJ1hOR1YdDnxE76WxjwRG5hOtsOVLa5rTpR5t6U5kMjgTk11DiifYdu5bnR7ckIWr1pXO20F92XgcNyFeaEZyCJ8BKQOtBVKWGGiIjCuMXRFXDDtDd0vEfrYmkkB3cfnQ3gL3JXMkdzVFDCS5SGwcJKm1thIbvc/xRWz17dse+9lTWpmjbpx9QxmnvF4Vix4JbiMO4LyCu/5fozKAqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a029529-fcbe-3923-26a6-58a58926762f@suse.com>
Date: Wed, 6 Apr 2022 10:13:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Questions about Cx and Px state uploading from dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YjrgQOYbsaYOV08H@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ecb373c-c4c4-46cb-b4d9-08da17a55d59
X-MS-TrafficTypeDiagnostic: AM6PR04MB4422:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB442227BBEBC885DE0B115939B3E79@AM6PR04MB4422.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HRnB1HnBqrHo+dmCt7d5MxOfDlCueC7kqGuzO7RiSS9PojP7QfFkY3qv3PTxGrgWtXTfDkO6gvUwtCW71aly2kN/Qc8y7U3UMJf5o2BO+ZErEA9HLbAq78gByCFJsNiHev3nZLVgFsdVnZ4NivZ8briOHef4M3o0UhS6cfOgRsJQt03jT0q9Jrwln2MQ3uZdZVXni/jXgABzGB113PkP+EuJZLgDT10cYZo+JsPv9H5IvCjaagfFX1+t3SOuH+bhjujy0qe/t/iue1zayX0iKjf3GgeWRNOcZzOmVGb6UND+wHpUTm2f97iysIYVhWDT5Kx5vrbwg58U2wyzkVzA26GlQPtyvpBn9IMS5yXM/pU3cX+z0bZHvttyeRogP2nP+a+rEabbrqt/ffOCaRqSvMoiPuynj02ZiBB/xnID6zGHJIpJZ0eKFuXWnf0Wy+TPFD7fQkOI8270xNExeE6BvlRdUPSlW6QURlwNMyofP3E04N2w4DnxW8sfs48FchPxPpCYHU6whLeN+UsY53WbUfzp2naI4HuHAvn3m9OhYuOLtJdJoVOHJ+jtG3c7dDcoU63P04uNgeGtV8c35hqYNJ91tPs5K+uzNYM8gHpz3PQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(6486002)(31686004)(36756003)(31696002)(2906002)(508600001)(38100700002)(66946007)(83380400001)(4326008)(186003)(26005)(6506007)(66556008)(8676002)(6512007)(54906003)(6916009)(316002)(66476007)(53546011)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v9bghd4tt81oZieN8DsF5n2fyfckj8r//KA2vxCE9b4F6H/5O78oRrzpkLje?=
 =?us-ascii?Q?NvmiO7JTryYPf/XKmsCMLGMeAEO3BnGvwtPhqkbB1HCBJYSChzFTpCoYG8+f?=
 =?us-ascii?Q?HpouGC7JmS8QSnolaX7BrqKiGYec4FY9aBFjO0+m2bQhy1hTwbllWI7SaN7S?=
 =?us-ascii?Q?ifWdzxYUA17wEAMObSPk+wowm4VveD56Iknj4hLIE+iSSGqQWBxuQxde/B0r?=
 =?us-ascii?Q?HYx422AIHLMVcfygxpA27mqbmDxOVXpHo+uKfmMBHPvPQbKkZwnqaPD4BKpA?=
 =?us-ascii?Q?CI50u/tM8m6P5K08drv6IkhnM9vlwBjqggwYASbnR8TY7kZsRXR1uZupof6D?=
 =?us-ascii?Q?5omsvVf4cNrD2zrQP4P4Zt68n4WObucrs3miOmioMqK+2wJw5Q/KmJVeKsOj?=
 =?us-ascii?Q?72BpC3S9tSliooRuGN+zJVyG28uIRI820jjB1pPHnkwHEkDh/AV8pzDAx/mo?=
 =?us-ascii?Q?oenMZHsM1HN5SsYaPe/p08xmhz3ftn5h4dUFsYlAKCt2T2YXZQR5wTpIOqHj?=
 =?us-ascii?Q?yFsugnAUZVAKsuUgTYj6TeIUj7p+5+hQzS4B/BbNQUqSoN7c0/+H/u+j3AxQ?=
 =?us-ascii?Q?WbCEwmz4ACpt9UIyEmb0Bfarup1ZhnzxE73sRnZJ9C3meMvFYdMPnEnAAojt?=
 =?us-ascii?Q?S3Bhn+yXRwN2rfSxDqu1f+eeqzq300nNkUZWNdQRsymtgQi+Ks7lVfDeRpif?=
 =?us-ascii?Q?owimzrXeuDbjhevz0V2Fjrpb8etGQoLwjevw/g0hooREuAM4ySWOw5dF19J0?=
 =?us-ascii?Q?hpund+zib1EYcwTWQ2rgg2SvLZ9AAKocy9GJi2A7WY+9lkMCwaKC0kGZpL7m?=
 =?us-ascii?Q?oJtT7DiWp2ext4H8bPe3ZHEBi9LRHrg2cA9wOzJYibAvhIK/N95GxTWQmy4A?=
 =?us-ascii?Q?zUyWts79//4VVjRlad5frpME5+3pJwqBtSG1LhxDnQ5v01HXDcR0dpnBcYB0?=
 =?us-ascii?Q?DLWCaII/IQ4/YhBAAbEG7nV91TSIO+8pt8/BY8+3aFyppzL+fgYYZHBYFhxK?=
 =?us-ascii?Q?8Nh9z6g4z3AoxGKLSM0pLZcU3Lm+aa/lNx1T6GK7P/CzgLGKW+XH0iP3AaAz?=
 =?us-ascii?Q?il68oUWjxTvtXUWoD0mmDPWPoIfmTPPYQ32+++xznF7mmjt6VTVOGomPEtnk?=
 =?us-ascii?Q?2NhMJ3rc4Wcvd+bHxPq/eFPb02GFF4cLgLtg7ByckaTWYUchjoCFzsPARNPA?=
 =?us-ascii?Q?7LMueEN6iZgrakL2fG9n4KS+Nf195YeyFOqaNewLdzffMljQfl5EKY3KIuUR?=
 =?us-ascii?Q?GegdHGUTna2sWYnjKvyiaV+BI42GoQhiPiSJF0lXaSmS5JYujmuY3ApIbLTS?=
 =?us-ascii?Q?sskknOE6buH9UuFsDlkRZeeb/a/E/UZUAKzB6MhdNG5a8qkc2ooqVAKJ83k0?=
 =?us-ascii?Q?lXxjTutmhf/oEmhmqs+3img/FSl8/6zj2hed267i3tOCuSP38EciY409SRgr?=
 =?us-ascii?Q?usyh7WLuMznQCzzOVMJWal7HkK/nxNSnwENTz1ghYg/8I2urclJNpJA9VYGd?=
 =?us-ascii?Q?xC4SH08Gx44Dqq4gQPPktKHIlPP905j2RYAJurrjOiTeRZYQ/secTYUo7obr?=
 =?us-ascii?Q?20MnK0imtoim1CS7b4hSmppWiE6s/FAJHQmA0Nwuo/1B/EOEhDcSwS/CgVBI?=
 =?us-ascii?Q?ahTZ0GPeO2U8i4rwOMaMIDpdJn4nlLLG29wYghZtXS8HVzaS9Fe0WLPZYYBn?=
 =?us-ascii?Q?l7ltbEqnD37rmWfR3OHoVRgI0PAenH8HABh2rRx5ZTm/hcvV9isJchK17hzL?=
 =?us-ascii?Q?/05bnzhVTg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecb373c-c4c4-46cb-b4d9-08da17a55d59
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:13:43.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnAdCQM2vLkdoV5KP9LCjD8UBMK6rXOjvmDepdMl68onM9XyAqVt8zd30EWq/fC6Cl+E9KZshWVNnMA2fyH9QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4422

On 23.03.2022 09:54, Roger Pau Monn=C3=A9 wrote:
> Hello,
>=20
> I was looking at implementing ACPI Cx and Px state uploading from
> FreeBSD dom0, as my main test box is considerably slower without Xen
> knowing about the Px states.  That has raised a couple of questions.
>=20
> 1. How to figure out what features to report available by OSPM when
> calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
> this from Linux: it seems to be used to detect mwait support in
> xen_check_mwait but not when calling _PDC (ie: in
> acpi_processor_set_pdc).  I'm also not sure what the hypercall expects
> the caller to provide.  Should buf[2] be set to all the possible
> features supported by the OS and Xen will trim those as required?

I'm afraid upstream Linux doesn't quite use this as originally
intended. Consulting my most recent (but meanwhile quite old) forward
port tree of XenoLinux that I still have readily available, I find in
drivers/acpi/processor_pdc.c:

static acpi_status
acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in=
)
{
	acpi_status status =3D AE_OK;

#ifndef CONFIG_XEN
	if (boot_option_idle_override =3D=3D IDLE_NOMWAIT) {
		/*
		 * If mwait is disabled for CPU C-states, the C2C3_FFH access
		 * mode will be disabled in the parameter of _PDC object.
		 * Of course C1_FFH access mode will also be disabled.
		 */
#else
	{
		struct xen_platform_op op;
#endif
		union acpi_object *obj;
		u32 *buffer =3D NULL;

		obj =3D pdc_in->pointer;
		buffer =3D (u32 *)(obj->buffer.pointer);
#ifndef CONFIG_XEN
		buffer[2] &=3D ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
#else
		op.cmd =3D XENPF_set_processor_pminfo;
		op.u.set_pminfo.id =3D -1;
		op.u.set_pminfo.type =3D XEN_PM_PDC;
		set_xen_guest_handle(op.u.set_pminfo.u.pdc, buffer);
		VOID(HYPERVISOR_platform_op(&op));
#endif
	}
	status =3D acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);

	if (ACPI_FAILURE(status))
		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
		    "Could not evaluate _PDC, using legacy perf. control.\n"));

	return status;
}

(This is a 4.4-based tree, for reference.)

IOW the buffer is passed to Xen for massaging before invoking _PDC.

> 2. When uploading Px states, what's the meaning of the shared_type
> field in xen_processor_performance?  I've looked at the usage of the
> field by Xen, and first of all it seems to be a layering violation
> because the values set in the field (CPUFREQ_SHARED_TYPE_*) are not
> exposed as part of the public interface.  This all works for Linux
> because the same values are used by Xen and the Linux kernel.

Well, yes - that's the way code was written back at the time when
cpufreq support was introduced. It should rather have been
DOMAIN_COORD_TYPE_* to be used in the interface, which Linux
translates to CPUFREQ_SHARED_TYPE_*.

> Secondly, this is not part of the data fetched from ACPI AFAICT, so
> I'm unsure how the value should be calculated.  I also wonder whether
> this couldn't be done by Xen itself from the uploaded Px data (but
> without knowing exactly how the value should be calculated it's hard
> to tell).

As per above - while it's not fetched from ACPI directly, there
looks to be a direct translation from what ACPI provides (see
acpi_processor_preregister_performance()).

Jan


