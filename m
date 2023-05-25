Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBEF710BD3
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539549.840541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29pf-0005X0-BU; Thu, 25 May 2023 12:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539549.840541; Thu, 25 May 2023 12:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29pf-0005UG-7a; Thu, 25 May 2023 12:12:39 +0000
Received: by outflank-mailman (input) for mailman id 539549;
 Thu, 25 May 2023 12:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q29pd-0005UA-4S
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:12:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f0514e8-faf5-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 14:12:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9577.eurprd04.prod.outlook.com (2603:10a6:10:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 12:12:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:12:06 +0000
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
X-Inumbo-ID: 6f0514e8-faf5-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpTZywnEYM4zbt8AF+0Y0tkRrcrKUH3RCakldnFud1TSBfgkZAub+J6L1+BEyom1GvSGdzJpo4zwR1ukiGQ15NpqHIgyz/W3KHns0nTpZSPSuLQFKZDUqqSm4Bb/tF08g97/9Jbw4RZC9lZ7E3LEKkS6uDYTrhC9olOH4II7Ov66oHgAXtKtGeix5d/RdbPUu45ITsjkNUxvbdH2HX/yIDS6rDR7rDVJklZWfzjH8Jbtd2knbyFbKsj17w7z1IWkqSELVgb7Z7epB5PGiUlE2TnKBZt+c3fH3A+FMuP4qRVYQYdzmPD2rxGxjcPvIPD/TJnutAILywfXK8BbcwZNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RcKKWEFacIzy8yDKk3DXqhVvBvwGfBilpK60x0keR0=;
 b=ZYQZMT0/pQuldyzIoqkszwNo1hXjK5NCVMakjYRhWkgj/4C3G20bkciNXDxeBVmEgz0fQsXdl9SnyMQCO5P3k74TosyUEFhl2EyWe/+DNGfEd0VCPoWDGNqCD80UqBkbGcTqUdKo/EkLMsaDaxBSnOs/Mx33qEvBwb9au6mf40EQlj6NgMuMOlvIO3BwZVBgKMH+lnUfmUsx0YhKvAsTkH+TYhGOJejPPsW3A8ZQHTYGezup1aOny0NkZY4ZIP7ONP7ioQzGyOSqPXyhJcfzV9sBid4rNZJJSiYdEsLymREZ42FU5wbHDfe4x9ooC88h0OBJisAjpAT8kgj46hqOBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RcKKWEFacIzy8yDKk3DXqhVvBvwGfBilpK60x0keR0=;
 b=ng7KvKFZPU2jcTa6yLh3kRP4wWWtz1iq1NgR3NH9rUBxlaJ7IRkLkQQit/PyxIciXKlwLG729u6rjMkWp0MghOQtK5vm7qmA47p8rZUgJR0RUTsRq5K0LDf5USfg+BJ+MflGqqYywm17PbrwjqAEhUet0lPPar+T+5b41WkaORZpLd3z3p0GaIfKSqy8REEqLfhlS3SQCTPyRP8yMt4DY3nFquQmINNWKsmZK1j+P3YSvQxTQaaF3I6ls2ZHtk7u7jDXqm/QJEW5npyalJ1JDVG0shuVkAcQ2DEpn/kZdk2ker5OS3dfsWq8P7CAyfYxF10TCWiAUyrg90RyDBMRpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3eb3f5f2-e766-ee8b-e0c9-ef769dc0ca74@suse.com>
Date: Thu, 25 May 2023 14:12:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 09/15] build: hide commands run for kconfig
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-10-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-10-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: a15cf555-43c2-4552-d766-08db5d194198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZJdwEXUrsTpsGD319EGsDgW81cPKmXHZONYmjGQy3r32lOI2JRIHH6qM9hLf0qn2Zuy9mYC5/YO9Dxc6re1x702wbnQ1VmBcC3LxGlVmT+2xCohxe86GDNq4xgoSz7eapc1rp+SXawONLFjugxkXKyqXPpHZg+VaCYOZPUVKX+1iRDMPhxpRAbrE6LtP2JbLp/8WTyqkpZOcRU4Bg/thrXCNdaTClS3gWQcwVuzxCKakROIEz4IK5xU5GfwBOs2glowN/XBnagdzHiaWKLLpQJh2ZJTfyB27Xl/5BYO3Fz6DxzPRJM8/Vnm++UsBlJylaePXRSag2ef3M0cAQSaMtAaMJ192T9ZpouuZ7N8P1ldtU/GIQHsWYrfvZOuaHeyeuLcPrnbdgBl1qNGVm3E+gziF67tzlEOcN/zLsQLMqsMrlUbi6FwKoA4LK3td+O5+oV6bDltcc6CiAus1DiFfkFnLBzUi+Z/4FKOns4D1gVLawIlpk4Ci4AgBeHW701lpgB7Sfq3tkGmMBH9AAvsc+bbMH3cEvmKqqHnyx7WrdvJ7l5cVz0d78/vjlc2puA0zOHfaVu06mu/l/PPx18pW3Z3XRq/eBBFPv/e2dW4OI5LCaV/aGUW0tHMZ1IqTnY8xXrSm4Qe+wPO9bglik7UlHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(6486002)(41300700001)(26005)(6512007)(6506007)(8676002)(8936002)(38100700002)(5660300002)(53546011)(36756003)(2616005)(31696002)(2906002)(4744005)(186003)(86362001)(66476007)(6916009)(4326008)(66946007)(66556008)(31686004)(54906003)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFhN2xGaFpjOWQ1YzMrVGxHQkdDS1JPV0V2OVdkVTYwTVVQdW9mNjFTS0Nq?=
 =?utf-8?B?MUQxOGQweVdxNmR0TGFqcWR2MUtpSXNFSi90MnBySFl1OHV2RmoyODNVYUF4?=
 =?utf-8?B?cGdTdkR6TUpValVCeVR1ZEVKOVJiZTlGeVI5cXhxaDZHSzY4dmY4d1dodERi?=
 =?utf-8?B?cjgyVjAzZ1p5LytWbmt1bmtxSVQ4V1hpV0pQbkwxREQremtHRjE2Z0p3RVNY?=
 =?utf-8?B?anVkQXg0YnRLY2F0MEpJS3A5WmczaGo5dG5abTlnVktKaForQ2RtdTVRSUVP?=
 =?utf-8?B?dzlMUG0rSzJ3d3czcDVBcGU3T1VUOXFjdXA3M1dhVlRmSnBEOWlMTjAvTitI?=
 =?utf-8?B?SDFkeVlLN2RBNGV2eVdZWUFhMmV4MGRlZDVNU1Vxb3BNdXVQKzlQVUlYZGlq?=
 =?utf-8?B?eWZrM0FHWDNQaXFIbmlPc0JtVjVpMVhldDlUUFhEVjB6KzhaVG5lR0pRcUNN?=
 =?utf-8?B?S0ErV25NYnhneHZ5ZzVBbHZmQ29UeFU4Q2IxOEVOVUJjSmVxZmhlK3J5RG8x?=
 =?utf-8?B?TXpDcnV1WEliQVBTQ1ZZdUJjNVZDSXBwVUpTeHdmRGJsdjFDK0J0TDRCMUpQ?=
 =?utf-8?B?SFRBR3hwMkVVWDl0UWk4OXNTUEo0K1hjb1FSNEtzZlhPQStHNlJTRG1yMEI1?=
 =?utf-8?B?RWIvRFA4d2h5RFNqaWY4TEk4TWtUNWNQakxQN255dzlvbStTY05nc0pKMG54?=
 =?utf-8?B?NTZrNFZsNkk4UkdnbVY3WFhjL1orRjBodUtyWXZRbGR6clAxd2c4dEFvc3dK?=
 =?utf-8?B?VXBTTERheXd6QU1pbGQzbDJJc3VsRlhteElJQnQ3RWp3S2Z0TkFScm43UEp0?=
 =?utf-8?B?TGVJa21VRHF4b0tQRU9HTDg0dUhKUC9yMUFEdmQrNFA3ZlgvcFhxNVl2VGlS?=
 =?utf-8?B?cjk1ZzYyVHRnRGoxWW1sN21Hc3JQNVdoOHpKWnZUdFpHdUNMeUh4ejhIUENi?=
 =?utf-8?B?RVZ1OHRaa2VubXdlM3VPSDNwU2pIUU0zZEVHUjIySzIzK1dETDFXVkhQaHVj?=
 =?utf-8?B?TFhsdkdCdzF4bUJjcDhoRSt6V2gvRWx0cGNXR0dpNXVBNFB3N3dqRzRBcnp4?=
 =?utf-8?B?QTkvRTY2SGh5eE9aMC9sQ29rMDQ3ZWxiMlBkWUI4WG9PNUV2UFhoZ1RNcDhN?=
 =?utf-8?B?ajZMY0lERi85RnNvZ2taSW83VGFiaXMxWk5DSmlNaXg4bVNrWnp3bTdxN2Ux?=
 =?utf-8?B?dDZYalpKMW9EcUJ2UzFzdzBWUDJDTFpLY0xFcDhadWZ4a2NzWUFFQ2t5OWJ2?=
 =?utf-8?B?SVRMeHR5N3FsRENiK05rV2RLNEtsRzhSLzN3NmpNU1p5dHJzVW9hMHNLVjh3?=
 =?utf-8?B?bjBpNUN5UFdlQzhwakVmUnJrQVpHeThBc3lsZDNyTDZzR1h4dFZ1c21DMml6?=
 =?utf-8?B?TVR6UHN0VzNZWGIzZEM4Mm9Ua1BwUVMzbUptRUlHK09aY3FhVVBxOEprUGpz?=
 =?utf-8?B?ZUlxanB0TE1mK2xHbU83b1NObHFJUktnR09ma0tCZGxiZGRWdDQ3S2VxbEpp?=
 =?utf-8?B?emVmdkJrRGNNZHc0aFA1OEIyaERqYzhHUWRiMWVoODM5MVFHVHh0N3FVN09R?=
 =?utf-8?B?V2NGL0dhMERpd2pVSjR0VDMzTVhhK2hwemxMK0I5cUtUR0Q0dkpSTFlaU1FY?=
 =?utf-8?B?SUo5dTlTa0NPZW0rZHR5TEhKbm9CNEhkMzc1cFlJK1M5cEFjdXZWeXhNN3Uv?=
 =?utf-8?B?Z1NqTWdXQ2twVlFTQmJYV090eUU5RU5XU1A1STN6YmRMeUJQMHdDL1F5TnpE?=
 =?utf-8?B?VHNTdnpjZkxzdlZ6ZFpYTXpVcXVXZlR4cWgxVFVUOCsyNzhVSGhQd2ZOK3RH?=
 =?utf-8?B?OVMwMVpwOEtUNmE0RjkyeHluR21hTkFzNDZ6TklXQm1vdUp0UzFSK1lXbkRl?=
 =?utf-8?B?R3lUTkhUc2ErLzdBOTE4am52QWJvalJGclBKcDYwSkdIb2FacTIyTndXVlFp?=
 =?utf-8?B?SHRRWm5IQy94TS9EWEpIbmR3ZU5wTFU5M3dzdEdzUTR6L1dKNnByZnFsd0xz?=
 =?utf-8?B?UmhwWDNJWnZkL09xQkxSM2plRDdCa2VKOVE2YXVBTWY1dTY5aTVhLzZ3Zisy?=
 =?utf-8?B?TEx2NXZ0S2xkNTVkczFLQzcwT3p0RVNKZXU1UUFKQ0NaVndlNVA4cUxPK2lt?=
 =?utf-8?Q?tNjI1V3DzaKwIFko6ThcHxirH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15cf555-43c2-4552-d766-08db5d194198
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:12:06.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztmDl+fwIDaVPd7NZLqkYCndH+oEi1IB/9RMwLR2tZk4Ksbma+eFy79vHyAuEEJ0K009szA0PezWHTyUqXy0Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9577

On 23.05.2023 18:38, Anthony PERARD wrote:
> but still show a log entry for syncconfig. We have to use kecho
> instead of $(cmd,) to avoid issue with prompt from kconfig.

Reading this description I was looking for uses of $(cmd ...) that you
replace. I think this wants wording differently, e.g. "We have to
use kecho, not $(cmd,), to ..."

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -382,6 +382,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>  # This exploits the 'multi-target pattern rule' trick.
>  # The syncconfig should be executed only once to make all the targets.
>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> +	$(Q)$(kecho) "  SYNC    $@"
>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig

The latter of the Linux commits you reference also extends the comment,
to keep people from trying to switch to using $(cmd ...). I think we
should follow suit.

Jan

