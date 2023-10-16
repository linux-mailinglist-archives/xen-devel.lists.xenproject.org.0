Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5627CA496
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 11:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617401.959958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKJw-0005D2-7A; Mon, 16 Oct 2023 09:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617401.959958; Mon, 16 Oct 2023 09:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKJw-0005A2-3m; Mon, 16 Oct 2023 09:55:32 +0000
Received: by outflank-mailman (input) for mailman id 617401;
 Mon, 16 Oct 2023 09:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsKJu-00059w-Om
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 09:55:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2389c170-6c0a-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 11:55:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7836.eurprd04.prod.outlook.com (2603:10a6:10:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 09:55:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:55:27 +0000
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
X-Inumbo-ID: 2389c170-6c0a-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQGNabtSxeD+TabdJQSxe/2hBrlDUc6A4VfskdnMMrk/9z050jjD8YD9INEKfmeMlzn9HYTiVwWGiYc3Vdn3Xo4BpQZS3QVeERu73tXrpaNE5H310VdGeoaonauoGov05s6ky2wPoXlUhMLYGFnN/MhPwQ1fAbxuHZdzjJl4C5ydjdsddcP3D/M4Ex6kfuvWt8hZ9Zm1mcLX363KP9py87h0pvSyeAxjNS+R18N4RQIPRatLcHpJ6oMLAI9LSbEUHls1o+4gIzlslbdpENgnRKgHI7qjIcDZeU4i9jPlFDH2EohSBGqkXXuk9bM8BZKnnO0eeYFJFg+uhF9qTmbFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt5jiyNVhpPgQuwG0sCmBK2m/Mdk3BY81XatDTvUZg4=;
 b=AtblVHVjS1YfcFK6pVuzBu91XCXeSrKVNFnFUsmG49YC7UdOJrtcC+jx6vS109RpGIY/bqaxL3e7Dnif0E6V1FbVwWOOdWRTgnUpSe09bfmzWUDL7cDR6RSSztd6zAI2Tw3n2HQCrtmGeKVb/7pCGSUDCFgYFqSmyNIZIlTMsMCeJBPSyfw2DYuZXTy/bZTdndfprGDoEZ3N2RPl2RzXa+57zsjhtkKntOEONuPzULMif+4SNGU+r0u7oMmX2Xk28EjJbha2oybpuOMz7bWk87CqO5GAAMa2RRMToVxvnjzEUSuJuhoCtW63m7uxXLvnZsH7OJljHv/8EDHOkWo97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt5jiyNVhpPgQuwG0sCmBK2m/Mdk3BY81XatDTvUZg4=;
 b=UzSCTzCYu6RpMUIB/Yf0qQePl75qQJlxP+cSKyUrU9XiRHguul9cZwyCpsc/lEzApjF3d6m0QMt/U9YpG8123s0AlMMdeWRK/pLEoteFnobv0WxTWW9UDB5om2h38KRMouCOrb1KRRZFcg0M8lK5Dp2hNT9lh6JQlUsX8bvh0PgfnZzMGAxvj0kuLFJLE+42LTK5yKMyA1DBgd3tL6zWlqn52kzMDDJ3vEVqqdQPkhNj+u4/yU8A9BI4MGaYIFoJbd0eHn74bd8Ti7zPyBSbk5vZIiR3/xsMQPCygMZcOuVUUewQwp8D3yYej+m38e2ESImCuWvYghuDEs+h1SYd6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66f7bf81-2bf0-cdd8-8dde-6439c4991468@suse.com>
Date: Mon, 16 Oct 2023 11:55:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <081ae245-9d47-4cab-ad64-54b33566429c@xen.org>
 <20231004135331.83736-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231004135331.83736-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: efd3ee0f-5643-4431-91b5-08dbce2e0638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GGxtI/Cmbu2GtuiRchXu5c4XhljNaTHigV9MTQ4BLdrTZ7X64XdueHudCPjS1RNPq/hZus0bPcNZWjQPXQlrqOnVkg5u/8amtE2DcGhnkBaFZdx7SHnk2Cr2EZ+IGEVYiW3FIcm16ig+xgVF3SF2lpxNo/XOi3u0+yK081mXDEtXkGYx7ZnJd0XoE8nVel5mVNMctHXkptruDVW1mYpkbYyQSHuW4duFsEZ/BvRf8ubpqz/+DSUpPnJYFkw9Fl6cwGZqSmR6UKnQGRZd9F9T0tTGJDBZt4L+R4xbNKCb46JaJJVUZdPeolNGAXBTrQ8qfqauT5pUg4QpGaFwziizo0xmL3CPHtXnfqqes3hclZKvkBzKnE1ZJWcFsExUEsG8CW4jcD8g4IN9VqXFdPCHDABWtir48END3QH5CByO3T04QSrh6FxiRNAat698U1QcbvZPl4l5OI9/csXrQFPoU1St6e3DiNco0QwbBXyJOI9C6uFSOxcju2JQcHMXouwUUE4v/mevixCp8JcZu/51DfApLUHS5Nj2734uSCO2m/EEAUKtA+mNnCCqtJyaqu9WgVliD86lmJkrJ6FmzrDsYXt7FhnE587SHu2A/dAUIQT3E84HQ6OJQgfyfoDbHdz7dAlWj6anfgCY/PAWY8AMmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(478600001)(2616005)(66476007)(54906003)(66556008)(66946007)(316002)(110136005)(6506007)(53546011)(26005)(6512007)(5660300002)(8676002)(8936002)(4326008)(2906002)(4744005)(41300700001)(86362001)(31696002)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkZ4cCthMXY0NXNYY2FNa2I0cnFHVzIyV1lZaFlUYTRYTnluYTVsQXl5VzV4?=
 =?utf-8?B?Nnk0QjB3eUxPYzZMckdPNXQyMHpVaXlCUXdUeEFNbGoxVXBuTVhnVjg2V0Y2?=
 =?utf-8?B?M2w4NFVMVWdJOGJkaGpWV3d6N1BOZ1JlL3R2V01pZnNmQ0JJQVRkcDYwWlRl?=
 =?utf-8?B?a3g2MG1vOE5mMWRpaHlkc0V3UTBxQytvUW51VVh0d1IxeCtnTS9EQ1ZMeWc3?=
 =?utf-8?B?dERtTU5yRnc4TTZOQzlnTkpud0c5YlJCWWtSUkxNbmZBS3o3eXNLY0NIZFk0?=
 =?utf-8?B?d2V5djMvL0VtZHVDSlJob3UyczlCWmlieGY1M3pablMzNmp3SnZJb2xmb1hB?=
 =?utf-8?B?VS9hUDZ4cVliRVBrTE42V2NSZXNZejNOTC84a2RCRzl6MkprUm1Rb2xaTmpm?=
 =?utf-8?B?U0M2RHg3OW8wSzlIRWRyRTRzRzlwd0JZaDdjMmd1b1E5bWxiUFpvcGRQMWNN?=
 =?utf-8?B?eW56UDZseTU5M0tWbjNRekZ6cmRDcCtQUGxqbExNNWJONkM1K1FwcXR1RXJw?=
 =?utf-8?B?MHVNZnJMN0wwK3h2bjlyc3BkUFYyekJOeStsQVZFdUd2Y25iWEdkNjVjeVRz?=
 =?utf-8?B?VWxQcHJJODBMZm9oaWdlbEh5cHJzWktTbzB0VEg1TFQ3eUtueGMzdDlzaXcz?=
 =?utf-8?B?QkVYdUw5WWREUFVFLzlZM2dRUXhoWDJndFU1QlZwUmJSVmNiUDdvblQ3S2pq?=
 =?utf-8?B?ejhhaTBQZWxDM0Yra0RjcVljdExwRG90Ty84Rmw1VHZOa0J0bHNPY2l0MjBB?=
 =?utf-8?B?ZlBpeWRmNWptVWxSSkpMYjVLb3E4TUZJb3kwdFduZy9IRkFNamt5Nkh1V3pr?=
 =?utf-8?B?VmFEanM0bmlvWGlPQ0JUY3Q3LzBpWXFPVmlqTzdOcXljR0pydTM5S2dOV2wz?=
 =?utf-8?B?YTZvR0dobWJjNTZnRUlmUW5qbUdUS1ZzaWQzUTFCa1hYREdQbWFqSE1RVVZ6?=
 =?utf-8?B?dGhiMWJ5dmQ4bVR6VWVSdVFCa1JVNElOdnNHcXlVNEhycHdlR3JlTExTVGNu?=
 =?utf-8?B?bVc0SHZpazVyYmFJR2ZmQWsrbE1mN0JYUEo4TlNSSHV4UXc2UkpkaHlpUTZH?=
 =?utf-8?B?ZkF4S3JyeWh4M1k4VkJzbFpLUDByd2dvM3M2L3ZINFBZUytEQUtiRnV6eitO?=
 =?utf-8?B?Uk9LSW9sdjRNamJHWVdheE5OOGI1dWU4OGdXVTdZZlhwZDNDZ3dOSkQvVDc1?=
 =?utf-8?B?K2w4NFJPcHlKSUNQeFRYSXBwOURTVVV0Y1NzQXliNkN5TnQ4QWp6RndBbjVr?=
 =?utf-8?B?RkhORm9iUkYrTXZsaGNrdjlRUGtDUWZ4c21IYzB6dmw1ajZwaEhuUS9GYjgw?=
 =?utf-8?B?ZFlDc1JCS0R4amFZaWpPTVJxZzBCdFBMTmxTNEpDRmxWcjRhWW15aW1TUFpu?=
 =?utf-8?B?RExkWkYxMUIreTgwZDZnVHlIRUIreEliSzdFV0dydEJwWSs0Y01WMTI2Vmgz?=
 =?utf-8?B?K3FHSVpSd1A4SnlsNUsrSHlTdm1ETW15ekdUQ0xra01mLzM0cnlod1ZTZW44?=
 =?utf-8?B?VytlaVAraWtDdjhubHBvdUhBcXlDelJCRm40YmZsTHBReU1OdjBmWGxoZ3g3?=
 =?utf-8?B?VFVYTEdVM25uYkNkU01pVnhmdzQyckt5S0VZK2dERmtud3VlLzduMGR3U2hO?=
 =?utf-8?B?a3FhditNU3BLS2JwQ0sxUmNzM0dYRHhSekcrbGZNYkk1VmZyS1hoTkhHRkVn?=
 =?utf-8?B?Uy91RzQxTnp2VDh3K1AydXpnWHJXQjZJVFNWa3gyRmgxa1c0SVhLT2VXSHU2?=
 =?utf-8?B?YjhGYW5pRzFqM2oydk5sNUdzc0dsUlBWNldKeHg3TVVPTktsUVJINkFtL3ly?=
 =?utf-8?B?S3E1Mm8rRkhqR3hYWlMxSnJ6NDE3Z1VoY0VyUXdJVklscktiNDBJNkVWOUJv?=
 =?utf-8?B?TzV0RkMzSlJoNkxoUEU5OWxMdW4xMXRCWFVoSUtvakZOb0REWEttMzIvc3RN?=
 =?utf-8?B?Z1RwTTFnRXBSeWZWNS94ajhQVXd3UTQ5eTZld1h1TThZc0hLRE5NSHBVMkRo?=
 =?utf-8?B?bTUyTENZMEJsRUJIMjhJSW1leGZscUtGUmhod2xCREp6MExkL0x2TXFzWUsw?=
 =?utf-8?B?RFV2TmtTc1lEODJ5aTBwZGpSVitOTS92NlpISm1pU1hsMkprRDB0MHNCSkNX?=
 =?utf-8?Q?TCTsL/O4ph7xxBCaExX00pR7I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd3ee0f-5643-4431-91b5-08dbce2e0638
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 09:55:27.3362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDLyBiJ+Ak1tncDmtYt+PuN8HL6cE6UneCLTAK+siZWiJdoB/leWDMSNTvfXFGEkiGCaERGjvxoVTJWdr2Egfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7836

On 04.10.2023 15:53, Roger Pau Monne wrote:
> @@ -1950,7 +1978,15 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
>  
>   state:
>      if ( reset_state )
> +    {
>          rc = copy_settings(d, pd);
> +        if ( rc == -ERESTART )
> +            /*
> +             * Translate to -EAGAIN, see TODO comment at top of function about
> +             * hypercall continuations.
> +             */
> +            rc = -EAGAIN;
> +    }

Are existing callers known to properly handle EAGAIN? I'm worried of the
verbosity that was no lost here.

Jan

