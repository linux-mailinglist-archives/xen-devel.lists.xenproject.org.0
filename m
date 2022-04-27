Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C65111D5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 09:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314397.532450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbeE-0004kI-1l; Wed, 27 Apr 2022 06:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314397.532450; Wed, 27 Apr 2022 06:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbeD-0004iH-UC; Wed, 27 Apr 2022 06:59:37 +0000
Received: by outflank-mailman (input) for mailman id 314397;
 Wed, 27 Apr 2022 06:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njbeC-0004iA-LL
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 06:59:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988641d9-c5f7-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 08:59:35 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-M7M8_L-YNYCL6Ni2QHImvg-1; Wed, 27 Apr 2022 08:59:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5271.eurprd04.prod.outlook.com (2603:10a6:20b:11::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 06:59:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 06:59:28 +0000
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
X-Inumbo-ID: 988641d9-c5f7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651042774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJLFZngs4T0hXtxzxy+ozR9TggHtnXGmtAt5BMNxhIc=;
	b=gvSsDY/1Od9ObZiW5v17v75w4GdH+EopnkVyeIBiMpgpSvL9GOYmLkXDbQyYaGiSst4LL/
	riF9HbNRRFoUHe+SFkrogPxMz6wQo58m8J5sCQYut0vXIQcoYXxgvwlR0F8X0ZTZDB3+nS
	+YpQsb8ybIazrUuhXQ8kpOGTBr+dFj8=
X-MC-Unique: M7M8_L-YNYCL6Ni2QHImvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bplxmPlKnN4oWlFBssBagWNWzoPhK5ayy1XjOy3ABWUxuPUaCKXJ6pxAB5JK/6NVsqbEeztYG+w2u2soss6y8MbdkUeOuXknqz5lVGRwqppVl2o9p3ZvYF/xuhO38SSSnPSfsfTzYjoBJeP86Pv38FDEs3WZwkn+0Eq+Y/pEp3m30vALueRJGiO+QDAf9Uv96HCB7o2uNjRo86GN5/r3j4zXiqZJ08G7IdyZxFA8JJWRpSGa0JBUrXd9VFvbTOb1s0g7nO1H2mmYLL3+oqbgmnLI7bU4Ff7ouFPz3KorKU1hDRxHUyqNHQY/0Cd2kZQBfviaInBFgbjgmEIJUwYQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqQup/KvJeUQBuhgw0cKHBszX0Zjc6ityX+RiB4ZOqE=;
 b=Dbb3myhxkVOa8mO+UwkBZiC3PuWjAxjQSjHFA93OVuPANqouqUtW4gmHWnna41Art8CVgqYmBL2IxF8/MupxZ+AtkGdcq/hQV+HmXVQZdtK85rLjccfdTlqBszWlWdR0d0RbG1CRO3Cci+cBX1uVAWOiFZRYQzby5e6jZZ+oFHXclgN6lVTVnyC6Ijd5wlb4kxvxAmLLA+dEXI/Z945YYmV5vQyIwqPQkvXJHQRzoRlCETJ/MsQa3SBrEIBfVvpovbk5GPe2fWg/jRy1vA7dcffXS9cFRu53qGmWJ7+054gSPhsvEJ6zVyAkZRbLWUWRS/0jxSWt/KZ6xBMGmon2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec1efb6f-9d41-c018-582b-718254b55aa4@suse.com>
Date: Wed, 27 Apr 2022 08:59:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: RMRRs and Phantom Functions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian
 <kevin.tian@intel.com>, Edwin Torok <edvin.torok@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90046e19-6d3d-4698-2cb1-08da281b7915
X-MS-TrafficTypeDiagnostic: AM6PR04MB5271:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB527165C01889B411D6330E8EB3FA9@AM6PR04MB5271.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R21cCM02MJSzV5bbeN3JofcgAfGyIvpy6HN7jNmYWYq6vuRQuJ8bxhAYo7WWyPgWWF3lL2N2rtOpwXLZUv4pGL3/00TAhLcUYLWZX9UjxXIz/1C1Q5UJO1VSkNOBOq37DNuIlbUS3z1kYaNf1gusFTJUC0Qn9ASp2QqQYNSYoCDZHqeX88bWPFxzmVAoIIKzMAyjJVjY3LWLCJiP0yIfSsx4pEbMfQk0ulVbnjQsOoVAEPh41BkBzfyNUD8Kad4IlSWzz5VoZFF2z5XbePSLEw120k1Ob9cH2GsWT5yyfIFZEZpzGOGKTjAczNYX8K2dQRctxZ11JCTukxQ3C7ibJIeB0A7e78PbemjENYhGp6QetBMdcowvGRYBubk6NExARs7mEWGEyQgG1Om8PDVvRfLGhgLPiYydZPW8kIhSTVKGRCcWceGrBnpEMJ5YFEf5sGO0IUMjm/HtPOon5VQE5+SlAm41x9u9RBeW2fFmlTCaX0iFSsJlO+RAZOPe71hh0dE0qDaP+tAYxwo2c0MNhec/xjoTpAA5dLkFkh7pChk9WoQUBwkds7jSlewFnjsTDBLX13SMur7yxOmscRLdq3H5XNw0p68FjoS6UQBiCAvg4HOpIsJZIDHECobSLXBmixQoIdnDWFpm7gDR61VtcT4Wfb5erS73Uoo7fSKWtfHqF/k4QeJcgcvWRU3pLphoJW9mGDK4h/uoZb8rowZbNSdbSBbhg0IolNZr0PjE2dICRbq9SdnKwmuer1bpHkeN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(5660300002)(83380400001)(26005)(31686004)(6512007)(6916009)(54906003)(8936002)(186003)(36756003)(6506007)(53546011)(2616005)(508600001)(38100700002)(3480700007)(31696002)(2906002)(6486002)(8676002)(66556008)(4326008)(66946007)(66476007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J8pxpn64VMXfIjXnvrS+9YdQR6odPfD9pnfvh0CvjGss67O11ERvVk+1BoB0?=
 =?us-ascii?Q?oL6GDECZZDtVlohg/6yMpAvx03W/XVh/nF1HNTQWbCC71QES+4EjhP+ySu9s?=
 =?us-ascii?Q?y3mkUFcuZkO9AOifAOWJRXyMqDn9Pb/UK74R93zpQwNfW0xdNGkzL+kgoSST?=
 =?us-ascii?Q?Wl4kI/9LLlIgGCLJbFHWQL43ecuQXe2MxJI6sMkC47YaPEpIYouRmIOLgA+Y?=
 =?us-ascii?Q?6eBGfWc8agnQT6B4YMjWng+AK7CSQ0QcGTGUXcTdaq9j8p/KUb22E4OAkwga?=
 =?us-ascii?Q?eEdYuGF1jA+1WErNY/uQtQQ0Tvzh0/s2R5B4ExV/cLWnvWxll4OPf1DbwCEQ?=
 =?us-ascii?Q?Am5uMYCkcAbFjSfQqAFHF0QSFyEWnqcId1aTqhOotH02UUJV7ILOYI8F/AsX?=
 =?us-ascii?Q?l6jEH4tf8arrfjquOB4EH6LJaLF3vSDTZ26TeLjqv36bhlymBvU1pJZyhAjS?=
 =?us-ascii?Q?GVkfDqZncO4dEtncOx1p28sQeHaxqi5tn+SyRtS+gWDqYU46fk3PasKXFItQ?=
 =?us-ascii?Q?BNw8ZR1I2hzZ9f5pzHuRtQt/c6ei+AkiFAdzoMo47It/XksmlmN2CvCDIWkZ?=
 =?us-ascii?Q?+IWziLzNoqfNLlqPdOF8npNbPxW9Rw9uQyfubh1pYiRhEYxH4QswmGFEbho1?=
 =?us-ascii?Q?htxoDaWuLQA+9FA+k/yuqE/byW+VIMEdcYUfaKZEqzFV2QDcJxW499eD/cBg?=
 =?us-ascii?Q?iN2766VR+WTPTwTyj9EDalrrY8S/0ylTdxZK8beJQkAKsJNgGNAGcul5Nlde?=
 =?us-ascii?Q?c5fAmKfMvWOBJVuOCHuB9LOT0uWgHTLu/c4Koamw0zhWNv3DQuDKUGme4GkA?=
 =?us-ascii?Q?XlgaodP13zA7hhk/sklK8p3wPmB+tJvGDv4akOmQ1tmSoFXP3X+pZUjdwjXO?=
 =?us-ascii?Q?LMrVACh9UwpSXJIE9MMsAAwHMr8YRiQef03ky+Qns/5h8bEfMJjiXeCRpOyD?=
 =?us-ascii?Q?0NQV6VN1NIwiSn2096hPrAAcAQsnHQmhzTfrzs38EEBqNkZVj1PgBubV2VWa?=
 =?us-ascii?Q?waa8mC7+Wm/hli8i+/5sYAsPIJxJNX63Z/DnmWPaRI7wRhfeBdbUkzz63Zpc?=
 =?us-ascii?Q?mkuGIdL0Bn6QqLWaMG98sMba8t+vQ1rkvtPocTBrTUJFZ8ZD2BhqW/TSqxxq?=
 =?us-ascii?Q?w/o3tXDYgP0hHT5Fd0RmD/aziLjXAPmvureNSF0k8zeF2/CDGlEEHqPMd3fT?=
 =?us-ascii?Q?vnX84E/zV/YCBOTcT7e5i5Cbw2HnfIdSX5htD5HmfZ6lU0ps5SpmHaBv0aew?=
 =?us-ascii?Q?4E46anSJmg19BprpfyHemoVzKFkl9i4mDEGW/KG3xDAh9Sdr3G4+wUkwKTH4?=
 =?us-ascii?Q?Tk/J2q23ECi36OaGOcCQt+0hMnCw/AZsSHtM0dqsatjPTgdwfYSxvQmISpaJ?=
 =?us-ascii?Q?SeuO2t+aaukGX0Q34bpCTXnuPHB5gh2RopAlu4FGAJehZyXDMR7Ci1C7V07y?=
 =?us-ascii?Q?83gzLfVa4Rso4GE0Nqw5w7JWMbiekmq9t9bNC8Rcwp0KVtHYGoQOl5uridfV?=
 =?us-ascii?Q?Jya0HtXAQYtXbYIbzP3A4hz783mW85ALvWQsB+Zl6DmmkVR+mhsVlFcdYKUi?=
 =?us-ascii?Q?zo04Y6MfAUrM7aKe/Hb/RvUSSH/nNca5kxxOCltzdnzyOgCTukogbRNvQHQS?=
 =?us-ascii?Q?hnv18OQgD8sxxO5EKg4uVYuI1U0WKCWyKmZvBOXVeHSzMXB8DUqaj32ARVrA?=
 =?us-ascii?Q?fL8xlLjMwa368fLPPyim7e5COb3M6A7wwWcIe/XtFJL4zo9wYIObbdvZf5ri?=
 =?us-ascii?Q?rLSlsL9rQg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90046e19-6d3d-4698-2cb1-08da281b7915
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:59:28.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNK8ezkAr3Sc2jd/DI4pk/OTvzJnYNvPf1wWjBXuSYcHW35IYFeJnmAcNmxLafkYugQMk3kmFX1gQQQDJAizKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5271

On 26.04.2022 19:51, Andrew Cooper wrote:
> Hello,
>=20
> Edvin has found a machine with some very weird properties.=C2=A0 It is an=
 HP
> ProLiant BL460c Gen8 with:
>=20
> =C2=A0\-[0000:00]-+-00.0=C2=A0 Intel Corporation Xeon E5/Core i7 DMI2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
+-01.0-[11]--
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
+-01.1-[02]--
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
+-02.0-[04]--+-00.0=C2=A0 Emulex Corporation OneConnect 10Gb NIC
> (be3)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-00.1=
=C2=A0 Emulex Corporation OneConnect 10Gb NIC
> (be3)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +-00.2=
=C2=A0 Emulex Corporation OneConnect 10Gb
> iSCSI Initiator (be3)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \-00.3=
=C2=A0 Emulex Corporation OneConnect 10Gb
> iSCSI Initiator (be3)
>=20
> yet all 4 other functions on the device periodically hit IOMMU faults
> (~once every 5 mins, so definitely stats).
>=20
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.4] fault addr
> bdf80000
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.5] fault addr
> bdf80000
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.6] fault addr
> bdf80000
> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.7] fault addr
> bdf80000
>=20
> There are several RMRRs covering the these devices, with:
>=20
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:03:00.0
> (XEN) [VT-D] endpoint: 0000:01:00.0
> (XEN) [VT-D] endpoint: 0000:01:00.2
> (XEN) [VT-D] endpoint: 0000:04:00.0
> (XEN) [VT-D] endpoint: 0000:04:00.1
> (XEN) [VT-D] endpoint: 0000:04:00.2
> (XEN) [VT-D] endpoint: 0000:04:00.3
> (XEN) [VT-D]dmar.c:608:=C2=A0=C2=A0 RMRR region: base_addr bdf8f000 end_a=
ddr bdf92fff
>=20
> being the one relevant to these faults.=C2=A0 I've not manually decoded t=
he
> DMAR table because device paths are horrible to follow but there are at
> least the correct number of endpoints.=C2=A0 The functions all have SR-IO=
V
> (disabled) and ARI (enabled).=C2=A0 None have any Phantom functions descr=
ibed.
>=20
> Specifying pci-phantom=3D04:00,1 does appear to work around the faults,
> but it's not right, because functions 1 thru 3 aren't actually phantom.

Indeed, and I think you really mean "pci-phantom=3D04:00,4". I guess we
should actually refuse "pci-phantom=3D04:00,1" in a case like this one.
The problem is that at the point we set pdev->phantom_stride we may
not know of the other devices, yet. But I guess we could attempt a
config space read of the supposed phantom function's device/vendor
and do <whatever> if these aren't both 0xffff.

> Also, I don't see any logic which actually wires up phantom functions
> like this to share RMRRs/IVMDs in IO contexts.

See for example deassign_device():

    while ( pdev->phantom_stride )
    {
        devfn +=3D pdev->phantom_stride;
        if ( PCI_SLOT(devfn) !=3D PCI_SLOT(pdev->devfn) )
            break;
        ret =3D iommu_call(hd->platform_ops, reassign_device, d, target, de=
vfn,
                         pci_to_dev(pdev));
        if ( ret )
            goto out;
    }

The hook is invoked with a devfn different from pdev's, and the VT-d
function then looks up the RMRR based on pdev while populating the
context entry for the given devfn. Or at least that's how it's
intended to work.

Jan

>=C2=A0 The faults only
> disappear as a side effect of 04:00.0 and 04:00.4 being in dom0, as far
> as I can tell.
>=20
> Simply giving the RMRR via rmrr=3D doesn't work (presumably because of no
> patching actual devices, but there's no warning), but it feels as if it
> ought to.
>=20
> ~Andrew


