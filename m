Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6E7CF5CA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619170.963803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQbt-0004W6-5p; Thu, 19 Oct 2023 10:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619170.963803; Thu, 19 Oct 2023 10:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQbt-0004S5-1m; Thu, 19 Oct 2023 10:50:37 +0000
Received: by outflank-mailman (input) for mailman id 619170;
 Thu, 19 Oct 2023 10:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQbr-0004PK-IB
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:50:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53e896fa-6e6d-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 12:50:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 10:50:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:50:31 +0000
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
X-Inumbo-ID: 53e896fa-6e6d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsIP+50SWMY3NfQKm4Sg9eSUZaSiZGtmQfJ62xJVJJZbsCCdHFl7q+f/RXWeC3166kTTripRqXvkHNcDQrUAb7KG9H10mrwU/BCv+3kwvYk8gqWIZuHgV1uzvB6YjKyJTMBBTQNI/KHuPOk3Rx8U/J70pV/cDuc/zET4qiIP5HhnpYa2CUsbrEf84vQDn++N7BGh9uudLD90Kp4EhAUeGwN5DJzsZydRASkNA1fXAaBBCgMY0j6XY3GAyQTfUhlxuhjS7fSvNT6m2yH4l5+LoDUevV9F2ZTlK3wul7VL18vaLJibbJb/8dAqT2F3iLvNcb+S4NH4uFLdiLZ5uPGWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDucUsl1ZPXm+E5i5UDfK+wDYzeX2VzORlqZ+V+YQsg=;
 b=mbU2jslszGj+q0FTdNTtR40tGrzIgngHu4BTb4m7ufsZD1ni26YP16UHGPrHC8IlL9BKlwy47yNXmq0NBdb1sZZwMF34o3xph6yPos+Tp9pTQYzpCKJJRPq8+a2lHnzNl+BUzZrfeL0gic98tANcF8nFHa8o/MPoWXMzPpFppB+K5af1Eq8EEe50riQ/sCT+e2OYb2wXX6yXX49dMKNLGInmn8iSX/qIWu+YCjRvQfrXrtlMQvLPAUsW9ntl6cX5lkOf9+9zJraUEF0P54UbNZ60nIVZy7KfTtMIPxBgYxvTM48q9t14dfafqz/ayfVbCvphuAd7WBLnmnIBW1q/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDucUsl1ZPXm+E5i5UDfK+wDYzeX2VzORlqZ+V+YQsg=;
 b=EMLxLNk1XbNUrmYMmE2PlsZEUg8QP6ci/LtonrRmWLiGWi4JI+SjSK0L769AoJwZr2eqPK8TAhOTTaU+SpuWprCASUWrOhsJpI9rvlHlbauIyTEtFUvhfMAVqfglo/aGmL8ZVY76vZEqakQuq9AcvGVOw16AWx/z2/qK0cGPer0a/CunglPTW7c1qra+RgMz4OnZZ31sl6aj0GtGkT4lhT63wWsq1djd2kHo2TQqs/rVOjtX01htO64vM2F34sDn0X+cNeMIw3T78U7LiEDI1lnVQad7K3PKGqMmBhic4rVp1cbyoDwBbTqY12nSUOVhJ/N3SeUcgkQyCJ2BkwnuBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <803d5f10-edf4-9e10-f801-d480c93ebec8@suse.com>
Date: Thu, 19 Oct 2023 12:50:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] iommu: fix quarantine mode command line
 documentation
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231019104551.27870-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231019104551.27870-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3632f0fd-e324-4505-1dd3-08dbd0913711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	owhfQmvFvyuI20OEC5UP9sTdPofaBiCxgJjGenFEp/Xv7cUnkoXTz2HZPnTqAkelV6G5skIsXJKk2hj6I1HgxLuQuVg4Z5ujNl7xNojWxsL0cD2wlj1UHjmOdB+iIx+azX1MUGJumr6jPvIu3A9t4Zln+s+WFYxlR/+BT6467ArwZOCMlkh3H3VdtiBBDavFob+d4AmB6Io6sVPIdfWyuKiEMBxPN1M+5lXKthTtiLh4h08u03pilgdFki+bcf+mkgBay9LK2dS99tOX+db/VebpTvLqLsO1B7EqlUzQX6RKCeNrUSDthWfd4eTgZXpq1P6698/gVZOV2vlkX4SGjA0amZEEU4suViLuH68g9uwv5S6gb0u6TAhikMnswhKBw5qp4Gd7ap6CH1wF+erZTKps4yga8N9jI3QblR6LQlcO4My7umXYcIw1NPSWELb+Wr2GLuKTezfE+NIJgN5U5w9YM71oUoCfHbP85LWuh1RGslHKiiKGytiUu206xAaxOJh5A/YvibkY9BcAlOq4CdC5jPR5FmAfJ+17uy70kdXibmuPo1F79HHdirxwyo4pYAQVXSqm+z3s3CX4iSWj/tSDhIUSBAdtlPczOm6BgnDptXJbihzUyZLDcdwI9GvEOOrw9z8a1RgCVlZsZYN4Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(2616005)(83380400001)(6506007)(8936002)(53546011)(6486002)(316002)(2906002)(8676002)(4326008)(5660300002)(41300700001)(4744005)(478600001)(54906003)(66556008)(6916009)(66476007)(66946007)(86362001)(38100700002)(31696002)(36756003)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzlNb1JnWWN5b0VvRnh1cVdSQlQ5cUQwVG9RbjRmM3JpaUxzQjl1RkZvMFJk?=
 =?utf-8?B?VlkvWEZ5bEE1NEl1QVlpcDl3WlhCWXBYN2ZjVE1rczJVM3I4d0dJZHRZdUhw?=
 =?utf-8?B?bS9RYitPODJRb3B1NkxnOWR5eEF2ZThEWFhqWWsvZ3cyWllmVWVpUzFtQW05?=
 =?utf-8?B?ZkVUUGNDUmFJaTlKTlRaMmRuaEdIK3NxQ3V5WXUrYi9naE56anFhd2U0eitD?=
 =?utf-8?B?cWRxSmJEMWN0N3daQ3p0VE0wU0xEdWZTNHZDVGJWMFJ5ZWRUbmRLU043d2NU?=
 =?utf-8?B?Z2pGMnJ4TnYreXp3UXhZR1JENUQ1c2MxVHFIOTFEcktzS3A3MU5UV0I2eThU?=
 =?utf-8?B?a1lUYXJMaVY5YmwzUnVmRUQ2aEEvRDZZQllIY3djRUxCVjhlYkQreXpNV2lz?=
 =?utf-8?B?d1R5T1g5RCs3a3BaejBnQmJzSDR5QVc0WTRJMXNGRi9uejdwMm44WG91UW9C?=
 =?utf-8?B?VGlhcTVOVnNRSi94aHV2NXlRbkpiYnFDaEg5NU10RGVybFRFTEZrYkxUOHBt?=
 =?utf-8?B?Qmp3eUlvOThWdXQzOU1TMVo0ZnNGcTdQeXVNWmtidGlVN2szUGRWQlZzTXdp?=
 =?utf-8?B?aHlMK1R3U3JySlpiMzM3M2s5WWoybzJyUVkxWkszdGxjblY5Vk05TE5SWVp5?=
 =?utf-8?B?R0Rkd04rbUluMWhOZExPQnErMUx3eFRDR3llWW9vcFNBMTU1MlQwa1crdkdX?=
 =?utf-8?B?OG5DRUhHTjZHQlh3QWtBMmkzUkJyZHhDVnVaOEVxT2hubGhRUllqb2lpMTZ4?=
 =?utf-8?B?WmRjeWttUEY0SGZwMWxPNExTamw2RGlIUWdOeEcyTzY3QkluVm4vWkZCOWhZ?=
 =?utf-8?B?N09RWlV4MitOaTNFM25taDZiSWpnQUM0bnJyN1pLS0tYU01sK3dQVWlYL1VW?=
 =?utf-8?B?K2kxVElQUkc2OUIxZDA1ZDJpK3pHQmVlQ0IzR01nNWdWYjN1R3dFdEFPNDdL?=
 =?utf-8?B?UWp1TnFOKy9HWEUyT2E3MzRqUmVQeHNmYXlraTZ4clVpQjJUZkJyN3hPNVpB?=
 =?utf-8?B?MHNxVW9rOWpDY0dDZVdMMUFGTWNqUkVTNllaSHZ5cnNhR2NPY2twRXhlVHZQ?=
 =?utf-8?B?SlQzMU0zc0dHRDNLVHVyRStvYXJjODF2QmozK1ZRb2JiQTM3cC81cElzZ0F3?=
 =?utf-8?B?M1BkcjhEVGx6SnZXTVJRVmVWWXQrbiszSGFUakhDNlJzY29aMURLcmlXRTRw?=
 =?utf-8?B?dEEwZEp4djZQT2ZjYncwMWd5MjNMSnpJcU94QmdoWU5BN0ZweGgrOXVsaFpj?=
 =?utf-8?B?VUdzbDF4b0tmVzZpVmpSUGFoZktNTUNqdEh4UWc0eEpRdCtxbTliSXo1Kzls?=
 =?utf-8?B?TXRmQUpNVXV0RWdsSnpxalJURGxyQmdCYU00VE1sUUlFTk9iMmlYTUFtYklw?=
 =?utf-8?B?NlNIdWlyZzc3ZUNGQmE1SVBCbFR2UFl3RTRHYVBqT2RxZ2VoTVp1Y3Z6Sngw?=
 =?utf-8?B?TE1vTDRQVjBIS0E4SXljSkxmTEZ0WmJyV08yU1VQdXE4S3BiSUNSeUw5L2JG?=
 =?utf-8?B?YkFFWXI1RVdKQnhEQzJ6YTBOUFhOYzhOVXJWUEhuUncvZUR3ODNKeVRCdzgx?=
 =?utf-8?B?V2lLZDhtNFRhN2VabW1qZTJhZnFYQnJUU2Y1Kzl6MWFSZFlIaEtPbnJEemh5?=
 =?utf-8?B?bHNjMWNCcERoUDhIRk5HYi9uY2NiZjFiaDIyWWF2VFRxSEFRUFBveFFnaEZa?=
 =?utf-8?B?TEE2Rmd5ZWR5OHIzL2prS05KVEpBRUlwTDZnKzdZU2RtYnN4a0dpMjR1dEdn?=
 =?utf-8?B?TVNRWXVqc3FYZG5MVDd2OTBsL2ZkQVBBZmpDSEpDclJudUNNc3dFL1Jscmho?=
 =?utf-8?B?ZTg1MERKNzVmRlpxWkpKcEFNU1NML2hxWjlSMmNTR3FqVjZLSnhZS0RuMnFk?=
 =?utf-8?B?UHIzLy84aEJGWjV5QU82N1pwZCtDdFVSSHU1RW44UzhOMUVWYU0yU3JmUlJo?=
 =?utf-8?B?b05PTU90akZYNnd0aWsvRlJjdFRjUTh4UWJKSmM3NTB4cW4wd3Uxdyt0Z280?=
 =?utf-8?B?TThjN0xWOHFSR0FSVTllZFIxNmREejJieFF1TE5iV3c1MVdHby9RbWI2OVQ1?=
 =?utf-8?B?S01pS1NFMDBvVE41LzRNektaeXFlMmt4QVp5NG5jQllzc3YrWXBoajd0bmVh?=
 =?utf-8?Q?p3paE64xv8Agb71srybgYIh/4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3632f0fd-e324-4505-1dd3-08dbd0913711
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:50:31.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlGYyzcThUJ4mMCBuHi7Zy7HHttn78UY8wmTqMHfYgmcID8YilNG2waOsEBtiPobQdBPlmOUupdHSUUqct0yIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141

On 19.10.2023 12:45, Roger Pau Monne wrote:
> With the addition of per-device quarantine page tables the sink page is now
> exclusive for each device, and thus writable.  Update the documentation to
> reflect the current implementation.
> 
> Fixes: 14dd241aad8a ('IOMMU/x86: use per-device page tables for quarantining')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



