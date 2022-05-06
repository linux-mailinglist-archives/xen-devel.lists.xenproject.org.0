Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A051D5C1
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 12:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322886.544352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvA7-0007tT-Js; Fri, 06 May 2022 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322886.544352; Fri, 06 May 2022 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvA7-0007qa-Gq; Fri, 06 May 2022 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 322886;
 Fri, 06 May 2022 10:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmvA6-0007qU-31
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 10:26:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f53cd8-cd26-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 12:26:12 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-WZR22LKOPh6taO9J-Gn2KQ-1; Fri, 06 May 2022 12:26:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0401MB2505.eurprd04.prod.outlook.com (2603:10a6:3:7e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 10:26:01 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 10:26:01 +0000
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
X-Inumbo-ID: f3f53cd8-cd26-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651832772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbnpP/3egBtL4ZVrLWoaM3TVWYCSmK5xk+Mr3WSUwYg=;
	b=nmFxS/Z6cM9gvPEem6fKCcQ4OchEBaalDm2pCO6w2iCNs/92oN4/a2B3Y8+yVZfkQGIpWy
	QkrMcUr6wfvnFoYEAHXMNv4xyWt3uLJGlBpCmvvJJaqpHvDA61ACw/BUz/q5V73vtk7ea4
	aHAdpIOprsf/68JpjFbc6iUoM2U+w4M=
X-MC-Unique: WZR22LKOPh6taO9J-Gn2KQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/BCjMHi4wzhCBqahURwlrO/8DC3bteRpDOekgrehIIxx2U7MF4mG+FfeZtTuy0eyEnMtwkwRFPcjmqOW0y7hoeSbCfhFzjt/hfKVgol0eqiMMjQ+3ETg8OTKFcqK9jTfa2JK23mBHxdrdJcBSYHv3RgGL6TKMyGkl7LnJmBZGxxDI0PRf8C/w480W2bPF0f2lbeeoJtB2DY04CFUnf8BU2aH/3FuL43D6UNehTasKEDEUZ7mgLSFph5uMRCGsk8sAcUEXGuvLsiy3oe+Yi7LQ4+On+J0aAdnJgFf6b8sVBoO4ydzmGmzB3WSiWeUgBLQic8yRlxqzNlHN/R8R8nKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1/HN3TYj6xdaitfmXgNazLjDH8rKKK5HfSedp9HooM=;
 b=PJKEpw0Uer6/2eO6+L7I9BTZOLSR0iCtr3+enuqBsCGOpecugTkAHomt0C37mCg3Dh0aFN9hAvhfD7PRRL5txBNrgqwFGKXdem24XjNT8DKJdSYptdb1+ymjoMUCbyoRG7Ai334OwzAxp+vp6oKFRbVS5In8pF7OBc+NDd+1xkHEie4HOkUBKUrYCbPRWC2MF6yIccKSntybFyQGEUbfT43PLSaDCQNCHGwxWGv3ZdR/AH1swU7jOf8fyXf82RpMZ4vUgUUjz2Vw7SOHRe/aMvOykOYlGP/rV3BJPOAurGGh0uYS3NzlDjOWzb/BiMhUIFRaLP5Cw1zBOOU/fgRidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b372700e-ac21-5752-c063-d4fbeefe0766@suse.com>
Date: Fri, 6 May 2022 12:25:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220505142137.51306-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505142137.51306-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ffc7f0d-29ca-4a19-6937-08da2f4ad13d
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2505:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2505B3E82C61F12CC75D7C9EB3C59@HE1PR0401MB2505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vyzZ3dutDQNiUqZ0XtrZguROcpNVqy8QOhsR2Pyem7WQ0879LtrPwTiYYnLcwx1nLpBcomQuFMksDmpicuFK7+d1kE0ysLO94VHSzwCndoUkMy5BVo0M2alTXyQRBpYwe3lBy3DUVGX/oefBd99NcIaY773zcV1GGlvhobkaXNJEpmDZVkAq6OXGWIghtNlsdE8qb/yxlETPbizJ31gvlblC0LSLB8+tOKlhWVdaAARHZY2NocdRK2bLLpXKJoTHSeagP4bJ2wLEYSOBXNy6ky2sJDPHHVtLe3JkjMZ+lVRj7hJTyIk/Ozb9KR8H2z533Y4XnQb3lhn8S5683jGs2jNu0USbzq7fJoR4z2AKxxxMTUisA8RsYOL/91IDO/SjIQ135lQxR8/dBXmtxBkrIiEsprshkGhaHrUS2ZfYMndrV04OOVGVtYciUp/m4wAdY1cvW+gLCVbJ0PjaUDmokRjJCXYeA+Rb/VSUYgL0DkxRuRS1RzRV1THpvMQkthFCWiU+s8Sn8vszx6qYJu4RJnpxMoinAqGX9stFdmawN9iqY+C5Gy+2ivIySW4jbcLZ3gIIe1Tz6ZxWvHUPZnKaDDS0FLNRdR+O9a9r9EPY1aE/js2c5DOKDBfG6vUEKOo5rDW2S2UkmWRQOGzHkrw2Dw93K8y9Hp6wziHTkqyhsKZXK7nZUbKmju9aQRwA0X5EdtHBs6oTXj0jlGWwgQCHJZbNAPQd93IV+8lgzdXwYyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(5660300002)(66476007)(66556008)(6512007)(26005)(53546011)(6506007)(4744005)(6916009)(36756003)(54906003)(2616005)(8936002)(186003)(2906002)(6486002)(508600001)(38100700002)(86362001)(31696002)(66946007)(4326008)(8676002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LJJgRY8TxdTi50rk8dtfJbsCt1vuEGbPj9TN6Gk3sBBT6qwv35U0jkutNf8e?=
 =?us-ascii?Q?EeXDRik2aJpzkK5cPlXF+h+nXrayui6SO2W4goa2tajXk4guFZyZtdKnmz75?=
 =?us-ascii?Q?doDT7Tt0x8gEjk6fuBZxq7UlvH3fpZsyb9b9oE3cntWi9KSBeUlbQVJpNylP?=
 =?us-ascii?Q?FoWhppnkW1LFHe0IcsooB3xCnIDsiMo4dPGDCCDW/rvak5a1Cb2MjUtd1+eA?=
 =?us-ascii?Q?4gi/usg1Ka47NCvLohljnkyCMD1ToyUqNshcIZCWIMZygKyq4i3dQLsBXmIK?=
 =?us-ascii?Q?RTGJtZQ/4tAFa4VhjPAG8CgRfpgjigWMW0gTFp40xJ+MUIlApICiunV6ckPW?=
 =?us-ascii?Q?NZv98VE+ORoLhblx0IQpOTxuZP4ta9zBBYXP5aiChnKpVWDektLlTzfUSyai?=
 =?us-ascii?Q?CThGk+GonwuCLXJGZ8WwCuampjolFdgIjCP5sQtjbZil72IUWAYGBXIkyMpI?=
 =?us-ascii?Q?haFeSGU87dbwtI8szUjMtewEqtpy5TqgvBk6o3cmZkf+trWiFm56jfwgnIAi?=
 =?us-ascii?Q?zZwYtX5LTjmKNwSOImaq+w6n8U0sFLSKvZHxqgw+FnGCxVJ75X3gTLxtykDf?=
 =?us-ascii?Q?5drBFX5lAj7GmKjDMiNg8iNsLHV+/44GKh8QEuKxC6gpPzGUhpaDzCDBakVg?=
 =?us-ascii?Q?PJ28WoQa7YOEQgXBLYvdkNRtehVjB5p75beTyHSvYlg8XiGvqpJgkdV2Yrw8?=
 =?us-ascii?Q?MWjPJ7VgUYfXsBmoO7XnVHyR/nvr0xQtki8izoaQO75viMMg9Zo6mAR2DKck?=
 =?us-ascii?Q?NOrRpGFRLMH5P9C9d6YHXHHReMuQcnNk4sNnrFYt9i9/lHLWex0UgRm3FQRg?=
 =?us-ascii?Q?X2Kec3M7UTZpJcmAsJfvFOQBCUn3d4KjzbK8MFE9a+IjMO9jh1ZOgb53cvn8?=
 =?us-ascii?Q?u6y9i/OG50tAnf3Y71/LouD09ITFaTFbEbcFjnQnDnSSECkJcnKvBBdoi1xM?=
 =?us-ascii?Q?BJBtF4bZd6eZdcTUFY3WoPTpP7giulk1lzaZElgvEiNquD2EtEi/SF5PMcon?=
 =?us-ascii?Q?+q+kyeu9uiRcyHWAHqCIUvqhISyx5ZAwGH3ATfvmPlaWu97pm8wrKqxOuymU?=
 =?us-ascii?Q?jQgKpdx02xW+NSzMtgi3AgDKe4c3cggrhhqScB+PN1XJsUYoLCnUps4ERojz?=
 =?us-ascii?Q?ZFHPkviaNPiB6vfwkTd0boTow0pbiFGE/Ie95ncHDgHZ8+qh+c6jsxfemiLd?=
 =?us-ascii?Q?6ilX8EFAYZfz3xBYC4WDw4VLpZ4rK/rDcT1f49pk9d6P4vvplvuPIueW1h3i?=
 =?us-ascii?Q?NEPoUz/d95ZMp07TGbIdmQSZtcEQTN/XV5X+12TX4Hq723Vby3XJbMMh83Ob?=
 =?us-ascii?Q?ET+8n9Vd+soJaYiq87Jrfs+zOg31nRv84t3mE1zq0AU/dqXA8QTvMusuAz5X?=
 =?us-ascii?Q?PozrfBGGNFO3wGP7TncmPCR0ofC0BfF8quXGolMTee+83UZPwjdV8wIXOZ4A?=
 =?us-ascii?Q?xMNf61JAg5w48iKqpoEBBZWsMZ5xQ1u0KS+1ujOkafFJg8/WbwqXL060fAXh?=
 =?us-ascii?Q?WqGjfYCnggcAasN6ofB0hqMPNlYMsk1WCh5vWhrLWfKhgSQvm7h22sbp+DGX?=
 =?us-ascii?Q?Jt4bBgtCg1CO/RHV8jQqVl7WSgFxlUPvOgUeMe6VT4ficSLxRu5e5CvnY22l?=
 =?us-ascii?Q?f7yl1fm2sOMg7mx0lVaVkipG+Ob1Y60MQIO+je8VUdHmIxdNLGGXYtkHMKGi?=
 =?us-ascii?Q?ixOHU8Qs41Bp9MvJ5aKyqr0xEY15kkd4Z7nN5y9JPhOkjCTSBR5jv5wffGpU?=
 =?us-ascii?Q?XB6s2o3SFA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffc7f0d-29ca-4a19-6937-08da2f4ad13d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 10:26:01.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvXSi6CQozoeQRwcKYTy5PERSeg71nygIWYt8OVjOa791fII2gOl8Bhw6xNfWR8eQ2071GOiXSTWfulRw1Gm5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2505

On 05.05.2022 16:21, Roger Pau Monne wrote:
> Current LLVM LD implementation will turn global hidden symbols in
> object files into local ones when generating the .symtab of the Xen
> binary image.
>=20
> This is different from GNU ld implementation, that will only do the
> conversion (or remove the symbols) when generation .dynsym but not
> .symtab.  Such conversion breaks the processing of symbols done by
> tools/symbols.
>=20
> Use protected symbol visibility instead of hidden, as that preserves
> the symbol binding while not generating GOT or PLT indirections that
> are not compatible with some of the inline assembly constructs
> currently used.
>=20
> While there also make the visibility setting compiler support
> non-optional: compilers not supporting it won't be able to build Xen
> anyway, and will just throw a compiler error sooner rather than later
> during the build.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


