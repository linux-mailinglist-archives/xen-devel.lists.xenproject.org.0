Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7B53B5FE
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340982.566136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwh5Y-0003U5-LO; Thu, 02 Jun 2022 09:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340982.566136; Thu, 02 Jun 2022 09:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwh5Y-0003RW-Hq; Thu, 02 Jun 2022 09:25:56 +0000
Received: by outflank-mailman (input) for mailman id 340982;
 Thu, 02 Jun 2022 09:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwh5X-0003RQ-A7
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:25:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 004011f6-e256-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 11:25:54 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-dKQVpGNfPu-R313OaBPUqg-1; Thu, 02 Jun 2022 11:25:52 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4909.eurprd04.prod.outlook.com (2603:10a6:803:52::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:25:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:25:50 +0000
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
X-Inumbo-ID: 004011f6-e256-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654161954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h84eh+LwxOmJ1STbZjiq0E+X9h89ANQX3Xr6OCQww/w=;
	b=NH3d5LwXEbaw6W1K7RpTlbYSShAMOp/vMGTSJ0TeWV+QSDS4FD4bXXKca+6/MfiqPzDMDD
	NYt0KrhzhiYjwyXy30si7g3TitpHrIEA8FNZ5Xxjg27BLtOgU5BHzEIA5maQgLDzwGnDDF
	gBk+uYGfieDSGSXjReH/Dv0hX/5YdBQ=
X-MC-Unique: dKQVpGNfPu-R313OaBPUqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8m6vW+NElyWtIvfAqpNQe8CZgbaRjm/E4q+fg9BuqzVf/CdqqdEkARzPuqet7Luhd4pDZsyd54uyfH3sERf6ppHx4BZHppUDFGOBc77l2xHsWcbLHZW6fSis5glxgLTQJ9G+UKJ4Tq41vDNHhxS+cTIBjyqskP+wgSwCBSLhuhgJWInuKwRUZIhKHqdj8S+sBjB1RqbhqRGWnpjGEIYufoQqiNEkRsc3t+vnbAmuuhQ/OJOD79hx4ccn54haAuZ1fJbSot5FleyLWq00rZtWihxBe/mWD3LGwMMHdMBAvKvIc3IWOX7gPQBe4g0IZjj1kcoX+Zzw/bY+TetF2HoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h84eh+LwxOmJ1STbZjiq0E+X9h89ANQX3Xr6OCQww/w=;
 b=mx1RG4sYRdh/Kt8p/zNOuBT96BA2ccD5rxgMGhhwqCxjyRfwrYYEJD+vbWttWEHdpa9SG0/xcgkxTxNPXCrEEjboSpsk3BQ6JdsbuZl2mQWfaNGdsQ2q2eZXeJT0FoLWX8kGBGsCDA/dmvVoMRMYx8lVUxz1FbKK7W6YGgz/gN+DdgF1xmWU7AcXr2AV5iGpb6NJC71goPO4gJl61c/8zS+QJyPUkQiaXhzjAWdjOShJzIRRamztw/jY5hcvoI+oW8uj1Uk3NW/fVKDfgWHHfhaeV/llriKhl7xQUf10976h3aQH9UWFNa+SuJULDtNNK0nCQ6cpho2IQEUGU4VWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed48b5d3-a8f1-f2e9-120f-476c3e19ebbf@suse.com>
Date: Thu, 2 Jun 2022 11:25:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/3] xsm: only search for a policy file when needed
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531182041.10640-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ee11c5b-5057-4800-c113-08da4479e242
X-MS-TrafficTypeDiagnostic: VI1PR04MB4909:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4909786DB63A27C25A442331B3DE9@VI1PR04MB4909.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sTIzuzsFVozPjlPRVvR/v7GwnV4ik+uEgIPbw+4Ds9Eiid+0ZrmgIyZOodNIVtBkRG0dv+9XcSPuI9kQty7MP4UIKuXW/yMy9MtYVWsEitPUPMDdn6gZoq+jyKVuEdKRMC40kSIUKlb3TWPRIqxKuyaKba5xkq7EQaPvlhuE2Ve4BolZp/az+9CQcMcLAyl0dVCVZl6+EbbPbnAK6k2zWZmhtopyZUX1luPqkO0HxebwhDA5ZRXk7ksvjVIJTPjbE0wlvumZV3f4spffblfLyKBgt5unXEnDmGMi+Tt26+NlGdCFw8uChcxe9/BJXPD9XtDEFpp+nZHBMkO+ZoWeXIyG112V1xqr5s6jwNGRqdnA2xt4iicSNbUkS5sqjQ4pYUnnrQt0D5j8YJ27sLJZESr8Lhj4OuEzYGcbyZD3HDufLpoikm7ULwPJwXhrKCvh7pX8TogDg0LHuNfthfHfkhqGH9Z+An/JNNntjP3EMWwfDC6fogE4UQ5qw9xUSb5lDmPFwuiUii/sUnAzxfIaR/cNLG2XasIHQmNPelDpWIBjOhIXYEnDQtsG8inAejDFS1OeMLcTtRf+2NRpTYKqJ78ktDADV3b6M8n3H5xdZQgDAOZBydym0yHgQTNQvuapF4xgc9P6SKhSqkloU0kP+2pxYpXPky3VBeOFisfP8YNdE76qBcGrrc1UBJ+J7ffpYpJee/lZe/iTwn6WojPAevKJkV4blYk6yx2GWhLJQloYH/+kfmmbkhatUyGdQiYu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(83380400001)(5660300002)(31686004)(2616005)(508600001)(8936002)(186003)(36756003)(6486002)(53546011)(38100700002)(6512007)(6506007)(26005)(6916009)(8676002)(316002)(31696002)(66556008)(66476007)(66946007)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHR1amJjTXEvSWVmbjA5S3U1QUZ5d054UFR3Y3VEVkpGVUVLTWRnTEd2TDBn?=
 =?utf-8?B?OTVLeGR0b0s0OFRBaEZIWDF1WkFlNllqWFZjWnZsWHJTMlZQQVppQ1U1RlJx?=
 =?utf-8?B?bENCOENmWkxTU2ptRjBEbkRIWUxtY1U0T09SQ21aQkN6Z05FcjRUeDZNeThY?=
 =?utf-8?B?WDdyQ0lVTzFwSEYwT2E1R2tsMDdUTnErMXo0dGRwcG43czE1aFgxVFBWY3Zl?=
 =?utf-8?B?RlFVdkJmaWRTbHppZEZCYzFGdzV5TVRqbWs1YURPUi9tTlhGWXZSTDUwMWJL?=
 =?utf-8?B?ZmMvWExKRzlPM2FrdjA0andxcUZJOERtLzV3REpKazM4NmVJTUhFd09lNENH?=
 =?utf-8?B?b2ZVa2xtSGxTT0VlT1lmaTIyQjNObzZkdlVxU2h5Wk10cGtvSFpUdFZyZitZ?=
 =?utf-8?B?Nzc1TjhkQzRGZ2FwcXpCaC9uSkM3WitXNnBJMG0zMVpGOGRqN2ZnZjVNNjFJ?=
 =?utf-8?B?Tkd2OFZzOHl4Y1hYNDBZNWd6Qk9sRDF3emtsOWwvUHpXVVl2Ym9pUUU4U3F4?=
 =?utf-8?B?QkdhTHlpem0zWitrQ3FPY1UrNTdnaGp3Z2Q4ajBxNkFYODZZamtRZCtOWGtP?=
 =?utf-8?B?UVZiRkwyb3IvLzdqWW9TQ1FBbHRvUkZJT1N3eUhWNFFndmgrMlpFS0Y1Nndl?=
 =?utf-8?B?N09WNG9mWVIxTHhzK1V4Q25NTlNEM3VSS0M5ZTRSQzArb3JyRFNrMkdxaTBu?=
 =?utf-8?B?NktiWXA5ZThKMXFWWnlvWUNqd0ZaR1RuMCtYK1FGa0ZLWVA0N2RGUTZjUTQw?=
 =?utf-8?B?c1lCRnZwMDE4YUV3bkRQSmxsVkJKa3dOaHZsMFp4QWZUZVpmTVhnQ2w3UHNO?=
 =?utf-8?B?UXJmc0xxMkxocW0xL0E1OVhOZjdOTldiM2dnaW8vOHJOQ284MXFmS2RSNzBK?=
 =?utf-8?B?NmxySXlLanp2RnJXa09RRWFkS2tqUUlYNC8xV2I3V2RlUDhCeVBIeHBTNWJE?=
 =?utf-8?B?d1Nhc2FCV0NMRURSNEQxMmpWNzdGdS9jY2MyMjA2czJuMy9ReVFwc0gwZzF5?=
 =?utf-8?B?RUR3QlpxRlBtaDU5TG5yTXZIcTc0Q0JVOXJET0VPSnFOSkhXdGNJVkhpaC90?=
 =?utf-8?B?eGtVUmRCQjB3UHdwNW5zTVRVR0l4UlRuTUFWRXpTdWdwVUxrM0xjTFViSExU?=
 =?utf-8?B?YW50MjczZ0FkL2VzRVo0N2pHR0xPVjgvcXIvSWFYdmR4NFpyNHNPRHp2SzVt?=
 =?utf-8?B?ejdIYjcvcURwRmRtZy9OamtVLzc2S1ppNEJjNVpVSDl6TEQ1SkJkVCtmZWdz?=
 =?utf-8?B?REVZSDVHRWFjcmJLQy9HS3A5bEUzTkZSME92K05XZWk4ckViSmRtRCtFaG9Q?=
 =?utf-8?B?UEVpZklhdVBlb00reW9Bd1VXTGtoNjA5UXpyUHNITVl3bDM4cVJZbkMzVCsr?=
 =?utf-8?B?ZjdnQmtBcE5xNDdFSTRJaWExYnBBVnR6ZFN0d3M1MUV4bUhpM2RXeHBzRE1V?=
 =?utf-8?B?ditrUU9SZFZDVWs1dVpwWUFJN1R5MGx0WStHRWdZWTlyR2xyL2t5UHJPcWdk?=
 =?utf-8?B?ckpodFBjeUVYQlp6WDZZQU14ODBsNGJWMVhXUDErd1lZWXM1amhvVUxnZTB0?=
 =?utf-8?B?NFhDMUpJeTZMdmFnYUNrYTZBWnlCYW0zQ3R3L2NTa2FjNkxCUmV6d3JMWGFF?=
 =?utf-8?B?TkZuUkNIVDFtSE9oemdzTWhiam1mTWd3ZUk1OFVIbjFMNURVaTAxOGVoNXM5?=
 =?utf-8?B?bWdaakJqeXl2VnVaTkFmQmpGZzA1MlVOYjRYZ1BnamdqTzRJRFJFZFNWbkJ3?=
 =?utf-8?B?Mys4ck9xVllZTWFMbGpRRmlsMERTcUdtMGJZSlhvWnFPSmc1UDdUZ0RsbzR4?=
 =?utf-8?B?K3MwSlYwRzV1WlRMcUxDRlkvNkdYVEp6SHRtZnZFYUl4S3FIdkQzSEVaT3Vo?=
 =?utf-8?B?Yk5JT0Z6WmwzZ1d2NnlxaWtVRHg5SWNiTGtqWXFhWURBZ1VvNnZMRXNYS2RS?=
 =?utf-8?B?WFpZYkdHem9JQ29Md1M3Z0JDRzhtZ2ZUNlZTSEF3Qi9DMzVvcUdxVkVXTzNW?=
 =?utf-8?B?UC9qY0NSbmROVTlJQ3IzWU9jSldzSmJuNUlLaXA5YzJreWhjSHdqUnlzM0hL?=
 =?utf-8?B?aURvWWZnNlJnN3hiNkxpbmlxV2UxSER2NlJCUEE5eDN1L01kUjJ3ZnJBV0ZD?=
 =?utf-8?B?c3ovb0ExeDdKbWlHbWErNG8xQ3U2SVArNmRKMjM5ZGRCSVk4RkdXa2tXK1NH?=
 =?utf-8?B?aVMvYmVDbmRJdHFpYnlaVFRzajdEbjBsRm1jaW8rcG5QRnUzeDlKT1ViVitB?=
 =?utf-8?B?S0VBY0lza0V2UW5SeVVGTnBGNDY4a09TYVc3QTh4azNsNTJsYmZLNW1WV09G?=
 =?utf-8?B?Ni9yaGQ1c1pIQnFXRldyaDg5YzBCbXpDOHhBbWcxaUpxTXA4elVQQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee11c5b-5057-4800-c113-08da4479e242
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:25:50.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+K6d7fLTWAWx4cLeGi98555NE+xJIC8ivTz2L9XL/j+1WMGo6kjDfs1JwA6dSWdWoNv0sVy3JvwPDqBZ4GZ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4909

On 31.05.2022 20:20, Daniel P. Smith wrote:
> It is possible to select a few different build configurations that results in
> the unnecessary walking of the boot module list looking for a policy module.
> This specifically occurs when the flask policy is enabled but either the dummy
> or the SILO policy is selected as the enforcing policy. This is not ideal for
> configurations like hyperlaunch and dom0less when there could be a number of
> modules to be walked or doing an unnecessary device tree lookup.
> 
> This patch introduces the policy_file_required flag for tracking when an XSM
> policy module requires a policy file. Only when the policy_file_required flag
> is set to true, will XSM search the boot modules for a policy file.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/xsm/xsm_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

FTAOD my (later) v3 comments still apply; v4 simply appeared too quickly.

Jan


