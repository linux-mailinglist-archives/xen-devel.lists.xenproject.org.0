Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E254D4D1BEF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287115.486941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbx6-0004vP-Gy; Tue, 08 Mar 2022 15:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287115.486941; Tue, 08 Mar 2022 15:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbx6-0004tJ-Di; Tue, 08 Mar 2022 15:40:44 +0000
Received: by outflank-mailman (input) for mailman id 287115;
 Tue, 08 Mar 2022 15:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRbx5-0004tD-4j
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:40:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c78aa2e-9ef6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:40:42 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-2iWYIUtpO02hgZC1zqwS3Q-2; Tue, 08 Mar 2022 16:40:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 15:40:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:40:38 +0000
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
X-Inumbo-ID: 1c78aa2e-9ef6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646754041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klhwGBiEX68giHVeLF5GuUDfbg1XCXAVNjJ5rg2LPqI=;
	b=Lhf92BzBsI8nuWYG6XQmWnB75+EJwuHNLAFasha9FEAysiZ8PgeC8b/oSaKy8nghxYFwh/
	++elQ/1h/r/Rl91pJ/PsX6ooVdJ5166AkBoc8aWpCQ1o7RVI5d90bIdJ1fH6NC5aNJ/uj/
	Fs8I65daRgcN0rbZIxekpVMKDyEHpWI=
X-MC-Unique: 2iWYIUtpO02hgZC1zqwS3Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbWCK/Jw1MRIj1gQ3j0dwzNdTfa1UzU2NnZGzNFWM8uKVHX2BEXd4PHycksDWA/9vEseH8CfCdfANym4qoXh6cGuRyrtceC/H2jDaCSyZtm/HoQ9UCFZjxL+6FbJooQeDgTGEs/pks7IQ88BibayKvtU9MwYH0ZqOWtDprvW30kw5CGdg/YOD8C2qmUpRNTmU7XhsPTjwiPQv0wYmh09/12BZscj2g4BTNKWdxecDdHB4gmYcNFNLiTT8i9SmwBR8WIuVIfjDMzSwI9feiDe2E2jHufixYWgr/hbjOjYEsEb1FLjgl22E1xsARMqpBcjTUxmOa/vwI1Or0TGshvdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klhwGBiEX68giHVeLF5GuUDfbg1XCXAVNjJ5rg2LPqI=;
 b=k/6241eh7EfNYb5ik5NFDsPqRGzjFV2ZfqldwKVu0+SOEuYalLTzPrE3R7PTj7aT5jF6Hc4cc5euWZLNBu4Sf6oGPe8QEZb8tQRX/BYERkz06zp480bYlL5CwD/N05ODJqoXztc2TXkb7J9bVg83gSXEO5uMoE6l0gpO//laijtEZkeo96kf5bBbwHaiXNFWg7MlxPRNl/q5KADoJiFU2w1LweJKRg4jxiuMaGovhN+8nNymPYaf0OvzHVTVIrtKKx/wXH0odHr465YyH0o9nayfteIV8lVR5gdpn0f7C6e/lEu6+3GD33draE1O/pYU4KQkUw1MEqdITTnfzgA8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69a3f10a-f447-9510-8e3f-7a5fae42ab96@suse.com>
Date: Tue, 8 Mar 2022 16:40:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <7e547248b6c24b9f3761720f84919614af69c802.1646752948.git.doebel@amazon.de>
 <7807aba5916fa4d983ec876ae560854093211cf0.1646752948.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7807aba5916fa4d983ec876ae560854093211cf0.1646752948.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0001.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6a9cbaf-d20e-454e-f036-08da0119fe5b
X-MS-TrafficTypeDiagnostic: PAXPR04MB9155:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB91552B6F938852093DD77245B3099@PAXPR04MB9155.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HTTzxY2qMHGxMR5jJ0WVR15q8WJp4DQixj6tr8aMTN1+cYxd5ps8l4VsgCAR4SwCp2qQevlIcMaPy0j/z2bwFULDgkKIxQvq96cAE07cWBE7Jody8lQ4wNKnAJGLdGctXKRljfc8WVxEEAxHgpkglz+xXnBPk1xLqon71NPO1feiYPo2V+7NNaIsx/cIMjnpq99nr/PVexnDJDodl7rPDIJxRLmnq3h2QBliX3ywkK35wYbk0bsHHAopm8yN21X3U0wCboJeMFILADs6TGIc8AYjSy0UF5jn2L9vzL6wNaNJWu1HlJk2GmyUMQmhF2cE2mDIVGyCdROv+61q5/vFCuGHbB/N8vmGH5i6SFungVU2KtQ/7OkN3eeiX0x0o12gseODWa8GNbMnLxaKg3HCr4r05fqIfU7g2blFRmOCaDIYdS0YvZ0EeKbHk9wQtibJjd0kxdJao7znpkXPgQd0wsvvlo9uIBR8dF2Tt2vsog2VuR7P+3nOZPk8HUmHIQdfsvKcf8sTgn4rvK/p1lM8223IN7KRJYvSHMBJ5+0/YgZCITViXztvZ37YWF8kIqO+wDE1RT36Nld+ihY2xFXYlXOdMmTEAjd7QHoo94aoF3sK0KP6mmPgaVkHstdATZWNSj3QyyBX7iY1/Sr+BgrLOMn7K7jcVnJrl+5dUZl0H2z1EJxsrCo/+ckHPbzt2mUCV9JqbX7GUpByBupMqvLjpIVoReKn0qQBH8OFm5MTuPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(8936002)(2616005)(5660300002)(26005)(316002)(31696002)(38100700002)(6512007)(6506007)(6666004)(53546011)(4744005)(83380400001)(186003)(54906003)(508600001)(36756003)(6486002)(86362001)(31686004)(66476007)(66556008)(4326008)(8676002)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW8xaVJoME1zS1o1ZkJCdGY0RVNrVE43Vk8vRjFjMVZVZXc1bFVLRjk0QnJB?=
 =?utf-8?B?YXZHemcraUlqUU5PdlNZTktnY3lSL2R2VitKN3YwN2I2d0p5bWx3NDh2Z3RL?=
 =?utf-8?B?REVwV2NveW05STd0WkNmdTRPOE8zc3ErYkdPSWRLZmxRaHAwT2Fua2dZR3BL?=
 =?utf-8?B?S1FTN3dTa1dpQS9naUVBRDZOOTF0RUNoc0FXVThORjh5SlpROVEyWGxpZHdY?=
 =?utf-8?B?R2JuN0NBMkxXM2lkc3VRNTNyaWk1ZWF3NTVWejVhL1YxY2xDUEJDTEUwM1pj?=
 =?utf-8?B?VEROY3dwbnVqL0tGdDNRVVhtVU40RHRZNitlZ0RVWTRuQkF1ZFdhR1ZzQ0Fl?=
 =?utf-8?B?V0xMWVZ1aTZzQjJhaXNabEVJaHZhc1VrdDNPR3hUdE53MjFLcktUQ21RQUxs?=
 =?utf-8?B?c2pQSXRCcFR0UEh0cU16SWtGV2g4bXhEQ2NiS3hwRTlyTTIveEZ1QmNBYmlx?=
 =?utf-8?B?bkFQeGxUR3lqTE5PT01qNWhrbm03eXVqeVNDK0VzbHlKWUpneWpxTWE3VGNU?=
 =?utf-8?B?MlQ1RUhzU3NkQUVNa0JpNjQremdCNko0YVBiTE03cEVCTEhsOGxGdHQ3dS9L?=
 =?utf-8?B?eHR5QkVaSkozWnBJa21XOFRncVdvaDJBR2J5dVdwd05nVXUzV1AzaFppYTJl?=
 =?utf-8?B?S2J4Ui8rVkpwV3A4RkpId0RQVDR2Nmk4ZjRWdmVockxtdGxMc1g1bjRhNTFo?=
 =?utf-8?B?cE1EYXJ5UFJEUDFGZnEwd2pJVW5yVWFaTmQzTzJNN2YxZmU4NlFKZmhPeStk?=
 =?utf-8?B?aEhwQ3prZFM1RHhaZG4yMUFHQll1NCtrYWFPYVFKdzB0Q3VPR2QzcEVMd25K?=
 =?utf-8?B?ejdPS2NTOFJOUUs3d1krSU9QUnpWcWphN0N2aEdWbUZGZFlINVZKSUZGRE1J?=
 =?utf-8?B?anhJSW8wU0xDNmFGV0MvYTdUcTFhMDhUVDZXWDN5bGdiblVaQ3pneG1xZDJL?=
 =?utf-8?B?Zys0RjFPSVVkTEdDYXI5RzNNMEV1OCs5ZVJNbkFVQU1vNUFFYTMwUkRlTWJ1?=
 =?utf-8?B?M05ad2lLaHpFTG9oTndMa281ZVJJVW5uVis5Z3ZVTE5ZUVNsOWNGVUhFNFRW?=
 =?utf-8?B?N0VzVWlwQVFkRzA1aStJL3VUbGlOcFl1Y0RENXhPRUViSE1rdStBR0pRYVZX?=
 =?utf-8?B?MEtud05IZjN1R01tSmFmN29zWUxoVkk0V0VRTk9nb3grbEo0bDBuci9EM3Vs?=
 =?utf-8?B?bW0xMzNqMDlnQU9naFY1MTc5RlFpSkZ4aW1zVFd3blZRbWpEVE52eE5uZGRH?=
 =?utf-8?B?YVRNZ0lJVGtNZGRlWnZyRklMTVhneWMxL0hHd3dQMjlUSmJRTVUwRHdsbEcv?=
 =?utf-8?B?am0zTXNDWFl1dFcvRlZ3U1NwcStlQXI1WmZBbm1vUGJHblRPZ2hpMkFBTUZs?=
 =?utf-8?B?c1JnQVNORy82akh2dFJxMWgwVThzOEF3eFdCWmpuWGtFdU82ZmJmM0tQRnlZ?=
 =?utf-8?B?SExma2pWSnV4UC9pdE54ZGZLdWNMNi9PS1NUdnBvc3YyUG1ZOVJoMlRHMkxE?=
 =?utf-8?B?aGJrZndxY0dVVForeFVpTkZNcFp1b0VrdjhMZmZpZjF4d25mZ2tMUjEybU52?=
 =?utf-8?B?dlRPTWNzY0VVRDFVTXlpUlcwL2xPMFc0K3dlY0IybUwxRktqelZZdDd3OCtJ?=
 =?utf-8?B?UExzeWF4Vk9vTXMwZk5YZUZnOFd2eWdqWmdLbmhmOXRNbmkwam9oSWd5V1JR?=
 =?utf-8?B?Wm1aTHZ4TjFmcFN5MWtZNlVpK0t6ejk1RWlXSEVWbW1tTGsxSVdHbDhIb1V1?=
 =?utf-8?B?NjZnaE82VC9nUXk4ZlRsaVRxeE1UL1BETTdLNEVsNXBHMmxudmQ5Q3JTSENp?=
 =?utf-8?B?YjdTSXZHS1ZOc2YwSXEzL0NjR01TTExMdkM4MFNvcjFzVTI5TmQzS0NBcTU1?=
 =?utf-8?B?eldpU0ZwRy82NzdObGM1ODlyNVFKdEZhdWxsdDFQZkJuc0puWnhwTnZBQ1JE?=
 =?utf-8?B?YjVsMU93TGlYTlNZVzlGelRGcHh0MG1OUzA5bysxRHZBNnZjd0lIVFlxZXc3?=
 =?utf-8?B?aVJnOHZ6Q1B5Z0o0MGxYSk9kNlE1M3R3Q090d1hoem9jWThiTVRXSURiK3V4?=
 =?utf-8?B?VThGUXFkQUwrQnlKbjRoYStuWUlkRGhLQ0JBWEhmS1hTTjdQL1VTUzRCVGdY?=
 =?utf-8?B?ZW1KaWhZZVZXdTdTb29adDlLa3FwMFp0bUEvRzR0TklWTmtURE9CcmpnVmI3?=
 =?utf-8?Q?qo2awEfvj3GCNiYqKiS/yyE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a9cbaf-d20e-454e-f036-08da0119fe5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:40:38.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVTln0XRJkszkNvvXCamPAyv44Kw3UUWqCpkHGWJej9fSsejGau2iMx4a7TuOlmRBiazZarRjmxjCxh2E2WPaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

On 08.03.2022 16:23, Bjoern Doebel wrote:
> @@ -127,15 +161,21 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
>  void noinline arch_livepatch_apply(struct livepatch_func *func)
>  {
>      uint8_t *old_ptr;
> -    uint8_t insn[sizeof(func->opaque)];
> +    struct x86_livepatch_meta *lp;
> +    uint8_t insn[sizeof(lp->instruction)];
>      unsigned int len;
>  
> +    lp = (struct x86_livepatch_meta *)func->opaque;
> +    lp->patch_offset = 0;
>      old_ptr = func->old_addr;
>      len = livepatch_insn_len(func);
>      if ( !len )
>          return;
>  
> -    memcpy(func->opaque, old_ptr, len);
> +    if ( is_endbr64(old_ptr) )
> +        lp->patch_offset += ENDBR64_LEN;

Don't you need to use was_endbr64() here as well?

Jan


