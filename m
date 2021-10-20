Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DED434AA2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 13:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213883.372244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdAFR-0000ak-SL; Wed, 20 Oct 2021 11:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213883.372244; Wed, 20 Oct 2021 11:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdAFR-0000Xg-P2; Wed, 20 Oct 2021 11:59:09 +0000
Received: by outflank-mailman (input) for mailman id 213883;
 Wed, 20 Oct 2021 11:59:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdAFQ-0000Xa-DU
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 11:59:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76bda02b-777a-4a26-aeb2-c5fbd14d2158;
 Wed, 20 Oct 2021 11:59:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-JOG3K-aBNTaA7zaCglP0ww-1; Wed, 20 Oct 2021 13:59:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 11:59:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 11:59:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5P194CA0012.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 11:59:00 +0000
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
X-Inumbo-ID: 76bda02b-777a-4a26-aeb2-c5fbd14d2158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634731146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oe5YFwzDQBTv4wzm5wrQCTOqf6iST7DQnCBGT4XuHM=;
	b=bKVuqcSfAe1EUjiGaUo7GJ3wobQPGrbUghSSaOflKte3j3oPFpgMdiYYlLylYWfpzWs/j4
	9/e0iOaks9B2EnKeWqiVQlRMH4G9e+XmWMhjrj9Z36qbpSAZEeIfmU1ISaJ4N9dplAsQNc
	P8VaQNpJsj6T9LD6+uc5eV1XdSQ0hxs=
X-MC-Unique: JOG3K-aBNTaA7zaCglP0ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZrYCXklGM8ynuGUrO4LJxV4GxMPVVAe8wxZftN1B9kCU0TzHAuv1SV0e+5wLKYLQDidJo+9uu2NPFQwxLJxBHo3cvwZRCiYA0i46sKs4BnwvmRAZwJxQJJak+nWgzGvDRpWa/VE+J9eUjJ94h9O8s8J49MrFxPSMTwObgS4x6MR0n8DiQojXcpQKO/IqB0BOJqKJSv791GW0hd8+Eo/PMI8oyKWo0RNspMmWYqJ2RC7vj3bVSnJerCwaSFRX2CJVrjNmz9J2JTXZkQ811DMoiE8EsMpVi4C1eSbW/Xpj7ATEEI30w4ky4eh95uN4j0gGzfscnoyb4YEntQT2TotmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oe5YFwzDQBTv4wzm5wrQCTOqf6iST7DQnCBGT4XuHM=;
 b=Rr25lw58aliCWrbtUJZvYa4m7MRuPqiaVWZ2QMS3lnKdifwJd+iZoR5HZa2I33xxUKUjbei7o2saP1I5dVuH0hT3fhQ2tZwPwjl2bXlX5sn2qF2yT07Ahcvlk49cnHD4OU3Nzgz/lYS8FiSqnLyqA9BjIFThCIaBV3DjElJlDZTo7Gn5hlRWsAynBtPDwcLvdye1/495SdjbYOZE54eSHuXjw5ZH3W3dkHA887eargpREs/oTovapHuNdaeC1Uo6GwW4+MvBfwb1OB7FsWeTixqvytF1Kuz1mItcXBOKVtQ6zJatgbfE0XfdmOVcbY/R9lrlnM2etqFutcqvcqtOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fddbb3a-bf7e-2a39-e20e-7994b3d74d2f@suse.com>
Date: Wed, 20 Oct 2021 13:58:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922082123.54374-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0012.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8013dc3f-464f-4040-6881-08d993c1019c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6174DDA1024933A6BE2160FCB3BE9@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c4SIU1CAZnI3ewsqBdIdlmk8m7VnBZjEPHGVExCw90k2vSa/fpGNdEG3VcKnhyQzah3k6+FupSX4EDoPJhJXAS05mA1FaMUZGgOR7Bj0jFfPTy4MvN+vnW5U8JlJd7XFloCTKxAkOB6qX6OM6B/i9MQGSGYVKp5D4dvQjz5SSvmqhwzUSqNDda9NyQH3xBNX+Ut4MWiR3WsvpJyKvtJ/TdCZDqWFcADuWZaShbIWFZHYOF1SDFLmIX7/rTmCkxT5t8bnWj8PCXacgVoTZaU3E9U66eRbkbNxV4yxxjFmMir9QxuFSb6OfpnU70KiMiQwmDTLS8d2yaYNaMyybpKJzFZUMePP0R0MA8Us00UqZxEdK6ae4X/g04OsFX+twq7fU+K438tR5TO3lY23sLIewjGAiVOrf1j/Vd9i2Y6RzHUaIO7Psb5f/s13a3kk09Cnd7s+xaIZz4IxpL7CO0Ljag6/ZcE/cltAW21Z5qNBS1iEj8XM6aXU9HuFFo9y+7d3VcFh7CsC3WJErb9O72kfpP8fXRiofzt7hoQvLeeMe1jzuuOtqG16tAXePLLBDQOnY7zkxDmdYFuAdzgAvT36eoOsBCK2Vc20xZKGXG2YAbnkBqZyuB9CyiJgwCxDm+j/00hb13cjcVU9VFfEwAlpJ9y3kqUzfTayYXKRQB0Yq0ZqkgFnqC2CChXjplzX0yPDvpvdIuWctEKFFT/cXXsfyiz/dNv+BUOmolVef5ytgBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31686004)(26005)(186003)(6916009)(2906002)(7416002)(83380400001)(66946007)(66556008)(8676002)(31696002)(508600001)(316002)(16576012)(2616005)(6486002)(53546011)(36756003)(8936002)(4744005)(956004)(5660300002)(4326008)(38100700002)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU95SnBBZ0k1TWxvNW5iQkpnSlU2dDdvcmFBbWx5LzNKRnhNVUkwSmxBTURt?=
 =?utf-8?B?QXEra2x3YzJsdU1KVkNjZ1pjM2J2YVBYV21QS21GS2lMZzRWZUxhRFB1cDlw?=
 =?utf-8?B?Yzlma2tQazNhRkMwZXVMZGMrVmdodUxSMHkzQ3h3VW8rc0VNTDlXZW1GMXhh?=
 =?utf-8?B?S1NXTitqNERwVHU3cFVXWjdFSjlRNEZVSlJaOExvQmxpM21YUE9QSk9JN1RY?=
 =?utf-8?B?cjVtVVFBYnNIclpoUXJZbW0vZXNyK25jQWJLUFR0clIwK3pzanRET1VhaVdr?=
 =?utf-8?B?RmJ2cXI4cjJNd2F1SGVSNUNicDAwTWcxU01MRXMwdEY5eXpYNEpsQldtaGZh?=
 =?utf-8?B?aEJGVC8zY1g5Ty83U3BoY2tEcXFvRm5EYlNsMXVWbkM3WGJZVTB3TmFVVVR2?=
 =?utf-8?B?cWtsdTJOVkFJa3YzNW4rSUpJYW9QSUxVOS8wbzZFU3JOSnJ4NTRWeVFzT2xT?=
 =?utf-8?B?ZjI5cjI4UWZMK1pnMTVpV0VyejVsV3FjSkNQUVZiM212bVoyek1tNmFsRlBJ?=
 =?utf-8?B?UFR3YzMzdnFTNW1pZEtXL3IwWC82bWh2cVZ6ZmFCSGlhTk82ZERtL3VkWUtk?=
 =?utf-8?B?YUcvN1h3T2Zld293WFcraVk1SWxxSVV4eDJzMWw4VVJNQlF4SmVEVUZ5Vm5T?=
 =?utf-8?B?YWtuWEZqQ0I5NmM1c2gyeTVHSlJ4TXlldmNvOWp3dWd6NFRYNEJlSTJFUTRn?=
 =?utf-8?B?UlBwRVBiVnVSakhOTWRTRit3Y3h6cGRFVElOYVp1c2hBMTdHT1p3cnhDVzcz?=
 =?utf-8?B?SUhpRGQ0Q3lWdWhkWWNHTVBtbm1hSk9TdnZ5VDdWTi9mbmdLUy85cm9RMEZJ?=
 =?utf-8?B?RUZYWHlrT1p1b25nM2czNlFNMDhYOFpjRVEySDY5MEJTN2hFZG1nc0VNL2xm?=
 =?utf-8?B?Y0VxTEFCQTd2V0gvOFlXcEZ1NXdJSlVJVkRIY0p1am5qZWt2czdVcmw2N2gw?=
 =?utf-8?B?N3lBKzBURlZSSU9NRDFaalF6UjhaZnltbm1UbG5wL2huYlJ0Tm9LZVZIWUwv?=
 =?utf-8?B?ZUJzMDRvUWZ2QWJVS01SeXd5SmhGR0tmZlBDVnhaamxBbm1HSUEyMFhCWWVY?=
 =?utf-8?B?SWR4TkRtaGZCdkxRM0tKN2dkMEJiVWdlbVl5YnFTTTlJQnRmcW8wK2pmbkRO?=
 =?utf-8?B?Tmd4eVhJOElrS2dERDk4VlQ0ZWcrd05iK3lFQmRiWlZXc1NXajRFYWdvMy9u?=
 =?utf-8?B?V3R4T3RUWnRmbTAyMkY2REJuWWYxaG9uMmRDd3FPOUZGS1ZJZEo5VXR3OFBT?=
 =?utf-8?B?OGQ0RVM3V1JXVld6NmF1NUpOZGVyOGgxV2RhZW1pSXUzSVZVVlRaUEN3czcv?=
 =?utf-8?B?dlpKNzNrVEViRlpsREF3U0xHZEl2dXBGdE9zNnBhWUxRRFF5UWhwRzJwNzh6?=
 =?utf-8?B?SUhnTGc5V1dNYTVzL3FqR0g4SmRRZXlKSXZXdDMzVUY0NEZIbVdoWHF5NXZu?=
 =?utf-8?B?OEJDbVIvK2trbVlyTWo1NDhtMFJFOFpZQkkzckNCeW9QaVdybEpEVXVYbmJ3?=
 =?utf-8?B?RzlOclFOcVdrUnJ1dVk5Ly90Z1RpazRGV2ZoekUrYkIrV1FVbnJEREc2YjlD?=
 =?utf-8?B?RGJvY1YwUk8xRmRWa1FWRXMrRklDMUlSSHJ6NUw5cnlrVkZNampENlNJWDdx?=
 =?utf-8?B?VWdNUUlIM0xNWURHWGwxUituQTB0S28yR2pKcm1LWWovYko0bGcvZGZpaHJW?=
 =?utf-8?B?eklxd2duYk5oeUFkNVpOVmVnejVIYUxEbDc4Q1o3RmI5dDRiREVvNEM5STlV?=
 =?utf-8?Q?9DypI2334Chd/6tpSMInfuKgBH5v0OMdwUljxa1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8013dc3f-464f-4040-6881-08d993c1019c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 11:59:01.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 22.09.2021 10:21, Roger Pau Monne wrote:
> Introduce a new domain create field so that toolstack can specify the
> maximum grant table version usable by the domain. This is plumbed into
> xl and settable by the user as max_grant_version.
> 
> Previously this was only settable on a per host basis using the
> gnttab command line option.

One further remark: Already with the command line control is was
questionable in how far people are aware that PV guests may need to
use v2, if the host has memory beyond the 16Tb address boundary. I
wonder whether permitting to restrict to v1 on such hosts isn't
counterproductive. I guess at the very least a warning may want
logging.

Jan


