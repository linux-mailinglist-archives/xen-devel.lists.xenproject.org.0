Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B93B42FB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 14:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147149.271029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkig-0006Tx-Tk; Fri, 25 Jun 2021 12:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147149.271029; Fri, 25 Jun 2021 12:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkig-0006S8-Q7; Fri, 25 Jun 2021 12:14:02 +0000
Received: by outflank-mailman (input) for mailman id 147149;
 Fri, 25 Jun 2021 12:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwkif-0006S2-ET
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 12:14:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cee7c8c-7e69-4ec0-a83c-9588e67ca901;
 Fri, 25 Jun 2021 12:14:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-DYfn8cHCObqv4jotVFZQTQ-1; Fri, 25 Jun 2021 14:13:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 12:13:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 12:13:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Fri, 25 Jun 2021 12:13:56 +0000
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
X-Inumbo-ID: 8cee7c8c-7e69-4ec0-a83c-9588e67ca901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624623239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=REVI6KfvtKXwhN8n92x1KTdF7rfMwP8XySowAlfxpxM=;
	b=A4gDzs/Fv4fWrGjEBSXahIlW9RXn/I0LeYwzf+Vq1pTr6bZolt0pDiuQRUXx4jRnTF/UA3
	ruTWYoKLLBrR45gGerD7gIBD1JQ/3YEcqfyoDmIWTpfejgEe4csjC3dGGboU1NtkRQ2eo8
	VQdWY843Goe2VO62EaIgkbVQZ6zV1Nw=
X-MC-Unique: DYfn8cHCObqv4jotVFZQTQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2KmfKLwYw6+t/iaM39jwrQ3D20uEhF1os0nmr/wvsRV7R7rF6vNQFOx0XkFZW/4KStnSf4bE9oYPHkqbwWbj4GucxaNnOU81ue6/7nxBiDW9G6u4RJEPQ4GLToHBAWDWmNRS3HBF/7AzEz8vryNyHX0hvHli43k5h6FUjkajQwFXQzf9ufxnNZL6/27lIda4Ze1ImPVW1w9S5gMvcvovb1CfDyqyp8zRP6V0y1AxTFM77Im9V1GZD2pObd7JS6aKzIJ5NVF6LS5NLWH5RPCDCvIbK2V9pOKQ7nLmzVKH4SXJXiT6QmvQCSQhJC95B8dffMwXPEqAyRCeM63EfvOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REVI6KfvtKXwhN8n92x1KTdF7rfMwP8XySowAlfxpxM=;
 b=YTsiiP1T5dzxkkVPx8SrhUWPEXnUcpoRXo+XAkDADUFmLtl3SDF7H5b+fBnwmqNpmFf7a8R7cNgrEkrI2UKH0CyYAiFCxSMSMSET4uWMuwCqmEPnKr0aYe0xCJKwH6Lr1iJqD6dpXzPXZj93DBm7aI1ymcGV+5cGzj35fe5AXWDc5rKF6QFj/z/fuj0+U3ZHSO+OdEY1FbMqb3mVdSUp7hWGfHBI/5AoRUmYSeoVbnoJvSthwEwaQ5GqBG6oJgqEwWpgvPefRbSfF0Ct8F8PKYIg/rg+Jbsl9HV6484DhsavsZL6vol0s+H7y9nU62fpiZ9mpNeCxy2Pjo9l+liAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] IOMMU: XSA-373 follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a6e72235-570b-c426-589c-236f37749e1e@suse.com>
Date: Fri, 25 Jun 2021 14:13:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ceacb33-89bc-4f83-47ac-08d937d2b4a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742FC18C707053FEE94B489B3069@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VWRY9TnROdG7fuDNHf8qLsfspnZnq6LHMtn0LdU/DD6q1KjPeStTPjOrDuRPBu4WdmSOqv2ZxaKv2gtnUqdoZ9GpkzGPJBO0AS+YinlF6PH5smQzRX5S+1Wfrbn8tixCWRYipOpKDo8quQ+qosc4zewVuPkVBTZabRQ3/yt0K5ah3e2ykPo35CBdRCC1jz2xZ0IjeziTb+/ohRJ1cF4rFmbCtO+NXPbwl0SeKE2wMLwBNdP2VhkNcUn57v34Uuy8hkE/OBRJEF3/Pb+zXwZbh+xEu2TT0dgURNU1pt8SCqfbi8um+YmbPqRQoAMAFzo+L9XVQtOUtj52W4wpfjw/V2uLBcSTgFVZQPbugjECAbLw5o4w5GW3NLn/8WpCiq1FJbPvZnaffpJ31R+tX7+Z9rCgG5MSg5XfjqJQ2lLJfiu+u5b04qvZ28D6wAqhlLXT1ozmw8ubS8P73IW0yS5tKQpydznycseaJA42Ji3NRDq04WLYLHQLy++lysOhGLyd8AOOL1F5MmlKuaKCULNAVha/tNI9qcF20bVCKkRTTFKNpc5HvwPgGS0ZX4M5WqWe2ZrGsA+4KpprXEwPeDaNLe5PV2LXFIieagXIq3k3hSRIuld3H89qpHKHOjMusNlVihGIhSjv0AQO/iK3UL+NodX8dnru2Ax5/gY+e955RJTy2ZKcGmE3Sq7z6/UrNmY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6486002)(54906003)(6916009)(2616005)(2906002)(6666004)(83380400001)(956004)(478600001)(8676002)(8936002)(86362001)(4326008)(186003)(16576012)(31686004)(26005)(31696002)(36756003)(16526019)(38100700002)(316002)(5660300002)(66476007)(4744005)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5jWSsvVlQva0JIVkduMzlDMzZSVExTVWQyRytNMnJ2bmNhRm4xcjExZ0FI?=
 =?utf-8?B?bFp3bmorWVBwYXMxUjRQbEZvaU8xTjNmL04vOHFJUEJLM3FQSTE3ZGl6NmVO?=
 =?utf-8?B?SjhlRkxzREh4THdtSDVuUlhaTXpHNGIxSHgrRXRlK3pXN2ovRk9GVVZUbTZM?=
 =?utf-8?B?TnJmSExWeVVJNTBILzduc2o3bmhyemFpbzRSdnk2d3hqdzJ0ckdxajZoMDA4?=
 =?utf-8?B?cjdBVGZTRXVMSVYrTDNKcEVDYTlsYUNNejZkSnd4ME1RQjRTd1liYjhydmFx?=
 =?utf-8?B?RStFSVZ5TGorTm95UEl6anY5UTZHSzUrS1VPelBSakZkZE5yYTB6MGVaRThn?=
 =?utf-8?B?TldpejNBc2NHMVBmc09oUVg3V3huVTlnR1hsRUhUQlU0OFVxWVJmaEhHSmtn?=
 =?utf-8?B?TFFqQUVEUmxoUXdXOWN2enVuQlRqb1hGb0ZLN0JMNjdYT1RuOHRYSGdwVEdW?=
 =?utf-8?B?WXU1K3JPS1ZRdVJnNUt6T0pyS1FpQ1ZwbEtLa2l3V04yQkR2Y1JYRXh6SS9C?=
 =?utf-8?B?MCtJazc4aks2MGl5QXpKWDhyMU0xdUViYXNyeUhiRUxtbldmVGgvNG5pcTdr?=
 =?utf-8?B?dU9pcWU1SW5yT1pCWU1tbWRUcFFnVHRmLzlkYVdpS045ZWNFUC9XUXJxTTNO?=
 =?utf-8?B?aE9xMm1qakJmOE5QYTFtdGdieGtXdTFtSFlyRmE0d2EvblBUemVUSzhKQmdP?=
 =?utf-8?B?bUZERHRUdWRkN0tBNTRVeDA2QllHQlJEMGVvNzl1WWVOR0FGVmVmb3htT0x0?=
 =?utf-8?B?NXBOMFhiZGJyRUpoVEQ4VVkzZWtEZWt0czRnUWpWRU9hclRmY1dRRHkzQllL?=
 =?utf-8?B?S0xNMFpsZWZEcTZTQ2xGL2NpanBGcFl5WU9PY29SYTd3eW1FOWtSUkZ5YXF1?=
 =?utf-8?B?aTNUUnRWMXlYOHRHQ283VGdOd1FtemVZOWRuUXNZUzlJL3dRRnJQeTlOcjUx?=
 =?utf-8?B?VEZEZWhFR3MyTzczOS9ScnI4RVdWanNjeVQ5OVBhQ1FzSXFxMWJFbWswM1lw?=
 =?utf-8?B?eEs2UTNyOXpwQmpRUE5ZUHN3NWF4cG1JVDlHUTJDQVdrL0pTdlE3M2dUd2Fq?=
 =?utf-8?B?ZnUxOTFKR0RRNE1yVklXM2swbXo0dUlTTnFSOXhRTTUySUQ4VVc5bmxFNEhY?=
 =?utf-8?B?RmVrdmxRdkhDWm5Ea0psRVJkL2FTdHJRenFjekh1VTFEZ2dKMGplUkIzT1FM?=
 =?utf-8?B?OGhkS0NIaEJwV0JsNHZEZDg0ZFA4SS9rNWFGekhuSUhMMG5PYjZ3cWk3K3pT?=
 =?utf-8?B?eFA5NTVPcVJ2WWpRcytOSks0SzNjcm9MMXhTcE4vM015K2YyZlFzK00yTGZW?=
 =?utf-8?B?WVpVbEVWM0pEYzBmSkNNK1A0UmZES3B3RVAydWgzMDEvT1h4Y3VOS3Zrd21s?=
 =?utf-8?B?VE9tWkE1eGt0VzRnV1JHRHh3dGtFdHhrYjYvWmJOTVVaOEJzMGFNR3MwOExV?=
 =?utf-8?B?WnA2NEVwbE1uMmRTQ2VaajQwK2xaT2gwbnZvS3I3RW0zNk9ZMnM2SW94UVBw?=
 =?utf-8?B?ZStJem9XNXFXaXNMS3Q0VWNWQXp4RTJkNTcvRnJVQytXQllEMWtIdm1QM1pk?=
 =?utf-8?B?dTZXUVV3OEpXNStxY0ZrdERpditFZGdZa3h2U1BuZHNjQVNJb1N4MEdGckJ1?=
 =?utf-8?B?Um5XZEtUdm9oNk1RczdwUHJHWlZCU1ZQeElTOS8xSndRUUloUFpzRjVpMlRS?=
 =?utf-8?B?eDQ2RWhnVG83QjdJQTVJWXdvN2lvQlBqb1VhN0RLT2tza2dRTW1HUXRybnI1?=
 =?utf-8?Q?ryNViqn5ijb/VpJlt/WKvFuWw96vOmYhc5e0BwO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceacb33-89bc-4f83-47ac-08d937d2b4a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 12:13:56.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFqUYkWsIbxvSX72GzBMVRGksfNMmIvij8H2xfjZdhBEj1OnE4q+lBtsPeNo0+mIs5ReyvsotVsM8WlqnecVzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

A number of further adjustments were left out of the XSA, for not
being a security concern (anymore in some of the cases, with the
changes put in place there). Only AMD side pieces are left in v2.

1: AMD/IOMMU: redo awaiting of command completion
2: AMD/IOMMU: re-work locking around sending of commands

Jan


