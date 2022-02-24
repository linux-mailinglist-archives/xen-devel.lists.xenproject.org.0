Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CD4C2E92
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278329.475527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFJl-0000qq-VE; Thu, 24 Feb 2022 14:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278329.475527; Thu, 24 Feb 2022 14:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFJl-0000o3-Ru; Thu, 24 Feb 2022 14:42:05 +0000
Received: by outflank-mailman (input) for mailman id 278329;
 Thu, 24 Feb 2022 14:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNFJk-0000nx-2v
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:42:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede06cd8-957f-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 15:42:02 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-Wni-O_7xPAOn37SUJ0MucQ-2; Thu, 24 Feb 2022 15:42:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8814.eurprd04.prod.outlook.com (2603:10a6:102:20d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 14:41:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:41:59 +0000
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
X-Inumbo-ID: ede06cd8-957f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645713722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNpsONnuuYEHWystxacrr26pfEyNCoQQXi5U/YMjpOc=;
	b=CciO4LguZHaKgm1ye8mLLRuHMiZU+iEjcZF4fUl8iPOEvJkXaEZtiVhAD5bDGZxCAhTs06
	sMmuMr/LnWLakouVdoCoBOb8EbgItOxkqJ52rO79AVIDmHaQsyvTHFWfSAvWVst5fv5x8x
	UgHLNMc7RqrTFxkHYHepdeCc01/XaEA=
X-MC-Unique: Wni-O_7xPAOn37SUJ0MucQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph0vZoWiFGZl3hDfI+X0in0CkzlLjUJj7hrLjizb+8+SOc0NvpiguXBSfmBPXj0Vuv7b/yNT2GrBnHLxVmtkVMjOptlNm6rIk3bTZtIW28IECT95/cGr6z+pcN3s3qXF6Emcrkas3yc6iBw7Rdd3G2+T6Ze4Ni6hF48De7kHL2mudevL7dCPyTngPGUllVlAvDzJpyvVpRyaJVpWF4JYPcgGHse5oUae4kBGX3WjZTXDHdxqe1l8zt7pet2NIpt+yPj7cfD1ovb7lyKvD5BQqEFewl/HKUWthxAj5e5HR/fh6cAcKQWasQ1gw8Nu7ERodGSWlkKqpJyxz3dskEEaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2B+OsETm8MxC47cmWXt2pUmYY+TrnfqvkDqckVSlsk=;
 b=FKViJIhQ83uL4UXegLbwyfeSdX2aEExG/7WU6Bc6ta+XgJD/ZPyvSmrhT6l6mWv+Vk5RefPpkY+YODoak3F47N7REqjeF73bsFHZd7fFzAHhR71yehCB9KjgYS9kPmylWCTf8/wTTNCEjq3gaGVzQBQT5CMFPlvrE+KHZdRHV5LDVW0daJzJsD811w6+CH7dM1RnhZQTZhcYijy2nSvHWoUp8h9kJ5w3kh9FMBIS+XqlpXgnrZ6OHukPgbQmdhMuyHM7FYDJdl1Wu26PBOcJZK/LqBKGQWoKbdezucgsZ09qx6Ib45dGDE4e9p47hHILPLYvNBNXvupl2yJtOQx7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <367aa0c2-1ab5-fb62-e8b1-42fb20394081@suse.com>
Date: Thu, 24 Feb 2022 15:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] x86/time: switch platform timer hooks to altcall
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
 <YheRtlnodHjyQuYW@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YheRtlnodHjyQuYW@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56df8de-8847-4b44-dffe-08d9f7a3d011
X-MS-TrafficTypeDiagnostic: PAXPR04MB8814:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB88142AB046051CC718E4D537B33D9@PAXPR04MB8814.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pSCf1mSwvElT1Wv9kKUTucOvphCT9hOteJttFemBuvDzAP0Od+CpaoeRlTYiZ9gBbBEwnZ5tvmrEQgVOSVRMkkg5d3oRvCOtw6PJOdMhUafbK3UjVw6ipCOfdUpAtjDHEm5kIXaD/ZJHJ2RSAGtjBiF9kH0PprDIu3irH9tO/OryJPa2SjFdDq2RLrL4tvpB9+Pj+Tr4UIA89B/7Lw5BLAXcxLr/FTGT//9R5cYsXNa1VKR0Z4ANSyw4gmUJM8gyWtIBfl71fsrXDbBNaGrcAokFgkA6iR9i2sch/bf4l4Xk7kK0tWuNn1uaz35UllO96RHA7OpLrsSg3HhVStR5oM6euUgHHhsw47RX44ZqZIaWdv+2Jz2RdC725qaIMMvEPp8OZV1feG+1TICeq3M1BjfUK30G7mWbI13Br0g1fpp0VxpysqRReGrbfjPnDI7cRgWjLLkpHUN3QQA+e1VNtND4pT9cxmXP/825B2qWwG8D/IEyGbXgTS8ANpym2U08oU41n/JEV0p9OeU1c1DatduIXUoElEO2XV18kahwCkhG9DYfLf0mc5QdiJVg3jPI4WjJtEiZp7Hwgkw51MMbx30LZERs7ZbL5aRyLzHH2Jj7XgT9ZVwJ0pBuwRbDQrUpZM68AGH8XUUWK5TekikAiRMjktCWbkiAZCe11SjScBhPVu5dxPV0woNYGLKjAH2StbcasOD5aC28DWbhYZWB6vabdEHKDK5mltA0Vj70K22tctd8or4rdEqBrfFauLl0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(8936002)(8676002)(54906003)(6916009)(316002)(66946007)(6506007)(66476007)(66556008)(4326008)(38100700002)(186003)(26005)(53546011)(6486002)(5660300002)(6512007)(31686004)(83380400001)(2616005)(2906002)(508600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zWlJBwSBqtVjySK3dlGEeEWfTPiBLMyik+JTX6+BRoMFCmCBJU/ug9ANeXi4?=
 =?us-ascii?Q?k8FBgqwRLDgI8Tj0oPLHnbAjRtvw7xT9i3T+swZF4PII3skJZhiB72FIFdeZ?=
 =?us-ascii?Q?bNHOAnMcbZMnfpLslhJErXu3AWRD3GaniT0H9vKqvyHWTA6TRFBgGtHuwMOX?=
 =?us-ascii?Q?g7ms7hklYcP9x7LIKULxpBN5KobHkQGcFG2sSzEK6Es9FzCz7C3lr8d3vHqP?=
 =?us-ascii?Q?SpAgFdzmO9qkouRJVvQmMADmYxzIjP+Jr7jANTIUaFMVDudDnfIs0FYAImZJ?=
 =?us-ascii?Q?LhjC4hD5OokyLMWb5t+r2FEIlSEbqEcVCgpaF9FbhdoYFyB1NO1ebIvuKu3V?=
 =?us-ascii?Q?wIXQVt0B5N9skEdztwg/vCbDsKv+/zNBIZNCeyKqxrE0fWKDwxbgilu2cdYh?=
 =?us-ascii?Q?z+Ye4EvzqeN77Y4m0FpkHVvwyNQg5RUYUiuzLiChnQ7dNHTLuE6EXNZnw1/q?=
 =?us-ascii?Q?ZG7+qZFvhMGwr5BEBBPODqYKw1/nTeDRLkXqVID553TdrzpjzDNahamXHMtj?=
 =?us-ascii?Q?6m6tXowlnTJaz0etikIQazOuPIIKlpfp9nfMwGLTTJvvsZYpRjJuyKdsbRRy?=
 =?us-ascii?Q?H1HiqwJKIF9RqKfHCZyH4IGL7kX5aqlYRQsfhwnGMDlnazEaiX4m++aGm6/g?=
 =?us-ascii?Q?TxRi5Fuk91AZZtVmqlpIMAyyATBCi1TAXR/rpbPVfqRXQR2GCvCtmrvYlIm9?=
 =?us-ascii?Q?0C/XQOwoCgyRfe8xRJ3QbQmAS5vKmvfxpliTV7Q0xWqiPU6GhhBnGFy9ubQU?=
 =?us-ascii?Q?wTKybjjc62vm8Rifks9jw3WcogWGVWGP1lIowwRKnrrWaPlAtL7EzeZ87NK5?=
 =?us-ascii?Q?X9WfDUESj4euSCbUhJkQ/F1ietzHRJoj08uQEXagWvpPJrfckv+2sEqB/IKK?=
 =?us-ascii?Q?FPwGRzRmtW+SWYkhWpf18vsxP6CvojVuIPSksL3idpihnk9y9U5441KlW9SN?=
 =?us-ascii?Q?xwqvqrPiXol2+a3muLlqr7WZG1RcMzxRMGZNvF2V49LvGTerdh9+0lcnDD4y?=
 =?us-ascii?Q?+XCUYw/VXS1HYHWHydVOfPh647TE1vRt001mtZNgwd4Y9DqovlvPe/MceRLS?=
 =?us-ascii?Q?8fiFoVYUylVnKGJhGMU0XaYgiLpp58WycicQDK/dH1DEcSVgkI+7pv0ZUvan?=
 =?us-ascii?Q?zhDCNAbmSwS43iOPgazpEu7ipPIl2YHKFNPUTx7J59pICckWhfgikwWgNKiz?=
 =?us-ascii?Q?JQqoUrX+dtVWi7zTgPH/VgUHH7kATFN1CGxldy/muOrYtu3/q57R8MzMkQ0b?=
 =?us-ascii?Q?VfgzxlzF7Ud5Cd4gn9DRhJ9qj8G6KMf9OHM032Cregswgak+jFUDqzt0lzi2?=
 =?us-ascii?Q?ZNEgHdCoA4HYwWUiHqz5QSVeS86au+/mJwBFejBJDUifhVxxaJgPBvEh3Stc?=
 =?us-ascii?Q?dFidOqMeyuCvjj0roHfYzLCVaGp0m7lWnhHnfkujCWtq4xxvwA4HZA4nB34Y?=
 =?us-ascii?Q?ZqRYdgrWuApk3Bt58KQ6BlaShNizkcE5xTzwEuWVpBkP5ZRK4qBARMJa0fyc?=
 =?us-ascii?Q?kYVjZabJJeQ3/51iOT8JFqv49gkzWQuutSSHQVIgZdE8A5TBp4fBUZfegmg7?=
 =?us-ascii?Q?6V8sWIee05dAp+aht+MgPx+bAlJGKc9UfzxmkU0g5tx8Zeh05M7o5buUpjot?=
 =?us-ascii?Q?wwjRkY39OYNF/7TtGuseoPE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56df8de-8847-4b44-dffe-08d9f7a3d011
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:41:59.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY0w2mppMqjFzJCh9eTCRgJj5uwteqvRa+rKkx1b4CyNyj6mWINDzrFmCHMi0Os4d9id3grGQ0U69ajninq8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8814

On 24.02.2022 15:09, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 13, 2022 at 02:17:18PM +0100, Jan Beulich wrote:
>> Except in the "clocksource=3Dtsc" case we can replace the indirect calls
>> involved in accessing the platform timers by direct ones, as they get
>> established once and never changed. To also cover the "tsc" case, invoke
>> what read_tsc() resolves to directly. In turn read_tsc() then becomes
>> unreachable and hence can move to .init.*.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> TBD: Instead of adding __init to read_tsc() we could also ditch the
>>      function altogether, using a dedicated (non-canonical) pointer
>>      constant instead for the .read_counter initializer and the two
>>      comparisons done on plt_src.read_counter.
>=20
> I was going to suggest adding an ASSERT_UNREACHABLE, but not sure it
> makes much sense if the function is init only.
>=20
> I would be fine with using a non-canonical pointer.

I guess I'll put in the patch as is and do the conversion in a follow-up
change adding __initconst_cf_clobber (once it's clear what to do about
structures which are written to).

Jan


