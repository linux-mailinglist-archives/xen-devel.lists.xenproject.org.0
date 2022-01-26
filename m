Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CF49C454
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 08:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260674.450568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCclQ-0005qC-2l; Wed, 26 Jan 2022 07:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260674.450568; Wed, 26 Jan 2022 07:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCclP-0005nM-Vq; Wed, 26 Jan 2022 07:30:43 +0000
Received: by outflank-mailman (input) for mailman id 260674;
 Wed, 26 Jan 2022 07:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCclO-0005nE-5t
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 07:30:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd31dfba-7e79-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 08:30:41 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-yfRJQ-1HNHm22A8w_kNRQA-2; Wed, 26 Jan 2022 08:30:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4001.eurprd04.prod.outlook.com (2603:10a6:208:5d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 07:30:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 07:30:36 +0000
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
X-Inumbo-ID: dd31dfba-7e79-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643182240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmtMMuS2hcA8W4tX+j+C+yJxQBfFZ8yEL6wHR22FHPE=;
	b=GwP52T//OTYoBZElyxAaWdwwIc5DPT3aPS/U4QjOkq5ia7jv1+vez1QUPO2YzKRo+wHL8H
	xvobsQOz+jibdgeCVgdEee3ra8W0zm5j2Npl62U+ZkMkuMwxasjf31ZrejSJ9/g9l/R6CG
	wKNuHKyvL8xAnM8JmVltKoDCPE9IW7E=
X-MC-Unique: yfRJQ-1HNHm22A8w_kNRQA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBhlZR+rX51PMNghgALhL5JLQKsgA1NhQ7THla3KPIYbiYhT6077Z8FJ0Z81zB9a1CPUruirOKr5wpp8mmDx6maNQIWlQ6FbMfly84yPcKEn204uWbN63kb6G6kTewnbYstzHh8eanoh3jIpHpEuWlYLMHJomKRlQVI/YhWW9EvMUbvZPtxydBLMwosnAdTIbSkMKov4yR7M/OZ2g7CBIofCIemrvaDaPa6vuLSXZzWLkdE6WVCTTbPrDPV8bsMEuv+JC/PRMuKsRaZk2GZ0HB0VsMkPmZ1Y0rr5PAnuak4V6ynymJNvOrpZmuNwvwIVlnjB79XtWx9E5l2auItL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmtMMuS2hcA8W4tX+j+C+yJxQBfFZ8yEL6wHR22FHPE=;
 b=bB/dd2Ddvo6qRcvI1bf/e/QXPyriOA6UdgFRm7O16uCC4N9fcaZD6UD4ZqO60j00Cgfn/T5W6tbhb+KwfVIS6Mtd8DcRSSX+LNptiU7+LUQRvHTPsHc+l6NfMclq0AOTEoZHjhHnpnXy1ynAj5cx/KpymxhmrQillkxzIdFQfs7qh6hdOMCg48OidisvaKv4DFlI+m3x2h1US2HtCNejFDJdHAbuZAV323WFTIb3yOSx4IHuupbjvMUU6e3tKy1XCKxBTNLosrQfvGm+XXhyx5lBFPVzGitutdGy9KRutW58X8tpgVhlIxIXDollK4OK/4QTfjhrif61xET8HGqDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com>
Date: Wed, 26 Jan 2022 08:30:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
 <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
 <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72639f2b-28fc-453f-c6ec-08d9e09dbebc
X-MS-TrafficTypeDiagnostic: AM0PR04MB4001:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB400172422B2152E34AA5885CB3209@AM0PR04MB4001.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k0UJxlT7WRBTl5t5m6pOwAy6EcXt1BSUil081q0DonW05AVT77bu0z+YiCYHPjm0kpKOhGd43zDufZ4ehh83+Ea1vhIzzo6RnvaLad7gSryBGYEHoGGyviOR2KtWybVnDsXja+sdeNzMN1fSz46U1za0bNfHdoT+/5pDABhMcAPT3KRa0UVsffWRM3Plt4L+J1M4CdgzIcbZqJb/3vh42NJff/c8FYM2Zkq3TNjl7fGBxmCOMZNCZHAYzYxVMPkUHkeSx8111VfB+0gKMRoDvCCisWQ74wRRqLhUbyvCSXteh3Iij38d5c5VRXBtgfFm+yJ6ZbILusyYNKbdO80smsA/7qA81LqY6DBBQQuIeoQaNsUvTcT3pq16RGpnEdpIYzanW+OHvhw+JX9SJGqzrSms1aGMTl5KBWswUDZQk73c1liMak3LeLJ0K45ymN+Qn3c15hDTv7LpD768+Az8CzKNZ7eIQXt+9AZA50MVmU2zjUtxyHtp5h69edKBKfxeMwxeOYV69pbD6WXVMKPKo2FqkMEJHD1mLw6W0wJI+3DAfIGvyG8gXT6dy/cAqLzcO9y8m+MVg8sLWeu8Aj0oWntf5FzF+lDm1m6YNRfx8+7fEk45wXaO1eTqZkK3BmiEYl4wBmDA/lih2b5g7T2f2PFbpgsCwn+q2kmS/Te9bdHqPsYthVGdEQj5YLI00KvRlThAiN04ShG8u5AaMXGqaLL008AzH1E696nLFQQOhJCm3wWV+sMs6l0IuhAXII6g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(31686004)(6486002)(5660300002)(8936002)(4326008)(66476007)(38100700002)(8676002)(31696002)(86362001)(36756003)(66556008)(54906003)(2906002)(508600001)(186003)(6916009)(66946007)(316002)(2616005)(53546011)(6512007)(6506007)(26005)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0I3UnR4ak5rZW5IVDFtZHNPSVIxMVYrT0FEWU5LVkNmZWJIQ0RzY2VOWFRV?=
 =?utf-8?B?RVJIakF2dHloNDRMS2lWbFlZL05NVUdVdmg2dHhqQjZyLytQRlQ2SWNlNzZn?=
 =?utf-8?B?OGpRNklYWThjbVpDVXlZUXYxd0p2azg5SDhRSFQ4VXMwcVRJWXVVamFsZFV1?=
 =?utf-8?B?SGVUbDhZL2RlR3hpQ3libzlzN01TeVJ2RHJhNFhJWFA5VjZ5WTdvai8xNFBy?=
 =?utf-8?B?SlNCcW5FSFZycTF1elgvTU53UVk4Vk1lZTVWdEFkQjlFSzd0ZEl5N0pxc2VK?=
 =?utf-8?B?Y2RUdnlpQlN2SVhLZS9UaXRMQ0o5KzRVMkw5ZFB4MWIwODY2S01MQ3p5K0dS?=
 =?utf-8?B?LzlpRlE0M1U4WXRUUVRRaUM5blpPRWlLb05SL1R0Mm5ZTnVBZ016RmhVZ0o0?=
 =?utf-8?B?VkFINFlaazZjVi8rYzRLMTNXMWFNVEVGOHVMSUhOZU14KzNYOFRWSUU2SitU?=
 =?utf-8?B?ZzVZY1VSSlMrRThadmZaeW8rNTh1aU5Ob3pYT2NNNmhhK09WZkZJWmhUc01t?=
 =?utf-8?B?a2E4WUhmSWRSSGU1a0dBVzlScEJvclJjQkFFTnI5ZWZPaGpKUy9VQlRkME9j?=
 =?utf-8?B?dGJsanJSYWxwTGhCdmxKN1NabXEzbjdzL1RtK3dwQjlVK1BydVdHOWJuRTNR?=
 =?utf-8?B?b0FaVXNuT3NUTGoweC9BcHI0QXhiS0tVOVdLYVZzbkdSREh0MlcyUjRxMmxP?=
 =?utf-8?B?SERJY21IUkp0dXNxZmxVQWZDR2lkQnFaUTAxbE55UUJGU1FkQlZKRWM2UHpz?=
 =?utf-8?B?VXg2UlJhTXVKUGJDZlc5UWc0NGtGekRyazJUV1J2b0JJL0ovM1FheFEzWTR6?=
 =?utf-8?B?TFJNQm9EeTR5Rk9tVGtaaXQ0d3F5NnNBb0RMTGpPZlVGQ1dSVmY2NnY2UmIy?=
 =?utf-8?B?L0FwUGZ0NFprZE4xSVA5OFRSS0k4eDc3UmMvR1ZSMUtTcUgwdmk5VzhIL2Ix?=
 =?utf-8?B?WkgwWklyVUMyR1ZaMnNCQkhNNnU5ZVNHd0FJcVNCZXllcy9HMWdlYis5VVhZ?=
 =?utf-8?B?TWxRRTJXMW5WeGF5bkdHaXFybVMwdTBYNncyeEN2bUNPTFQzakxNa3l6TmVN?=
 =?utf-8?B?STJHcTdnMVV0dWtwOHB6eTBvNnFDL2MweUlHZmJSQWtmQThoWU5mK1Q4dTZH?=
 =?utf-8?B?KzFYbE1TMkZPdldyNW12Q2RYc08vM1JrWkJCekxjZlEySEduUVp1R1ZaL2ls?=
 =?utf-8?B?K2QwYzVrYjA4Yk01dHpqdDJsRlRML05OU3VyR0RoTmZ1dndHdkxYWWlYMWlL?=
 =?utf-8?B?VmVmbytOYVM1dmtvYVNVSnFIU3creXBhbUQvTFY1bXBIS0Y4YStrQjNuR1dB?=
 =?utf-8?B?b2NJWC80SkFLUVlONW9UT200V1JkVThvazRIdkpFYzBvN0UyZTRNSmxRbzJO?=
 =?utf-8?B?MmdsTlRKdGowemtPalBsWkNtVHVqVmNNcldBaWhra0tueFIxL0xKTENySzRV?=
 =?utf-8?B?L2oxREMwdldrM3lWcDBjOGo4OFBwbnBLYjB1WGh0V1crVkw3Z0prMUNobGRS?=
 =?utf-8?B?UlYvVHB1b3doODF4Y05RQkJJb0JPbG15NlRVYmNRTzFORDVCWkNvMmJ0UkJr?=
 =?utf-8?B?UTM4MWZSZUFUZFVlTW93dk5nNngxaE5mMjNBZjlUTzdlYVNTbEJTVlV5elIr?=
 =?utf-8?B?dzdWOTQyYWU1Y0tUQXBTNW1CSjJlMUtJRUJhN25FNllwcTU5WXIvMzhjaWJ6?=
 =?utf-8?B?V0wxbVBqaGxPZzltU0RKa2JUa1NWcW1aaTkwSVFTSG4wd1o4Y2lINS9WVksr?=
 =?utf-8?B?SUFaeDcraGxTT1YwUDIvdFprREg3eEpBM094N2Z4TFN2eGN4dStaY0p5UHVu?=
 =?utf-8?B?bzdxYndvaFhoRFBqWi8vRmYrVFdXZndrSVZFSGxpaEJscER4YVlySGFRMUJx?=
 =?utf-8?B?THVWUlN0c1BiUmxJTXE0MkZMRkdIQWhLYWNubmpjUjZ2Z1ZyR1RHZGF0QWN4?=
 =?utf-8?B?TzlPTTFIZ1RjQVdYVE16OFQvS2ZTZ0x0Tk55UWZ3K1hSRTBiYnl1dm1iSm00?=
 =?utf-8?B?WE5VQ2k2WWpOMXU0WS9sVTZIRmt5ZmhMdm5rZ0xQejhBY1BwQTFEbldvZjRj?=
 =?utf-8?B?WForWlBtZjFvZXNCVGI4TFFxOWh6Q1FFQ21qem0vVll5L1hUWitrdmR2YldO?=
 =?utf-8?B?eTNwcGhWdUdOUTBEWk1vMytCSDdkejlvcTJDVkRWZTV4cSt1L0cvcUFVQ3Zy?=
 =?utf-8?Q?vnlSIVTW7ga+Szk2h0BbCtk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72639f2b-28fc-453f-c6ec-08d9e09dbebc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 07:30:36.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzJHQbBxbAiYrYHmpG1kpNOTDBi95kBNU7GWeaHI8WFhRPqr4MFlh351f01gZk0JL/PEaeF8iiVLkIej6lLJiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001

On 26.01.2022 02:03, Stefano Stabellini wrote:
> Are you guys OK with something like this?

With proper proof that this isn't going to regress anything else, maybe.
But ...

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
>              return 0;
>          /* fall through */
>      case XSM_PRIV:
> -        if ( is_control_domain(src) )
> +        if ( is_control_domain(src) ||
> +             src->domain_id == DOMID_IDLE ||
> +             src->domain_id == DOMID_XEN )
>              return 0;

... my first question would be under what circumstances you might observe
DOMID_XEN here and hence why this check is there.

Jan


