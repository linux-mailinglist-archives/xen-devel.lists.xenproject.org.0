Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4F74EA37
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561646.878111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9ZV-00031x-68; Tue, 11 Jul 2023 09:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561646.878111; Tue, 11 Jul 2023 09:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9ZV-0002yz-3R; Tue, 11 Jul 2023 09:22:13 +0000
Received: by outflank-mailman (input) for mailman id 561646;
 Tue, 11 Jul 2023 09:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJ9ZU-0002yt-BN
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:22:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 699204dd-1fcc-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 11:22:10 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 09:22:08 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 09:22:08 +0000
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
X-Inumbo-ID: 699204dd-1fcc-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+iflW3Ob9NyYT8Zy7U7gaOJLHOGpNM9G8uXookoBxEtlCzxLB9uXmpSyBdn/vs5vgm30FuASg+88fx1XaEjjNpwjPximOOVRplFy367FaS2BbGx+5dTQmSVKC73ZrsOjLFYxmlIci0on6h/tLKFkGmC8rnSh1j4u6RS26OatMqGCZ6ZzKCT4bG5D1LQwAsqAXpIMF5bGNcfPV70fA+/9SuOwvxFANPL/9yUHSWC8faf5XiL0Oi3CgwBpoW3jEetSSMb95mJTqWAa1wpV7znTAJRsKIjqd73c+rVSlxpI7hgDHV9AEr1TluPCynvvNpEyM70uV5u64cbHLsRRJcMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eneYnmw8OFnTcSt4TBJrewbBjJ8xuxAtO1SujSR2UCI=;
 b=fmHyHIylNCS8WBTKp+AXA+sra8M+dTz8vvI+XZ8nU2ST/9fPfB19WsD8JezMeoQSFY2uSU/9S30eknIknldenz8vCsDIiCEzn/ybhkub/pJkEIfYtOEIhDcIr+osVKtKlazFKK2Tga0iaHcaY0MQuQFsLccSCPjJWKEc59a3ppTlUmYbqsXIxJYKmQ3HzZJSv3kPnwxp53cCqK5v3wszYq1kMrD6M0IDJWEZYvnA78MKJ0hS8FnOaXZlwPTr1pSGK3txRf68eF69SyDKcnwASDVim3q4Z74rnGpU3XHWnbI6WAwoWkHvo+9TwPbMzZXr0A6kOHhgfgGNzIudqNXhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eneYnmw8OFnTcSt4TBJrewbBjJ8xuxAtO1SujSR2UCI=;
 b=BUWmGo0OYlqy198H99sRvaQHmK5c6+sOSQaU1BQ//o7Dm+i6iSlbwrWH0SqInMOyIkYCZ6KUwZe/z7kt/Hxv98VertfId+HD0yzM6aIGy+6+tl5tBNnl/rquX9Hrxr09le57+6I3r/mXtuz+vWqv6vayXO/wEm1ixPg45dw0C85g9pVjJ/Oqoaa1C9e36+m+iXbi47WmocfeYTPr51KS0Xfhlv0RiknPwumxKetXqVcHiWubToP+B+ePOA52EJ+qIUoF9LioanQTJVDKV2pDXEfvOUHPxhz7gje8wvgI6PTMQaiG3EkNFqtJ0HAHbguxqtkyDolSX6GeAgpVGgqxQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0833649-fa80-9cf4-26f1-152859fd57ba@suse.com>
Date: Tue, 11 Jul 2023 11:22:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] docs/misra: add Rule 7.4 and 9.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230710202835.2052428-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230710202835.2052428-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea5174a-3b58-452c-1584-08db81f04cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yh3ErQcOCYSBwGQOeb2yVm3+rOU9yf/dbryNLO1laHigSvDdlau1bQfZIF4xyoYK7rRNPr0PYwavE+1FaeHCy9eksCRGDbAQC3kD89oXGGMWI5eXZNamuwAuqeoW7P/X+6taa8lnCmOyipoxnBII7d3Z8qS08PDMXdxLeyw7AbQylAyOpcmd59rX66OumwPboItCjYtiNIxYY1YssuuTU3V4VJ8QTVifOPWMPARmMKrI70v6DeUSL9R+pZ3JheDOoU7SaaOkCytCowhkmadbI1s7VpkEgkawkAGswM2JkKNO8Dh+NzyTXrOswYez6F0t1vlYBGWKolKGAUHJMeJvvkNhcIKJ3IgBAy1xgsFCONuKQaQGB/7NP9ezQY46+k2x2WmAqvwz5Uo3W+uCr1lkpxddE6G2ymNXenLiwk3/IJtM604A76r7nAdaGgIRZy0CKDGvniUhslRYO6mLsu/7X3ge6Z6OUGH3O0Fi2Rt/FQYm1d5DQ0UkOli0caWb2ItHyNIjJjABllxL800v5qrQz4RiTjaiy/B7dj1nLKz2cMki64XqeyYidUto0ADiViKLc+NTJo55qSG3vQ6tqwFFRuUh/0jYBFJCUgtJ7dKTIKldEP+CTuD9W4+KnZKaTpZnu1313kC02o4ej1hYfl2bwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(66946007)(66476007)(6916009)(66556008)(31696002)(2616005)(86362001)(316002)(6512007)(26005)(6506007)(53546011)(186003)(36756003)(38100700002)(4326008)(4744005)(6486002)(2906002)(8676002)(8936002)(6666004)(31686004)(5660300002)(83380400001)(478600001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE8wVEw3SXVkOHZZb3AyTlc2M21jakRGWUxJSGxsdStQV1crZTFqOFJtRVRW?=
 =?utf-8?B?T1c3VUYrN1BDTWMyUFN6QWhQcjFUdytqekxqRUROK2llRldxMDEwRU1KNUpE?=
 =?utf-8?B?NjdXWFIvWnpsalNOVXdZbGRTdm9GaDA2Mk9leXZKaGlUZXpGOEYrT2VwT1pS?=
 =?utf-8?B?eFdrQ3RJdEJyZEY5S2xoQVdnczZNSkR1WGtGMEJKdWdRSzVhdmxXNnBUY2lF?=
 =?utf-8?B?Z1FJblg4WDN6dFJ2Qlc5Y0w2N2I4QmZCeXdjdzhOREU1TVpJQmQ4M0VuWUlh?=
 =?utf-8?B?S3I3dFBBRFFjLzBvdU1Ub25ZcFVpRDFkaVZKZFBkcEp0Z1hja09SSWh1MFJW?=
 =?utf-8?B?U0Y3QllEL0JpYjF4MG4vZTJXRFhoSWh5eW1HdlJYdW1IMnR2NFppV01IZWt6?=
 =?utf-8?B?OU5aN0pvSlpDbG5OV3gxMTgyZWhWMmFSb1RTL3ZVbThQZ05ITmxmejFBdEZX?=
 =?utf-8?B?OXdkNFdlWkVWZERzYWQ2eW0xOHJCSktZOElyaHF5T3NYQmQ2cWhYWEJUQWVs?=
 =?utf-8?B?M0g4WWZwOFdsMklvM3E4RThydXlUSUllZFVURWtDcERvTHdjMHF5YlZjR0Q4?=
 =?utf-8?B?VnJlSFJxRWZDR09VZnNlcFV1ZXZHcFo0K0ZhUFJQc3NTTCtVYVBmUzJ2c2tW?=
 =?utf-8?B?eG54TklYOGZKL3Z5Q2VmZk5QeTdQVWlLRmhMa1hqOVJkbWl2akVEc3gxTU43?=
 =?utf-8?B?ekJoVHd1TkNkRUhiMlpFeEFOWmpEYkZ6U2FlQnkrV05vOWVpZUhhZ3k4dXIy?=
 =?utf-8?B?V0k0NU4xeERZOUJONWRzT0piZHBTR1ErSytOL3N3MnYyaTM4eFlWV1ZWWE84?=
 =?utf-8?B?UGhVb1ppbVp0UTMrdGVBM1h3eXdqblJycEo3V1ZyUTBHR2hjeW1tSHpSdnZN?=
 =?utf-8?B?ZEU3WTlZMlJPVk9FRVhkMU5VVFhLT0FMeWFoQlRLL0lHTVNxbVRpL0JKUGty?=
 =?utf-8?B?dUEvZTdkRkxWUUpiWHZLUzI2bktaSEFkRUhISVErZHZMdk9BS0ZOOElWMFZ6?=
 =?utf-8?B?VGNuWVVncjFGQ1l6S2V1bVRid0t4Q3FCTWhSM0g3U0svaFFKQVBnNzNEdy9t?=
 =?utf-8?B?cXFrbUxkWHUrV3VmbjFQQmhrYVIxYWRqWUxoSEF1dGIzNFN4c0h0QXR4OVR4?=
 =?utf-8?B?T2MzYTIyZEJjMFc0a3JYbnZPVjJOcDhqK1RIcVlVbm9EaGhjM3BKb3F2R041?=
 =?utf-8?B?ZkJkRjB0cjhqSExXRGl2Zkx1WGxRMGpPNzc5WktvU3RxaDVub1dENUVsZk9H?=
 =?utf-8?B?a3p6OHBDdzlxTVFIMTBkdUJDbi9jS3lPZ2xuTEdseDRxSFAyWnBlZ1B3RkZC?=
 =?utf-8?B?NnJIU0N0UE1MYmt6VVRLZGhsa1VnZ2FIZHhTaFBEdS90aURjSHF0S1AvbGpw?=
 =?utf-8?B?K1dKTGNhN1RKSk9RVXlSQzRlL3pGa3hKTWlqYk9oZ3BJOVdDUTU3N05CalBT?=
 =?utf-8?B?NlZBVytOQUphR29tWklpSW9maVhDM3dPZHpPLzlYWW5sVWZHR2JMMGJZT25a?=
 =?utf-8?B?ZFNDMEZpWEhjUDVpQVBvOXpOUWlqdVJMTXh3Z1ozMUlZQ25FOFdjSTVxcnVx?=
 =?utf-8?B?dnpuUm5HNlJVVkgyZDVxQTRZWnZRdzAvMUt3MWlVRlBkWGlleTMzdVNEaWdT?=
 =?utf-8?B?dGx6ejdGVDFZV1hoZHFvZXcvTSs0cWZUVVgwc3RGcmFzREVaYUplaU5OdGNo?=
 =?utf-8?B?aTBhWUpMRHZZc25QVmU1UHNyMU5Zam94Z1RkNDRvcVVjUzVXays1Z3NsV1Av?=
 =?utf-8?B?ZS9PYjZoeW9PdlJ5aUx4cHdrWTM3REVKaXFLUHZKVExlZTNTSGJhdlBocnJU?=
 =?utf-8?B?Q2Y0UXdqbFN3RUZsNlZUOHVsbTJSQXM1MFBUMnB0eUJhTk1IUy95b1h3OFQy?=
 =?utf-8?B?c2ZRVVdrMXA5aDRHVy9teTVZWHVtR1B3UTVkS1JveUd3UTdsMFQ1UG42RUJX?=
 =?utf-8?B?UEpnU3hpTm1jL2xpdEtaZU85dkwxSm14UFM3LytxS1NSQ3JHK1YrVkkyeEhU?=
 =?utf-8?B?bkxGamFZN29SekFHcmFZQzE1NlJMVE1VK2FjbTVoY0dKZXg2TkpOVElXZ2ZK?=
 =?utf-8?B?RXQ4S1NueFJPa09FVEhsWDduMDlWMGVhS3FXT1hOL0dRM0oydGhtajE1T2xy?=
 =?utf-8?Q?d0Xbw4jS6Y1wQM4nEFa9Qx2PY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea5174a-3b58-452c-1584-08db81f04cba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:22:08.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNxRAjDVSBhdJvW5VSq60bDsNJPwLpK2gvEUFKHhLIbPJrsvIpw/eNrIpbEEneDvnFqSTKSs9cJDVzBsnK6jWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405

On 10.07.2023 22:28, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Rule 9.4 is non-controversial and we have no violations.
> 
> Rule 7.4 is considered a good idea with the caveat that assigning a
> string literal to const void is allowed. I added a note to specify it.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



