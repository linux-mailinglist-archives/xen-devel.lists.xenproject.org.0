Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B848757791
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565008.882802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgnS-0005wD-Ng; Tue, 18 Jul 2023 09:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565008.882802; Tue, 18 Jul 2023 09:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgnS-0005t9-JK; Tue, 18 Jul 2023 09:15:06 +0000
Received: by outflank-mailman (input) for mailman id 565008;
 Tue, 18 Jul 2023 09:15:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLgnR-0005lz-Lb
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:15:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9410e02e-254b-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:15:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8761.eurprd04.prod.outlook.com (2603:10a6:20b:408::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 09:15:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:15:01 +0000
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
X-Inumbo-ID: 9410e02e-254b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJI+4pauSxbGNa8+AKAHhCyoVywNiW2rzCJkNPzIDvNNENMouLbB962mYyjwcUcD8kvmQHO3TQxItol3092ftSZ54VExVpAlyh7nLp8m1cuS6H1uVUHbBhykBJQOmtHiMs3Wqike4nU3opeVdbbfR/15RLhXo6svn2HRliG589MZKlguwgGZrLzftcIHy0S0drp4usTkSHfyejrdXvXkGiU4f6guMHPxElRwPGgOmAZGFA/+1tQEF86ePsk22lJUzV1IioUQx5Lywml5uHrENNMUHhZmfV0CQmuEMnJSiwsXOz3Cyso4cYH3qm4dJBSMY+8cYockQiDgYNGnZSWVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Br4lVDld5EVIIi1pUlzhwHlG0TyfjQ8LZmA1YZFyws=;
 b=em5zEIEK8v3SJ0vOSzlekPekXBeMRR9TN+L1F13X1/fvU0Le5UhpzoK5lU9cTmX90A/SgO6SmoB/JfPWxHZM7ypUdVQH0+BZaFiemLGh3Z8pu/lQ4Z9rYfPpMCIrvUCIO4qBEKHmx9OuiE0QT+OhU/bvrWhx0Sm1lkG/CR+lotloPvwSWo8pV4ZFGYeQ+/0USrSRerEso7zaWVGG+sFU44BuG8koDjScDLcj45kwwCrmtxfuQnSE84wfkOL27Qfk8BZL5geoVf65rgfS9pGODj9g+52mwEgpD82RsEQIf+BGTa46ggVt8FkOR5QuXH+odHNXTMBHM+apn+0dZJ7oSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Br4lVDld5EVIIi1pUlzhwHlG0TyfjQ8LZmA1YZFyws=;
 b=exXLu6i2YcDEe/r5f2gwZIYc2uHkF+y9LyCxt4gCjrYw5UMrEGVlHpVWLhx4P3zePJYwlvL8NaFiUZOuPcd+zhKwRw+W2Infkn2Vzh/Qi5WIspPVj+HFSz9g3thPrOEENx9hEjYGTBK81xe0w4lI9wXXzLh+y1PeH4DyruhX7V0EIlKo+Rn+71EEFBS8k11FMJGQx38j4cPiRr5EbSlvnjyfJMz/mlSUR47OcVRXb7R7JGOa98LNB9q9aUhAuFgHiLcodikZ/pGaXe+BT7uPLy/nXEqceGeHfBiWWMwYKXJ9/bhuLX51ae8n20b//mAQ9dbRTK4Y3VOn2ZNRQswg+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cb13c75-9840-b7fe-6a07-71186a068b94@suse.com>
Date: Tue, 18 Jul 2023 11:14:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/8] pdx: Mark pdx hole description globals readonly after
 boot
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230717160318.2113-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 883c222e-9eec-4343-9a70-08db876f7767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BwW/TCHvihGC5hWVpjh4rLmdhBhPibnSQtx/RptBW/3o0ADYj5n0BPXwlB55GDbXQD98V5wygMita6iGspu7Qvk+AKJvWUsBRpGhwoAqoSOQ0uLk9v4fCjFt1joqU7ZARKyiqHqyQTbqiLZ6mXz0YIoEnQnpuDbDW0IZzTb08CIqU2lVfYz486xUCtaJKvY/RbWrnFgFdujx/V6ApfT+TP25oDMh6nvr4qgcPYXTZasgpYB8egs1gU62Pd+R64seFbXuSHpGBCKkiIrCHLEajbuaC7+obpK6z0LPgHjQTQTX1If9m8BmXVgsOJylqw036uhAj7C2A213DKmnxTYB9AthVwXFHcNDUIT0SYsVqnDRGNEqA0xvEGQxnvlru92nyDXAhZ3VAvSgTyOYfeTTsEWX4eFTv/kdP0QPbNtoijlQzrPfAC1QML68Hrz/dzlEVayxE8gKJEr8bVRJmd6ZQz+wdF0r19jx3fge9KCss5ZONg5WXqae5/B5HUaW1pnl4SA18sqbTsn22G67CoJFyX6qDbMm15UBvM85yvgAhQTqYo8iJdfbOfPsJM1NTYKwnLwMz0sdSSrzUZG+qR0tv3PkAO2rjHn9keZQU2z+JfDnmq8FFuJNBoPlZRxUDjcvc3/XWQ7BVbHWPhmJyOOozA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(31686004)(6506007)(186003)(26005)(53546011)(54906003)(478600001)(6512007)(6486002)(36756003)(86362001)(31696002)(83380400001)(2616005)(316002)(4326008)(66946007)(66556008)(66476007)(41300700001)(5660300002)(8936002)(6916009)(8676002)(4744005)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnVLNXhPMVc0ZjZGNjRNc1E2M2NjaXpFaUlOSGdVUzJKRWVNaDBOdEpFdnk5?=
 =?utf-8?B?TXArZlQ2aytFN3U4ODBlNmwxY2Zia2RaK0R1aTFzVWZjRWJIOFAraUxsUTB3?=
 =?utf-8?B?N3hTdXFMd1JFZE4zVDhZMFY2bTM0WGVUT0tISG5ZZFN1OUo5OXd1U1lHOEVh?=
 =?utf-8?B?RzZMSGRGcXo5a0ZiWEt0ekJ6cnQzeG9CYWN3dlhzKzlxeGpsYzJQS2QybHBq?=
 =?utf-8?B?NzA2eTk3SHhjWEdDdkQ0MTVRcU52UE1aWE1BbDgySlJ2ZVhGdVlsRUJ6TlI2?=
 =?utf-8?B?YjJmb01KUTFRQXB0U2MwVFh0ODUyeVc2N2RsczQ2eXArQzRJWGNwVEt0MElw?=
 =?utf-8?B?NFQ5SFJpVmJHRklKanJTVExTZG1Yc05XMzBZeXJDV1RPdnA1N2Z5Z1V0SjV2?=
 =?utf-8?B?OHM1Z1pTbWFxZzZyekM3THMrVEVBdDdOK0trbmowR2ExSUJURXlnVHpqOXVP?=
 =?utf-8?B?V0ltc1dzN3BNS3JOeWdLbWRVcUVYL0JGRTJCanBXTlRoMTdBYzNkaGN1d0Ry?=
 =?utf-8?B?OFRnWGNNR2FhZ2JJaWNvRkJLb1VVd2o4NFVzSkFDYXJSNVRUalpYcHhXc3Jo?=
 =?utf-8?B?clMvc2E0VFJFK2lXd3RyUVY2bUxxZnlvakhOOWZkTGMyV2tIMm9rK1NUdm9T?=
 =?utf-8?B?a1lQR3g4RktxWFpRM3ZCN2h2dkxRWjBaTnMzVHlQZjRleXMyVUJYNjhYUlpo?=
 =?utf-8?B?M3drd1JBNkhLT2dCYkZIYURKNkpUZXRJUGJveTZGeVFpSjV6NHFrZmVvL2tB?=
 =?utf-8?B?b1lBdXU1ZzVHQ2R2SGZZd25HZU5TZkQ1TURWYmdhOXRKdjFPNll6bHFDTWpq?=
 =?utf-8?B?Z2JkaVNCb1NmQm5CUldxMTFEUUlyNG9SVUdDUnZ0NjdqZXRxZnB3WEJWNVRh?=
 =?utf-8?B?VlFCYndNWjRCN1RJcjI5S2FDbkhnZHlUc2JkT0c0YzNlb291ajl5U0xWUHBp?=
 =?utf-8?B?RmRoeWt4Yk1Xelh6UlBKZlhxSGdUVzhjTXFkNTV3WG1HL21od0lodlBRVDdo?=
 =?utf-8?B?MWdDczRrKzZzalpkQ2FEakxVNWF6TTMwWTRoVk5DMi80Yk4wR3NZcThHaG9m?=
 =?utf-8?B?bmpPbk1paDZvWlFTQlpaS29BODNoekkwalJ1V2NGVnh5Y0RlTUN5UVB0cnBw?=
 =?utf-8?B?b1U0dlo3cWJja3NOUlU2ZUdFU0d5bXpLMXozWnRybzg2aUFZMGtyOEN6bFIx?=
 =?utf-8?B?aGZ2cW54VFdUZ05rVTVWY0dRVFo2Rm1jL2RPRTEwNE9ramtnTXlINmJMSzVl?=
 =?utf-8?B?MDdIYVVTNW56dGRtekk4U2RUb1ZCM2NMK3U4UWFCS3JsV211aVMvd1Ftb1RS?=
 =?utf-8?B?R2hlc2RLeUpWam9wYklibVNiYjIwVGdveml6RmRUVExvTm1kWlo0a1d4MlE0?=
 =?utf-8?B?QUc3c0F5Q1ExUXJ0d0U2YnFDNnJhUUdCTjJ2b2h2SjV1clljSlp4OEFNRVJG?=
 =?utf-8?B?eTlGQVVIOThFczREOS92OXN2M2NnbGFDSC81T29QZG4yY3lRMlRFSmxVTjV0?=
 =?utf-8?B?dlJFazZlWkEzN1lnM2VJZk41OTh4OFgvU0hhWXV0RzNuNXF4eStXenF0Y0FZ?=
 =?utf-8?B?TWd0aGtLMmRPWkN5VHgzdE5ST2ZRL2VNSUMyV29vQXp2ZmUvdTh4c2dxekRw?=
 =?utf-8?B?T2IrZGVoa0RNVWVBejNCWHZjTjBJU2pPWjZrRzVMTHZ5MjFXY2ZzSWFqMkV0?=
 =?utf-8?B?R0RhTGdRM1FzUlRpODNsTVBrZEpIaERpemdaQkFaOUREdnR2VmxteGFqWjdr?=
 =?utf-8?B?V2NGWUdwU3BPN3R2U05lZmpmSnUvWmFZM1Y5TDE0clY1eS8xRmZhMUJVRU15?=
 =?utf-8?B?Znk5Nyt0UWZrc1l5ZTg3eSsrUk96cDByOFRIeGYzeHdDS2orWjNTQWF0L2Vs?=
 =?utf-8?B?bFZJc0Q4OHpBV0s4MzBtSXdibEpqVk9vTW5RZWZxU21IY3o5Q1NxMXZydmNl?=
 =?utf-8?B?WndNeFlkVE9neVEvc2N3MWdJd1lTTGFldVdVRGJURkRRdWpFYUY4aW9rZjk3?=
 =?utf-8?B?YktlcTBRMnk5ek1oTUdtZEp5T2lLemNsVExVZWRiT00xQWZ2NCtGTUJ6d3JI?=
 =?utf-8?B?aDYxdExwcDVudWFOWHNkb1dBMjBMVC9Xa3g2TjM4QzZlcWpmbG12RnhBN2t4?=
 =?utf-8?Q?aD1tqOGKOAPA3ipqoCGA/d3bH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883c222e-9eec-4343-9a70-08db876f7767
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:15:01.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BY+WXsMphpr2a5bjoJ5+6HCn2GrGED8XnyIFDGiVbJWWLiW0kdkO6Q+f2DRTxJnwQaZg+JwEWoeyYbVGSPpdsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8761

On 17.07.2023 18:03, Alejandro Vallejo wrote:
> They define where the compressible area of valid mfns is, and all of them
> are populated on boot (with the exception of max_pdx, that's updated on
> memory hotplug).
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



