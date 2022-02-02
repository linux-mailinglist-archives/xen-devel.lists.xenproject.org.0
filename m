Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384AE4A749D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264337.457408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHbM-0000vn-8K; Wed, 02 Feb 2022 15:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264337.457408; Wed, 02 Feb 2022 15:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHbM-0000ty-5C; Wed, 02 Feb 2022 15:31:20 +0000
Received: by outflank-mailman (input) for mailman id 264337;
 Wed, 02 Feb 2022 15:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFHbL-0000ts-3h
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:31:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a392f49-843d-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 16:31:18 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-PM_Vl_j9NoyB7TQU74MzwA-1; Wed, 02 Feb 2022 16:31:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4249.eurprd04.prod.outlook.com (2603:10a6:5:19::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 15:31:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:31:14 +0000
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
X-Inumbo-ID: 2a392f49-843d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643815877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kX6TwZNrNHLpw1o6tkilJNOMi9HA4GsmXheN76YrI8=;
	b=afN6p1On+hXf8yR6hMMI7bSl8GSqcu70U4p0WFHQlOMWFeAuObuQUlRMlzGiVltp/PiTEm
	m4zeoYRfxptVfVgCKJcYFUXU61eeq4Hddm9Qx7KFF/LViwILQCFdfRA/ryzhvPBF0XMOZQ
	gzwmEh3ZW+XiCb1C0T8Xy/Ox1YLtasM=
X-MC-Unique: PM_Vl_j9NoyB7TQU74MzwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBwRm6BuYS2XvcYSqD0xY0vymxfGutbexafmCRKiz6azrfhmpSpV4//plVPXbPtsIQ/GZNZNNSV8T1Gub8IFe6y1ws47LKvlW31qjUK9prAq8pNd+upg8KnMaylZY/iyQyd8GbHPRc+7g0D6EgXViD0MPpRsnF7ylvLsO8PzH/Sp92wKFKKVtAiyrXkn4fz3lCOhVWFeuTGBRx/IC0wANiyk2+5++P5GkM9tnoKmVObled8EYEAMFAhtxISrsEmElURFqvthVj/7qGLlTn+cSfYLq7c55BH0WdnGEM+xpR0qAs11r319NWq+PvOlr0o3qJLYJqIfIUiuUxVq1aN8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kX6TwZNrNHLpw1o6tkilJNOMi9HA4GsmXheN76YrI8=;
 b=PGLpROiDMOIW0HQWBFqWufeD3PlqvsJX8RK70vlo9m/U5TEexN31oRgoRWwCLZqWy+WvLfT4Bsgfb9tWUsqfkrjCGtEZG4vS9330qV6E+300bVyimJiGNGhrjii+WCWwx4wX0Bu6SaEyeLpSsgT4DNx/DYf5qKXdxBr49RkFcLpSskzWyKMLmstOro6J2d4Pe0z4R5LqoYsbAQC8rhrVuze87A/ZByvN+RHY+t8yemeyJfvdkBc2w0h1khK+TFIjuC70RRgtUEzaKmca958V2q6DAFv0wOxnDBMbDpNv18RdE9TKWGYfgXBpl+PeoleJPNFrMfLWXh+mbbUDiaNouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd668a40-c765-a8bb-e0e1-59d7d336fceb@suse.com>
Date: Wed, 2 Feb 2022 16:31:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
 <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
 <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
 <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
 <f93d4d54-a2ac-67c0-8a04-d8321b0828e5@suse.com>
 <4fb06bb7-442f-e041-ef95-daec81e1d3a0@epam.com>
 <3f75acfe-bb88-5982-5f8e-04e0d1755c1a@suse.com>
 <6cc0d636-8cbe-22b0-01fe-b43e92ba7a98@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6cc0d636-8cbe-22b0-01fe-b43e92ba7a98@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3922f6ad-ad61-4e53-defc-08d9e6610c4c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4249:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB424958C8130B85DAB0A09E91B3279@DB7PR04MB4249.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dLRbW3gy9h0Im4cO6/ZRSaaNGB4SGVNYzM4Qj4Fyd+SGU2D/tPTmYlrJpG92TAxU7l6B+n1wAYnyju94dAhYxG/i0sIp8z4J8/26901WV38KX51t9jLDpGGgTQg5ylZdicmW0pR9BnhrRwAHT8A0TOmZdGF/WOluh+Err0Na6QF4xEJC9utnYF/2diVQLPVVkZ3/rSVbB08E4+leC3yEpnfFH+CbmmgWbM53AfGiwM/kNm4hSFPbB6sJBS5IXfU+AKryusjHf1AaIIzZOFOV+ryvUC0IxDI49Vog3/t4vWLwdumoU1vsghYJ2sc6LEzj1aWMFALRijmoFEzIoLe7ndi+wv6qR0RiwcWD02j0JlyZQyRz93YOqdnx1CPKxongvVO32e7ksgrIUQG+bl+dYMYBgu5oIr/S0X7g4VdM9QotQO3ezX/XsKvo+H1qz3oyoVeG+8cxxfHpG1/b0Aq0RM6FwB63sDsoLJIOA/Z0vlPcX/i1U84cuF5GfSHKbCWVMrcH+0cz5XhgrCM5kct9GU12FGYPkG9UVSDo3MYCt6seOEObOfp1E99HFUKHufYYCBlkpqOwx/cmsL39ynJ00dy6SNeqKzpy9DN8I6RHiX1Dr2PGgTg1AjLNccnEGtZ/BOM4gxjztImbEAcFZQSyUxCWCt9zBwMbdyo6TncUsc2wpjmfQx+YntUhPYsteWrmYMMj0bEO2qMl8iWSbw/oK8xzmE9AObvWLMFKtCx3npI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(31696002)(2616005)(6512007)(8936002)(86362001)(66946007)(66476007)(4326008)(26005)(2906002)(7416002)(5660300002)(66556008)(4744005)(186003)(53546011)(6506007)(38100700002)(31686004)(6486002)(508600001)(316002)(36756003)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVFGUFJDQWh1NUxOUGZYRTU2bC9zVmVtUW1WSTZpb3pXaWVjVVJoYzc2aHBI?=
 =?utf-8?B?Q0V1WE1aSnNmMVcxU3pJRnhDYlc4KzZtU0FUaWNCNm9abDlNUFNvR24wTVJp?=
 =?utf-8?B?YWQ1QmRpbjFuVE5aOFNpM3pnblJKd1FMcnJOR0daWGFQK2dQSUJiZGZPb2Fy?=
 =?utf-8?B?c0Rhcnp3ckF6eFNBdWFIQmRVN1dpMXVVY0huNk1aaEdhM21VT056bDVrN3VK?=
 =?utf-8?B?RkRFMXZuNHhsWURUSHNsdndWRzFjOUp1TENReTFIdGZYQlU3NnllMVFOMkY1?=
 =?utf-8?B?eGVGUUJPc2VrdXVNZlJ0TGh4RC81ZXkyZHhPWjc4SFZ5QWR3Rm93aXdUQVJa?=
 =?utf-8?B?TGhtbzRLNHpBQ2kyOFNmNWpmdkFNcS9XY2Y3amZXL3ZIS2VWak5PeWdyMWZ1?=
 =?utf-8?B?L2FhWFo5SjVlSys0blFGZTExVmpxNUxlVGxYZk4yaHBlQW8vYm5YTmg5WXlz?=
 =?utf-8?B?SlNXZm1aU0wxbWJBYmFqYlQ0V2JNR0cwMXcrR0lubS9zU0t0d2R3QjBnM3A3?=
 =?utf-8?B?K2VlSmc2cFAzWXI5UU5PSERmTlV4ZGNkSkFyTWk1M1U3UkVLOHAxZTBUejlZ?=
 =?utf-8?B?aVdGV1ZpSkc2Vm5lK2hlb1lvb3JtdnRlbnRPNWVEZDlvb211ekYvTjVQb1dV?=
 =?utf-8?B?NzlZckh3S0pCNzVwS3o1MWFrMS9lQ0F4WnNTdDQ1VnpTRDlqVnZZTGZLVXh4?=
 =?utf-8?B?ZVNBOUJmeEdzYk9PS1plTkl3bFpRRnBTRnRLU1FURXdjU3RaT04rQXNtU1E4?=
 =?utf-8?B?L0U4L0V0WkM4elJzNkxNRkJ2V0VSdmkrbU9YNVpqSUdrQUZURFNSN0JpN3Ex?=
 =?utf-8?B?Y29jUElTOG1JdklaVUdrcHFseU5lbW15SHcwejl3ZjhjY09HckxQR0VqV0gz?=
 =?utf-8?B?Y3VXOUg1VndPcXB4UUt1SDhSNDVLT1doWGhXWjlhV1NPcHVyaDJ2MGF3L1JH?=
 =?utf-8?B?azVEN0lFbXh2WmhCTit0bmcrS3EyTmdEdWlPMEpkQ2dPeXRwbmFlWjVlNjZJ?=
 =?utf-8?B?UjYyT1pmL2U4eWwwSWdGMkNmV2VxcisxUGM4bmVrZnlJalgzbjkreWFnSFFo?=
 =?utf-8?B?Y0VEdzFxRmFtSWJHTWd2SmY5VjMyeGVyWSsvR01vMDYraXg5MTBOV1UxVUt2?=
 =?utf-8?B?Q2xvdytpRUhMa1ZvY0QwdTlDSUJNakZxbFZTZEs1bmhFU1VqS1JtV3UrM09Z?=
 =?utf-8?B?ZnRZQUYxaTdBc1ExR212eHlvUWk3clgzOVpGNm92aWZ1YmtDTFdzWWQzM0ln?=
 =?utf-8?B?L1F3ZFpEZFpDZDArTkpMZnAwRG5UdFozNnlwRVpZOGdINnR4U0Y5UlNiRUMz?=
 =?utf-8?B?YS8rdFB0dHhsRDhkcHBHcWp3Rm9URWl5SVI3VzZ6MGxnV0xaNVZ3Y2NTd0VB?=
 =?utf-8?B?QkRBMXpKQ1JVcEQwR0IreDU2WXJzc1lxWnl0RExHMFRJTlBZbmNHZFY0OFpI?=
 =?utf-8?B?VWsxNWRKbldsYUFXdzQwRm5vRnVCOEZTNlBETFRIRmZvVXlZbUZvUXIrcEVI?=
 =?utf-8?B?TXpLbU9FSlE2OHYzMHFrUVNXM1VUY1BmWThCUFh2QkIrYkFQSndoZGR1YVYz?=
 =?utf-8?B?aTh3cXgxNzFkcmpYTlJyNUVtZDdKeGduVXZyQmloeHlLamEzOHcxcENMcFho?=
 =?utf-8?B?b0lFZkp1d3VseitnbGpvUVNteXFnR0creUg2SHJveHRiLzhUTUxwQ3MzMVhn?=
 =?utf-8?B?SXVFM0xQK0RPaU9wRHNQY3FUNEp4QUQzdHpzOVZrcURBVnBFVHRXTDl4b3k2?=
 =?utf-8?B?MjRlVFJBMTE1bHlaQk42RGpwNG0zN2ZYS0YvKytpZU1Wc1pXcGdLS2tjU1lV?=
 =?utf-8?B?d3JHaDZzN3didFJGblk5TmF3c1pnckNrWmpqWkVXQUwvODFEbWZ3M2hXSkgw?=
 =?utf-8?B?a1pyWVdIampWaFB2cmlZTEJtY2hkMkZ3OUNoQUx2RGJla0NGbVFRMkJrVUhW?=
 =?utf-8?B?d0xrZm5lNkU4bjVqRHRTSlBWNkNVb3ZZekY3SXNhRE5VODhSdW96WkNtb1VL?=
 =?utf-8?B?d1oyTmdwTm93YTVtWDZvSzdtZW9VL0cyYWprL2RuVzg3K1JPSmM1aXFCNjhm?=
 =?utf-8?B?U2lSOVlPRVFGM25CTW9UWmZHdTh2N2lvYlE4YWI2YVQxYzhpVjFISHYvdE14?=
 =?utf-8?B?eVdjMG5COXdaNkswVytxcWZNOXViY2QxSzFac0dHUnZzb0FmZjBKblJCWDZI?=
 =?utf-8?Q?TPI4LYmW4BQyEsG2UF4r2cI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3922f6ad-ad61-4e53-defc-08d9e6610c4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:31:14.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+N08SdNxFvh6idbZKYDXIhlXUSS19dep5nDecIiekaC9zzHRSY+r0hMb1hqMkkUUO47vTWUQVpYRFnh0Cz4Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4249

On 02.02.2022 16:12, Oleksandr Andrushchenko wrote:
> On 02.02.22 17:08, Jan Beulich wrote:
>> On 02.02.2022 16:04, Oleksandr Andrushchenko wrote:
>>> Or do we want some additional code in MSI/MSI-X's control_write
>>> functions to set INTX bit there as well?
>> Well, yes, this is what Roger and I have been asking you to add.
> Do we only want this for !is_hardware_domain(d) or unconditionally?

To keep present behavior unaltered, I'd suggest to do it only
conditionally.

Jan


