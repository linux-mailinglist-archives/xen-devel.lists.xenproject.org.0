Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F565793AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370422.602182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhBo-0002K0-0Z; Tue, 19 Jul 2022 06:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370422.602182; Tue, 19 Jul 2022 06:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhBn-0002H8-TY; Tue, 19 Jul 2022 06:58:39 +0000
Received: by outflank-mailman (input) for mailman id 370422;
 Tue, 19 Jul 2022 06:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDhBm-0002H2-Bq
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:58:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3606497f-0730-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:58:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2802.eurprd04.prod.outlook.com (2603:10a6:203:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:58:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:58:34 +0000
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
X-Inumbo-ID: 3606497f-0730-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fR8Z7AJBZCwUzqnrX13SGEYdYwX+9BjPbskC9QUAe/AHDVqygSM44m+4g2HPTKWAUFatSmG+hQJdbCQgW5GbmdKH910DFmKod42QmX81lrapYt1qsVEj5uli4dYfrJu7q5MXeKj0tjrHWVYrwybZU6kX+QwiFLdA6Ct30j4FaHY9aCRcg+dG/jTkTN7rzat2TXQd8+R1HO1vf3Pgl/wSWqRbXWhUOzZJ+N6/6Y3RgLisPgOb4DsOYS51QbapScaW3Lam956ZpCCYmhDZNLTcU4kMtJLLejVXIC4YlER4kez0p1NtT6vY8JmyVhzuV7S59Eh4PT008MeRe9gSYJmobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWIicwDjON2Ptt7DxbfwOM+H9YNETXbZtEAAyHQcDNw=;
 b=XseIGCE9bvNL53p/XOi79EpnkWppZLsM9xEGKMw4wP3KYUwMPxkhXvIK/3CzYICyUxlhnLvZ0gC+ltFl3/2esyqCiISO035QECdtIBLDMbS9kLOBlWB5I2FH2TMA8Va0z9/nhzWovLOmSCoNmiMy9Od5OxZNDFCkrO9B8NWjSvStEwGoLOfEMH3gUDv1CnN1+8qrTpTTuuLjHNFGX1aajgIw8iqhVIonQDs876AKsBkKnKuAgwBNrvCGegMLe7NiR8zgGK4FDw7f2z/jrZWtw/19hNapP6EboG31gHrevXz83rMcMV9Qm6VETpRlu39oYJx6xnbjRp1BE80Cfl+IVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWIicwDjON2Ptt7DxbfwOM+H9YNETXbZtEAAyHQcDNw=;
 b=0A7+Xr9MMc7/AaoQto71n+4JxYijACXNhKALfI2W8GDA4QOMVu+8RVayNYM4cMfGkyRZAWLGzheItlMWC2RVxE2W2bjV7h14/DWrse8dKdS/tZ14OdrfbeECwSlHrNoHHTO2ykcmnIJGqFw7f7T/KBdp8ty5rp3z4/KKvoim/SfdkePZD5jgXo76E/NdJHutdWLGLx8zpnj8NmN4C7Ma1OXFzoX1k0jPjmGgMlQ6JDIRzeLdUO2Vfxf77J9gQlDjdPhZCF+sAq1i7nymYVK6Nyx8xknFiGDeyJ79M5JnlfxHInNN/gqToL2q+vyz4HN9RWt6W3AZZWnpBPxx1ym9/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b961b3b-ef91-1bf1-31c8-06f2ad812c29@suse.com>
Date: Tue, 19 Jul 2022 08:58:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <7c369f0f-f602-8699-6ec6-9fb05b603825@suse.com>
 <sGaL_QpFhQEiJk7_54MdbSxBBCvIi-2gER0UjTpNnTLAE_fK5FaydH3wahN-Flcwqe4VEAMcUNdQqWB1g-LC8t3iCFrFIbFktuVv58Wwk3A=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <sGaL_QpFhQEiJk7_54MdbSxBBCvIi-2gER0UjTpNnTLAE_fK5FaydH3wahN-Flcwqe4VEAMcUNdQqWB1g-LC8t3iCFrFIbFktuVv58Wwk3A=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d29298bc-bce7-4f74-a3ae-08da695418e7
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2802:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X1WR4WkIfPVNghudSgdcZicRP1Ss6bDL8WbinwU9nYlVUy/Hrk8BiGv2IzBtL9jdyZk9jcc5aknglvQzpAyXB9pS/AGZZoBX5+UNIjqvjnVzVJ1CVD2rYHyasWe9oYyUhcuR5rijNA7OpNRV9xG3HedkAvTx4I2Otef7YKBOU7OyJNyIFUZllQOgsx+q8DAVxrXATUkPS1oqTTntnsVHTfoBpR4+DHiUvpl8HUeoIWFrnW58ZEj1WXA9A1oBdOLNVM6lwO0W7LhAdZllYJnpkay8l8iiKoZ7RVNmAZ8jmY583jBNGELDvjrPuoAae2ESZ7016dJrdVj+30sSg2rnLgf0yLCs7yhc/roMil8gVlrkLqrhmSfWmfA8Twzpv2Lu/aKVa+8NCqhz6BjO3T5Xm5AzttCxJaukteKPtgXP7OYm+pHO0yQWcAsSCqQcub/Y634PXmAh/gTm9cQ7l+jQWpZ3cGjTZ6tQgmheV1013dvJQkXEdWZAw5JdBvflN3MUSEiRBdRKGX8R5EGWIBtIBHzE8b05WCfuqLAUQlsr4aGzk86/NQx8RteudlStVtXzE6+JDIdklURcvHfd0JRrEGhOFYZ+f8V7MwENON7VdM8Q/IOwIrrvPMPoukwuAjoVFl4W9y2XFPvtYyus3hZz1zMaoxFVLsAbKjxzA1iN1ksf5yH9OesRFfBUaGvwmTCetnsgcXUdLf0Q1qqDSXbxB8IVGo71kasU7R+dqywkDfUYpszB55YOjNuMhVHAXME1S66sRzAcJpVWSammdeFkypuvJKOXYLLv0UaLk+CF9BEDL62sGHG06uJWN8tNS3Nh7MdJZjTuU/7F70W5+5k2NQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(396003)(366004)(376002)(26005)(6916009)(6512007)(2616005)(31686004)(186003)(66574015)(6486002)(66476007)(41300700001)(36756003)(478600001)(2906002)(86362001)(38100700002)(8936002)(66946007)(316002)(6506007)(4326008)(66556008)(53546011)(4744005)(8676002)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCs3b2tvdHE0SERmcm02OEU3NWxqRUlrbXFWdjJIZzVGamVOdHZrNTVObnNo?=
 =?utf-8?B?ekIvbXZ2Y3F6bDBtaVpySzFPNFlTOTdSUHY2ZzBWOHN0bmxGTXpRREs2QjZq?=
 =?utf-8?B?MGROM0VEa1AycWY4ZkVGOHkxZlBDNWJsVGl3SnQvd0V6Z2IraU1NdHU4Lzcy?=
 =?utf-8?B?RDdIeHY4TWhSelU4WDhOVEIydkNVeUZyUjJwbjNML3JTOW1iTzNKV01FT05I?=
 =?utf-8?B?Tm5KNG50b0FTNWhWbEZMQTI4N3AvUWtnbE4rdkU4b25XaWxPZVdmNm8xZkpQ?=
 =?utf-8?B?S2EzV0RjdWx5RVpob3JsUnRjQ2NwbWkydlhKRFJxeWFLWDgzZVgyanBLbVBv?=
 =?utf-8?B?YjQ3bEFqZFFyWHl4Wi9aMmhkZzYzZmMrSFRvS2d4ZGNhRXFrOCtHdmRCeXVn?=
 =?utf-8?B?RjQ5Ky9MeW5vemFmWE15b2pjemg1TlRKMm9tTlJkVUxJdm9sK2xXdlcwYmha?=
 =?utf-8?B?LytIR096aTVmM0N1QkphSnlaK0xITVFXVXJ6cWU4QzloQk1NdzZuWVFIMnNm?=
 =?utf-8?B?bGNFbzdzR2dWKzJ0RG44OGtBdWZlUG4xZ2pjbCtheDlDZWNoeDU2eVlGdW1S?=
 =?utf-8?B?NGZTV0ZXaTR5TTR3bFJ2SkNHTGVFbm1pbk5sZE5xSzlVb3hoRjJOZ1oxanBG?=
 =?utf-8?B?WndlM1k0d2pEajgzaVVBR21PRXpmQkxFelZpYms2UmUrL3VGOVVLSDE0WWQ3?=
 =?utf-8?B?b1hCdHR3QW9leWtWdTRVckk1aTgyVk1TNjlZSVpXNWs2Mkw0VFBFejVPQzY4?=
 =?utf-8?B?eWQrdjhOcTJFUjhUclRaNlNVVEFpYllldHltZHBoREpqd21wekdPR3FVVzJM?=
 =?utf-8?B?NmhNR1J1WDlVb2ljQ3h0N0p2M0RTT3hkRlBVQkdNWDE5ekZRRFZVc2dSTmk5?=
 =?utf-8?B?Z3BJVDFZc1VKbGxoWTVsMmVGTXBDUzBiWUU5L2hxdkZDWG96WGJNeUtRRE1Q?=
 =?utf-8?B?Qm5yWGtSM2VXV3UzS3paM1RweVQvWlpFUjRxT1Z3T0l5OGZWcml5bWRWclFH?=
 =?utf-8?B?L1VYQ3dwZmY2aFBRRHJJQ0Q3TnNWY0tTNkZydWVGeEJld1JCRVJHRE02MXc2?=
 =?utf-8?B?ZnJEMHVVbU1aUGRMQzNxM2szZkpvOWpCcnkzNE9kanEzaWU4VlpzV0RYTUE2?=
 =?utf-8?B?aFZTVFM5b2hiK1BkaitHOWs3cHVhVVR2Rm9nMHNKa3JrMlg2WUh3UzdNeko3?=
 =?utf-8?B?ekNNMGFrZHBvQ28rZHY4VlVOMWRMY2tJWTRkeDFJT25qRkZZNTlLN0pVU1o3?=
 =?utf-8?B?cU9HbEFObmNKYlRibnJ0d2RoZU5ydDNlNXR0Qm1SM0FGSXNEM2w2K3E5ZzJL?=
 =?utf-8?B?enJRUWkyNW9xVlNDMUQxR3ppNFRJS2NKYnlxTTRNTTlZS2djczFSeXR2bEor?=
 =?utf-8?B?VU93amMxU09mTm15RFQxa0pRZS9SckxXeUxycUwraUNwTEZ3NXRqRlkzNWNW?=
 =?utf-8?B?dnZQYlIrZm5pUWpNdzVtYmdXRVcyeklTd2t2TWlXY21RbkxzU2xFd1E3VlA2?=
 =?utf-8?B?TDE2N1NIRGlQTzlTbHZhNXVMNXJva1lPY3d6bG9LSmJNNFVnSnArbDAxcE42?=
 =?utf-8?B?ZEw4em5MZUxIa3d1dXFXUHV1czk5bWlPUDRJWWgrWkRndFY4cENwWERMbXBE?=
 =?utf-8?B?MG51b081dVFTUHBsWXJTZGJRcC9heXJDNnJKUTUvVlRrbVU3WGVDc0c1OHU4?=
 =?utf-8?B?ek9hOHczamxlVFRZVnk5NGphN2ttdEVMc0dON2Iva0M2VmU3TVBlUk5IRGVY?=
 =?utf-8?B?ODI5UmlpSzk2Nzh4RVNqblhpVmZKc1haZitCL2p2VWhaNzZ0ekEzN2RIRXZG?=
 =?utf-8?B?WGNTYVpBOTIrRnlJWGQ5dW9zKzVSZFJtdERtZHU4SnM1aVBia2RCMU04SSs4?=
 =?utf-8?B?UVBBSHlZNEJBT1pwTGE0RDlrT2xwdG9pNGFBQlRVR3hIbU1TOEdMMUpGN01l?=
 =?utf-8?B?MFYwNHczRnphcUY2ZzBEcFE3NDZzWUQzYmFWMzBwbWZNb1FVdERDM2JnTTZ5?=
 =?utf-8?B?bmRNMUwzRFZXelA0ancwaVQwRXVIVC8yV01Xa2RiUi9wczI2RndMNTlBRWZy?=
 =?utf-8?B?MFBUUjF2cXp0Z0Z5WlBnVjE5aEJaMENkN3ZGa0llZ1N1WE9yU0Exd1o2ekgv?=
 =?utf-8?Q?vT05UE8wuXvI/eH84W94N6sRF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29298bc-bce7-4f74-a3ae-08da695418e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:58:34.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4+jGVF4LwUUi9ARVnjzGZ/Sj4jXrKfzVMirQmPfTvLg7ceq7nU7dRk4q2/9DgR/b9MifeK4SsBWNUkCvyLjig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2802

On 19.07.2022 08:47, Dylanger Daly wrote:
> Yes ☹️, do you know if it's possible to obtain logs some other way for a system that doesn't have a COM port? console=vga exists but I can't seem to flip over to the vga "console" after I trigger the start of a VM

I'd focus on the booting issues first. And I guess you can take a video
of that (assuming that a single screenshot likely isn't going to be
enough), possibly with "vga=keep" in place (albeit that introduces
extra slowness)?

There's also the option of using an EHCI debug port for the serial
console, but this requires (a) a special cable and (b) the system
designers not having inserted any hubs between the controller and
the connector.

Jan

