Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5652EC85
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334114.558090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns21o-00068b-4f; Fri, 20 May 2022 12:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334114.558090; Fri, 20 May 2022 12:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns21o-00066X-1Q; Fri, 20 May 2022 12:46:48 +0000
Received: by outflank-mailman (input) for mailman id 334114;
 Fri, 20 May 2022 12:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns21m-00066R-My
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:46:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea31cb5-d83a-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 14:46:29 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-BPNTWDsIOUeGMrMQ73CQVQ-1; Fri, 20 May 2022 14:46:42 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3939.eurprd04.prod.outlook.com (2603:10a6:208:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 12:46:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 12:46:41 +0000
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
X-Inumbo-ID: dea31cb5-d83a-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653050803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HK2fVTGtVegtQ6AusFxh4fBv5Hp3P5/RNxuO2jvzwg4=;
	b=m8pwDluvHASAm4ZpxV6IC8hC2MdO4XRCpNfWnK5GZ8sqTcrLHSPDb1QLhYUmE4ArMTyGKI
	dvkMs8iYTQcRlBYV7AcKjbGybfM7b1RGZ0fIVnlYfysHEfBp+aK9etyP0QQPHnm5trwAON
	t1G6xmi0/5M8n34kyvh7JIWCzde4K8o=
X-MC-Unique: BPNTWDsIOUeGMrMQ73CQVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSlnV4ohuYTYf/hTSdebD4aUqvdxRxsTzDN70pBlsS4csreZtEbcp9YVgVIX3cIR6pxRKkY15gwUtGN1kbwaNcaOr1MbXs/4fGjQ6ZRbgfwToLoB3nFi9Ps+0Y9LN9kRpfz+jkFfW+sK4tpGraHOvWFRXHCuhtcS++TBHV40w/xbmisdb/6IYBIq5c+I7aSIo+k5WWWXeHxzwNjXlGIdyk3WRp5fwBE1ninfBE7o8GWC27dg7YxBFYsSrdOvDWECTosFGNgDAggXE4QwOQfyB4eioyFjHM6ISiR4LsvJGY+fo6T8ON22opoOVw0SMVcI0CPkNOp01h2zr6BuUgP/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+Huf44qyn3w+VmPqL/PA9FWIDimXVfAFTxsaINxHu8=;
 b=lleWYdP6sIFAO4lyRiyKS1wRKA1tK4p3VFw+OlfjIxpUaGdSzaPO31C9fOt+1p8OA0SstntIHhfcSGeWDwnrHxTCoruec2izSxw/TCaJ8DgjDzPlwjGkMuxwehIB+zWrii8za/YU2CpPVNq2n3pVNdgV7PTf1QJlhBDmIvbdFmbEypmTy90E/WMQe9yjBuhlfy5KCvp7qvTt96g8qg2XVP7/Z7X7PRGSyH8zh+LuMgWB7IzUDbScw7FXxfxT0ERujR87RocA+vYiArTAjGi8vQx3VvQgQiEH32eTzOYY0HlM7m0PGuKAjbbTInIW+9FleONnBUQ9uUsMZhxENn0hXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02c5d597-70ce-23a7-d48e-0e9d2abe72f1@suse.com>
Date: Fri, 20 May 2022 14:46:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH RFC 0/6] x86/ioapic: fix edge triggered interrupt
 migration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <YoeLOPgabooE7K+c@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoeLOPgabooE7K+c@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0043.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c9794a6-0441-476d-322f-08da3a5ec996
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3939:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB39398B0ADFE04016E751AC48B3D39@AM0PR0402MB3939.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AB6KSOyDvsQ7hp0FJLbREDUbaBwpO/dUy557uifFriApMfy29uoa3RDSENFw1ofUi6FpBM7oeB0tnTE1+onRVXRgmBUFP3jW/V5cekkk/8aSk11v/eU5tWSlhQtqxucPme83oo7kav1eUPmzppqOSWcSD7ZWe0FUW3UldfrUJlvKxM91rh4m8Bvsa10fa8cJ1/1/CpPE2oSL51mJIA+fuz1f8WbIqshqBwo0oz41WnxEk6xMXtSwmuNc+i3bqFalPCpPLIkhyobgUTXZm9P4ApD5Cr0Teqkgt1q0rzsqLpb1MlhlP8zEt5nQhqHzoiBjpulsI4fDXhxukUhu7roNbAqZNxtcxyyEZZsMoHvO1kQ0+2KCeyPFUkAXjw1qB2r9LiQd2KjdqySlH5DYJg63qBjhA8Pnsd4K8zo7Wm9CgnLV0XGaGIv6BIFTznDkdbeZICmNEHHoOJtrsoiaLdBY+RLDiIegnuH6ve8eEvpPHyJdqneKFMHb6nUk+F1vwCxBwI6L1C/78ss8lUdpZhZV2jP6tCXYuERaRvr7K+841wv+wSbXBG+4RkdmrWieqaUEAsaBMbF2Zy8f5VIJTMAgeIDvaJwkvOSfTffEcvsWnuimp56np+M1G4AOl/OszBtNzz6aIhIHZtkv3cT/XcqAzQ0k8BLH0KgEYmA+Zq00uVn/5SGKRVd16cnTTprOiaEsOGDthGtPpwtoWW9QrReH7NsIuyk4uBmiLZ1HGHVe/6ucoOL9gxGc/hVoqYqymjZF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(186003)(316002)(6916009)(54906003)(2906002)(83380400001)(6486002)(36756003)(31686004)(38100700002)(26005)(8676002)(4326008)(2616005)(66946007)(86362001)(6512007)(31696002)(66556008)(5660300002)(8936002)(6506007)(508600001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KBIUtixCx4EF2zK8vh5buuoxX8Xj2TQjNgCOp9SxQ9839q5dib+rmEo9DG8Y?=
 =?us-ascii?Q?f1Hm+oXzlMh//SMeKM6rFcGcECsGBExUpZGAKnRKreVic/C61iaAfvjI4Rak?=
 =?us-ascii?Q?2yk5zBws2heZM6GEryoieHOHcTzh6Rynm2iXdIXMC2ZO+Z6PFdTSzc+WwOc0?=
 =?us-ascii?Q?uhOFL+uUp0QnFcza07LCMZojqO/NeUojiXL76x9YYTJFukvIzfeaoPKcFZSq?=
 =?us-ascii?Q?J351IfY+66WNSAHC19j7WCGRbi1lbGeBY9TaoR4oQ4aRRGYNUKgzzj5DFvt2?=
 =?us-ascii?Q?E/3Q5sS1C4QgbON8aAx5FxrKN28KDS7S2hxDcEmEtbzqPtSXWUMRSOGlzuCj?=
 =?us-ascii?Q?Zei0ZZ0jXBR5ePmRFaL4lZrauoOFHzPqo7vPYdzhDXSNZvlMQubkjzi7iPkK?=
 =?us-ascii?Q?ZFac45ixF13TYqosAW09kM/HyMwj/sOOV6UGigQriJ85G8KoqmDMBUuXJEN1?=
 =?us-ascii?Q?5eV3L12fbRVWQ3QTebym4oHbpu9UYi3tb3jCOCh/82RzR5xv+SvVUiL5yl35?=
 =?us-ascii?Q?khKnxA8b5TDiJeZq8KLUeCyxnoVxlZ5mpiOofcOGGE1ZEhBumLo6Kdfife0A?=
 =?us-ascii?Q?VGlXHPGaV5BI0L1gVV8bW5zifynQDWsg9IZpysyG0gzLTh6UQyS1MHkRe2Vv?=
 =?us-ascii?Q?BULJjdIIVd01CFEm3evpW8mMmsbV2LAkzflgdu3ZvKpQccRg9aRiubAhA1ef?=
 =?us-ascii?Q?I226c47lJgZux4uEYT7OgsQRn7Urj5Q75PkhJakIP4QvK7CkRGRmhD4dWe9z?=
 =?us-ascii?Q?8+mU9eNUuWSRt3W5kLYWaNWrLMqo4dlVRdFgkl+pqaGeBb7JPeMtQRwW6knQ?=
 =?us-ascii?Q?DZx7FoCZbDUWerTqquBvTI8CJGim1TTGuzNoJbhhAa0VxrwDkg6yncurDxza?=
 =?us-ascii?Q?PV8s83Tbvvq888qHsYDJZsmW/iQwvu1iKQnIUHNObzi8cJ1hzB9FbUw99ESa?=
 =?us-ascii?Q?XOnvBnFxS0oeVB6YD7r3GncRqUdHjFyPRIkJOrOJdcheJLus19u9I8emQKvB?=
 =?us-ascii?Q?zFBj3KwfZagBsVpRuPNgHKfViB1v6L9/dZsrE5izcBxgMTtdBCOkW07YVcX1?=
 =?us-ascii?Q?gHP9u6BRWjp1TKBP8dLa+NVgiX9hVIdVIrWTpBjECSf9HfUMvs/jS3CvVoJC?=
 =?us-ascii?Q?AfsSYHxC5Y2kz1N+d2Or5dP1pmgEKia+kB4r9FCrTVVn5CoOlXLOv+H+0olc?=
 =?us-ascii?Q?W6JLYaXtNYQb93wzgeHu4QgjUgna8IVFqg9g0SooQBYxO6rFCGT3A8e2b6eq?=
 =?us-ascii?Q?JSX2G3MADWmDFrSAJpqXMkpm/mAXHxDMHTm7JoNxaxMEl3ZSMd6ZQpsAqcNH?=
 =?us-ascii?Q?bmfN1F+NKLcPNt/NYCDy/4SOilDPLB+n//SfPhKusfuaIDcb8AJFc7P9PYfO?=
 =?us-ascii?Q?K3mmy+xqW6emHmP2+VxWfy1XwCiO3zQa1giCBe4d5hb/i674BgfI/EAgbDuU?=
 =?us-ascii?Q?EQCFCNCJhJuECTVAgclDfGiHa4uH/piVQISC/Cai/U3DeFozwsTSk5QkEcIc?=
 =?us-ascii?Q?K4utuqAwfY4eDkYEXMfq9NZ/4Xmu2/pmWPzV8/2iS4b/ZAUp9XDfhIy6nwc9?=
 =?us-ascii?Q?YxuTOniv0F4T61/PfdfhHAgOBkUExOZjgkG3nMUYggkNr951mvL5YDe1E1l8?=
 =?us-ascii?Q?gk5ePj9ziVLAFavLo34L1zv+sdD5VnNQjOMqX/mSorbvOCI8hZQzzc7slojL?=
 =?us-ascii?Q?zzB+9qBvKErBrqCZ0qCvEoFoZa5W/DDyMx3gUwj6rRNFfeMS6s8sSPDBIOn/?=
 =?us-ascii?Q?Yj3swyKqhg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9794a6-0441-476d-322f-08da3a5ec996
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:46:41.0996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNEdCLBc7rw+ZKUJzP33rrRGNKUYtYwhEjfuEkbaxTSdhH48kJX9wajd+ti2pR36W6KNAnzMMNwuXaBd5ip4tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3939

On 20.05.2022 14:36, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 21, 2022 at 03:21:08PM +0200, Roger Pau Monne wrote:
>> Hello,
>>
>> Following series attempts to solve the issue with IO-APIC edge triggered
>> interrupts seeing an inconsistent RTE or IRTE when injected while being
>> migrated.
>>
>> It's currently RFC because some patches have post commit message notes,
>> and because I'm not sure if patch 1 is really needed.  I originally had
>> the idea of suggesting to only backport patch 1 in order to fix the
>> issue in older releases, while leaving the more complex (and thus
>> error prone) IOMMU changes in unstable.  Note however that patch 1 is
>> just a workaround to prevent interrupts seeing inconsistent entries
>> while being updated, masking the entry just makes the warning go away,
>> but the interrupt will be lost.
>=20
> Ping?

Sorry, the usual thing with RFCs: They take lower priority than other
work items. This series is certainly the first of the several pending
RFC series which I mean to get to, but it's hard to predict when this
would be.

Jan


