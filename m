Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF14FD967
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303607.517986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDwJ-0006vG-3o; Tue, 12 Apr 2022 10:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303607.517986; Tue, 12 Apr 2022 10:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDwJ-0006sQ-04; Tue, 12 Apr 2022 10:40:03 +0000
Received: by outflank-mailman (input) for mailman id 303607;
 Tue, 12 Apr 2022 10:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neDwI-0006ht-An
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:40:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7b539a6-ba4c-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 12:40:01 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-6qmswOYgOYKdaqI5EdpbMg-1; Tue, 12 Apr 2022 12:39:58 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5183.eurprd04.prod.outlook.com (2603:10a6:803:5e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 10:39:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:39:56 +0000
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
X-Inumbo-ID: e7b539a6-ba4c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649760000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ge9fD1xAJATkerYkJ62MQJlk0FuheONF0CxDxSRIc0=;
	b=G62JZxdhgHWRRHOdfsOCCLrKrFxaYrD6e1ODejFtgk61cNN1fMv7jYEF/hLTxK7b5SWhr2
	FLFnyH444HKd91/ktDCJiSAU9Sjmo2wDmeRP8vdd6TNUxDBNNJK9T8dV85XmsF0nijT4bG
	7BghUv4H4Nt1602aUGopwijeZKwO8MU=
X-MC-Unique: 6qmswOYgOYKdaqI5EdpbMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kl+Onlq5loTM8HP5P6wqX3MHTr+jDt6qssWCbtjQ+4NZeyXlFcMLAYDuoaAsUp7esXnTf4sFsExK7hhlOuMaPQVhgceQnlwgFPaRcdSh8uE4SPSb/TViQ4rAObfQ+o/OC4dhuT4d5bgjr2HxZCHF4SfNp0Rfg1NWfXhSdMCWhR+IENUYRtPO82RUy3sbw2GwPe6kifyeD45JsgM1NPEXKaUaGMIzUJIiLjzVd2MQKTKqPdmLeQiwnQGBPDliOH9H3jt0aR38sDUukt5BQm9LiV4hFoe1gKdbyVRmGWBkaiYnmZWJbInyTNw2HUQT+wBuYL8+5AZvuye7v9KBaQ0+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+V0mm3AtA+oYQawZcP0/2IPXDmXLlxlbVEw+qDbVSrE=;
 b=EV/loya8QfAPPLH1mNjKp03lu60SfzxT1w0QM94OHbfL45iMr+zAq1C/k12Cv66DvhwIk3iU71xhY0qBtwd5f7CyKM+lU/oV/TxK6arkBXdyLP448kgs6c8abWlQ8MqXwONk19LStRWdU1xfG+w0B7DLtYzUvWCopWzcYwRPT0ZvJ+H6o3Qcr2y2nihJjDt/Y3pUalz/NQ5s3nNOBdDh6SVQXTr2FIm0Et+2Kb4rdp8DQ93qU+ksp0gVF+T9YoyDUa10uoye8QbhWInSZGXeunWgRU1kL1RSlOQnQjrZv0WLdJYwYeKsuS0HFe9qf/svAX6VqSXjr4+Zi6tKbz6tyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5181a41-74bf-3895-e311-d7777bee5d2b@suse.com>
Date: Tue, 12 Apr 2022 12:39:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/8] IOMMU: log appropriate SBDF
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <e8780667-2307-fa7f-0768-753a83e00082@suse.com>
 <YlVO86RI3J9+qI+k@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlVO86RI3J9+qI+k@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0034.eurprd06.prod.outlook.com
 (2603:10a6:203:68::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d1b0a0-85a6-4b93-2d33-08da1c70c94a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5183:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51833A7C46D2C5C9C4CA86BDB3ED9@VI1PR04MB5183.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HUWxL3XHOugZJlbyOSV/Jq72wqn3s3qoUvve1IIC71JjTzJk5prSCi2yzaNMknvDx17/Y2X+wTY9f3W2EUH2kH5yVwNuvZeXfJMwSLkA/AV9oZN9XUTrdaR9wq68UXz+d/LGX7mXz1eYDCgJpAmAGK0Z3LfLFk5p4B/n/mV1NbHms6ccOYbcs9nJ58UPMfhhNl0yoRqi4ci2k4JSqUbqBBxl8z9+0Wm+zctFyc+bD8apCUHB49B86bZYI88VYnw3ivFnvOm5h75BQezQtRb4N7D/gmj31BhsI3FupeNtjLaZ5hKsFwApQnR2XoYBqZ7/xlUlh6/pD42x9zyAUiqOpQjqkPT7pPNXBNu5u5J22hS2DB0qL4Yh1t70ZA0NVDcNN/7ERTOJRiwrKxy9BdlsHtx7Lfpt2g9e/zTMWUEflVvaqJJrx3APf5pUi9mWZTY5fa0paJNheqC4oQ7ssVyYlXubchVNPhw0ggqUy6XgxpU7+I7xIkfrhn/Y/j1b/3OVJz4af5SSFjC+cBlHJZfaVRBIwyVczHnnpasMA50FdtjuSh1l7F3XIIzL4aIVGlzT06Hgr2q1VRkYui+6GY1JK2gv3g/HQFIUzbSanm0uuTWjJVXkfPXg6/uwtmy3K7oWfxiSORjUiXLtlqsIXPAavuTi4BAHigVXIAs+eAp23PD7AZ2iVhcMKVqi27aX1HKK6J877zMYaWffiS5mfk1SH+SUvOP9a1LCVvwvQuvqHbRZ0ZHYsBc72kNLMs/KLpOt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6506007)(2616005)(53546011)(86362001)(2906002)(6512007)(186003)(83380400001)(38100700002)(36756003)(54906003)(6916009)(8936002)(4326008)(316002)(8676002)(66946007)(508600001)(66476007)(66556008)(6486002)(31686004)(5660300002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mUBPOKqqDvK2ZUbNwsBFGeLtmLXZVDPQhwhmG2hprDh3CDdh4awouQZugQuN?=
 =?us-ascii?Q?uTKOceI+0KL+lHolEs3IToe44h6zwxgiQfoBGY2k6KLiFaYIgRtSPKFS7dB6?=
 =?us-ascii?Q?ZSi6uMNuPl/lTYtDGkK/JTYGuCBP/S2L3DtJhJ4BJfA2alqGheOmAZMKVUCB?=
 =?us-ascii?Q?xryRwMpF5u3wAw5otwU/pGOlUkyGQNHzDFca3w/YBeVsw06RjVz0PAyAZA3Z?=
 =?us-ascii?Q?P3DH/tA8XBtypljyS9QKAuM2E00v7Y1s31WcY/V5PG9T1hn+sX1NauIqUchs?=
 =?us-ascii?Q?5UVMLufHpRQxo2YF9l3e9087Hz6jF9/wAcn9xMbB4kKpnkCWzv56cwv3kcEP?=
 =?us-ascii?Q?X8FUWTyJOBaTcs0KQfAwEUobXmDdfHrSC5m54DlQmTZcQSNeR2ELX+ulA3QC?=
 =?us-ascii?Q?Ht5wPF0Fof7B/01/0Nfi7EiJ1bxsI74rGWdShx2wIKCCzhWPHdmDRq8fP9iN?=
 =?us-ascii?Q?6Ta9m0z24H+rkpC5MXslCXXux2z7qta6FxAZeUO5Hgx00Jyyo/gW7NcL1uRo?=
 =?us-ascii?Q?2+7e9N4C5IjXHW8JueEF6Dj90hZGLEtHr6uLvoN8KyDWlmzE1G0NwTL33wF7?=
 =?us-ascii?Q?xNLETkiRMZ4oBz2vOyI6qITwBHkfoBqldDTmIie0Jg9IPbLmBu8T305wpaMC?=
 =?us-ascii?Q?++scja6RPVSMJbOBqByyrVVKObmKuLA+BNtGhSCXRa5pKqUyJw8cZUBymMpU?=
 =?us-ascii?Q?YqQdx4RNggBHotfSuyZQ3BgGN1ycIp8sIt/ouscS4gUuf3+EE8/4ky+cNguR?=
 =?us-ascii?Q?pdV9Qmksg4QxgRRKqqZXEH3GMIVanHy2cvISErxndmMPO3iCNdIPUnEu23Nv?=
 =?us-ascii?Q?lxU5Dyb3j06Oj5sIphaRqE9gVvcd2aJhsKLvciTldRiZ6PnOPcK4dZM56JSq?=
 =?us-ascii?Q?hLq295//nCUgAEYXOa9t7HaYE6YCb2MGhqRdRDX86Y9NssG+eWJgF101eIdh?=
 =?us-ascii?Q?gf32jysPQfzACEkQ1VKTdEwUKw7O0MrOnZlKTeWEqV8kg+IsWkklSR+3lY3W?=
 =?us-ascii?Q?aJT3ed13+spF2NN4yn/k/aCDuJFN3OGNuspXijJQ23kIe854iimQwq4qxciS?=
 =?us-ascii?Q?yU26Fl4uzMWB8OIye+Y+AlWsjWmXm30o5pFMdiYQuidKbl7nL1rOHEwMw5g9?=
 =?us-ascii?Q?IWyy/joINQ2aXket+S88bzhfdDdnGJWsRetcInwJcDgqj3/DK7kiE/zoh/+w?=
 =?us-ascii?Q?iRRiRA51Tvf4xAssppvKByV4RoOUgAHFRRKZfF8O1VFfYiU9YPZb90QEEty8?=
 =?us-ascii?Q?/wkbvW1tEsrJYFyNxtm5Y+veJudsSdvhjx+qh5YDsI01r1tCa3HU0n6unlfO?=
 =?us-ascii?Q?buboOl6rZ6ft2jcyNdCmdufT1vpNNsBgwXOxnrUYTvi6k8W9kJ81/oZcw+Yq?=
 =?us-ascii?Q?MnP6DBGAyV8pK6QllB14+gr1+wuw3Vi+4JhCxVQVHlTpvrqT/bS/h00GsTeV?=
 =?us-ascii?Q?KIBOHBgM3fZb1Ecurgh3mj0Ip0MJEzeyt5hWEBtn812hQtd3BoN9afir8Ow2?=
 =?us-ascii?Q?bCfyjjH4qPhJR15a0g7nBFC3fapJCFlaDl7nRT+XN1czRcIgoJ9jqS8URk8V?=
 =?us-ascii?Q?LoJ9eX9yR+SRK5Q0bloqI87TnOUf0BBBAs8GpwNL4dkvmJTs1hhRm8TM+XB0?=
 =?us-ascii?Q?OIugkh6XCWNEhNxn6S+itaRWh3DUiOkjWC9Yz1wJun6FjDVvOwZrMNeE0fJn?=
 =?us-ascii?Q?1Mne8ZdAQsc4N49HWgGdcXrniaKTnxdjjhy6ehQynKeMNEgqnJqbTHl1amlv?=
 =?us-ascii?Q?tKIdypT0Gw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d1b0a0-85a6-4b93-2d33-08da1c70c94a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:39:56.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7r0lU9iZcF5IFfs+JcN4p5RTrfDQxCQGMJ12/P5wl8UvoHzpCIHibW2yADXeYQ7B2dt4BycM5p5mt1q4vGM+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5183

On 12.04.2022 12:05, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 11, 2022 at 11:38:28AM +0200, Jan Beulich wrote:
>> To handle phantom devices, several functions are passed separate "devfn"
>> arguments besides a PCI device. In such cases we want to log the phantom
>> device's coordinates instead of the main one's. (Note that not all of
>> the instances being changed are fallout from the referenced commit.)
>>
>> Fixes: 1ee1441835f4 ("print: introduce a format specifier for pci_sbdf_t=
")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> I'm unsure it matters much to have the logs from failures to find an
> IOMMU using pdev->sbdf or devfn, as the parent device should have been
> added before attempting to add any phantom functions, and hence would
> have already failed to find an IOMMU.

That's the expectation, unless something unexpected is going on. Hence
better have precise information in the log.

>> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
>> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
>> @@ -291,7 +291,8 @@ void amd_iommu_flush_iotlb(u8 devfn, con
>> =20
>>      if ( !iommu )
>>      {
>> -        AMD_IOMMU_WARN("can't find IOMMU for %pp\n", &pdev->sbdf);
>> +        AMD_IOMMU_WARN("can't find IOMMU for %pp\n",
>> +                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn));
>=20
> Hm, the call to find_iommu_for_device() is explicitly using
> pdev->devfn, so while the iommu of the phantom function is tied to
> it's parent, it's unclear to me that logging the SBDF of the phantom
> function will make this clearer for a user reading the logs.

The phantom function may not be possible to find an IOMMU for, so
using the base device for the lookup is unavoidable. For the message
here and ...

>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -461,7 +461,7 @@ static int cf_check reassign_device(
>>      if ( !iommu )
>>      {
>>          AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to=
 %pd\n",
>> -                       &pdev->sbdf, target);
>> +                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn), target)=
;
>=20
> IIRC we would first reassign the parent, and then the phantom
> functions, so we would always hit this error first with devfn =3D=3D
> pdev->sbdf.bdf.

... here what I said further up applies.

Jan


