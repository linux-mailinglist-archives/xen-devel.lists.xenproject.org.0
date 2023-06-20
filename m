Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FF736C24
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551795.861513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBai9-0005Ij-Oi; Tue, 20 Jun 2023 12:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551795.861513; Tue, 20 Jun 2023 12:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBai9-0005Gt-L5; Tue, 20 Jun 2023 12:43:53 +0000
Received: by outflank-mailman (input) for mailman id 551795;
 Tue, 20 Jun 2023 12:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBai8-00052j-7e
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:43:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b239315-0f68-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 14:43:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7476.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:43:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:43:46 +0000
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
X-Inumbo-ID: 1b239315-0f68-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqCOSQbY6DjV/Aqd0/4b5EAoHlXBTiVnjwCeCfXlDz+sy+Y6q86i0mjDgR9BEfPZ/gx9rZwHEjYCoQpUAAcF8woVqKO37dyh2sD5PIjWL7Qq3VNrhAoDHyQqDHdtB3znUt8daktnBzl2c2k33RFsozuUtWIffFFsj4vqO7dszd6qVAzrSB3P0jzzKHBdc835jvXdd3p6K3ZVx9Okmv2CLLnsAhL5f+O/60Nw7dNk68K+ts8QJKiXb7ACyN7PUhDi3QR3mCaBHSvtm70+lt3a1IViqDrNFBvXzQqdP9baslB4aBfOG3ov/mAFXAyaA2KKPeli1j989Aa9ylojM3Korg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieumoWa5LOWImsRL0nsqxl3Nm+/VqJwvVssoBM819y8=;
 b=Eq/WibnX2wuOZR3RiKnxif18bNW8U+h6TDLiJD7nH8eyq1jM6xTeZa77trBbJqw8DP6y4B8nQIXzYkfkjJ4KWeMk2RWc013kORiDOmuKCHEPIdRbYyeyc82CSlTBECsvtID9cTQ5bgya1UFvZ/r1UGgfJVgK22raEM9UF24qWD9dbBGB6yg6Y1/UV1PDTXZJCPXD4EufVlaePuLhSrI59CB6rQZ+vQFHlIrXrt+v7NegEqpmQ06HoqzH9Zy7TPABgPNesYlG97QQI9WWUiVhcdrRh0VITaTAhFoOSbrSfb+BCy6hu0MskIrWWtXFvM2tMlroEpgxccTdZezc0nf1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieumoWa5LOWImsRL0nsqxl3Nm+/VqJwvVssoBM819y8=;
 b=nZJZftdp3Q0kvxGX30DZe38k8SBul417Gx42Kb0GMLScV/y2EpkarEQU9GPaXd+wszBbdxnwoAOnj+QgfPgVySrPCXdm3XHRvumJxUAEfyVjyTkF4o4TCU4pv+fDg+x5cj8GMgxQcZ7pPtHGVN/OhnPq7pJTkA73MKpUWflJHOJ17+dEJGN5nb665BKcWXz72pI86wT0DEHGJm1vrSdccmpF+xxnHRYdAsbULm72MfoxSChy4bYAg0GQFktfvM2Lr7V3cXB6wqjYDn2FHCIzc+8FVkz1ejIsKTkFQY5v1ftGCSs+W+EHufSnUCXOor79fShOZC3Fv0kPKuXNexveqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e737bdd5-e00d-ccfa-8d40-2e6cf846ed84@suse.com>
Date: Tue, 20 Jun 2023 14:43:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 05/13] xen/common: fixed violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <8aff4bc56b29372345e828462766d803b8c9b710.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8aff4bc56b29372345e828462766d803b8c9b710.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d2b41a-9912-495d-875f-08db718bfcb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TumiXGS3lGuTETc0Zg7ddWoqPv6jPa8UiRqUKGT2kYldZoOeQU2jgoll+a8xgyq9sGiJdQEmffB861QMNmuCh5HUyij+a4hOmvZuN1nyxpzWAFKKA6rcyc3fEgi0/nMqe29/SJDeZg+bqUY3x9iUxuTZFbx/Q51Zkhu9vatEux5vzitQVm+ezGKJASzyZ3VoUqBi0pVZq0ZNGVHsSwKaoVotmeK2/soVKGkLXxa+gmbkP8daiVQ7M8HgUnrgyqNfJZlJYF7JwC75w1HHzyM47xCp2gV7gd6oJPDM9NRr19qOtiBwB1BfZh6zHtSZZxF1fGO5NL7CTm//kjF8eCwnpFfEFWE/Tjn13xjpUQP0AN5cd3Foc3V6iSFlqj85GBSNlOfTSrZDH7CiMF9ezHKBJRpqmiCmYXvWwW8wlX+dEccYr3psnDKwGE5Dn+x73P+R07ZWC5wOqcF4XIlMeYeO04eV9y0nTu280jin+lMhrfsAMxO0wXoI9iVOD+pvNxhyZyJ1LE2AC9zTldAmVmG0iS0rPG1cS6zreUSrCQS2UT5uF53PUdWfgfCXbswXqu6jKyES2NDmj0NNmCzBUbZLT3n0pS79XNYjoD6Rv6vtIEpKVKt9RIGa4FC+/v18TJOZduFJESzxyhgdaLYPYsjunA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(7416002)(66556008)(66476007)(6916009)(66946007)(4326008)(41300700001)(316002)(54906003)(31686004)(8936002)(8676002)(4744005)(2906002)(5660300002)(478600001)(6486002)(6512007)(6506007)(186003)(53546011)(2616005)(26005)(83380400001)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1pxQVYyOUN3WVh0U1c5OTdobzdCRW1veGRVWTJNRXdUYlNWRGl5M21lTGRU?=
 =?utf-8?B?RG1wUTRhcFNjenZhY2UwU2xGblRzcXpVclJtd3lxcitISGVsTmJ5dVRNdEhr?=
 =?utf-8?B?RUg1UnIxemtJK3MvUVc2VDNYamhVbUZIVVd4VlpDNXU3N1BEOW9IT1VRb3Fz?=
 =?utf-8?B?MFBueG5HQTdWYkRhYjdNM0JlUWxnRnhFN1FWZVg2TGZFTFBZWW9DbTBzUTdv?=
 =?utf-8?B?ZWRXREdqZ2NOWW05L3JiczNXdmh3SldMMFY1V0U2bzBRV29wQ0xwc0lUd3BL?=
 =?utf-8?B?SGk2eUQ1TjZoNDl1Nm5RdW41WWhlNG51d1V2S2Mzbng5cHNkVURiQ2pQSEc2?=
 =?utf-8?B?N0R3RnQvZHZmcWxGY0JMazJ1cDFlcFFyNkJmanl3NjJmcGUxVkNUNmJKNWZH?=
 =?utf-8?B?Um43Q0F1ckNzSzVBMFM2alZRUmFSV0lZWnVJOWlHb0V5akZCa2QvKzM0bjhP?=
 =?utf-8?B?ZVpldjR1bzlqYlBmRkJVQ3JoTlBicmtVSmZyNElNMjg1bUVtV2Z2TnFVVU1v?=
 =?utf-8?B?TFZZQ1Q1TTZ6MkJIQktORXkzbStWdDBOUEdwT1dFYU1qTFoxRnNHZ012eTNJ?=
 =?utf-8?B?ZlpVNDdpeExaOWs2QThLY011b2M5VmtSUEJaRVJnR05FNG40WVUvUmhTVkYz?=
 =?utf-8?B?SW00QXRRQUpoY2Y4NXNZM2ZZZHNuTVlKZktFN01ydjVpVklIcHcvamlVeDIw?=
 =?utf-8?B?cUx5VlVYcVNZSXRFWjk3STd4YW96aWJoYW4xSCsyZ3h6YU5WV2ZTRVNieDBO?=
 =?utf-8?B?dmhaZ0ErcGNqM0x6VUxLWUExSmJWdzZrcmxyTk1yeEo1MXBQbWxveFM2WElw?=
 =?utf-8?B?Z3NUSXZYNDZqaXUwa0hoNlJwdWVEdkRCai9SVDh4cjAvR2dCckczemVVNmQx?=
 =?utf-8?B?TitTTEtXM3llVndXNU1kd1c2RjNveFpEWEFTcGdkamUwdXQzb05qK1FXYWIw?=
 =?utf-8?B?VUpwaG81RktZS2kzSDVJeHpXREZybWh3M2ZITzluOTRRZGFwcVVwTGhxcHdm?=
 =?utf-8?B?RkRMU28rQ215TkRvbjgwMTljVzdzRkpYVFdIQkZobllWTURnOWE0NzdLdkh3?=
 =?utf-8?B?QmtHVFYxZiswa3pCNG9wVklRdGJtN1FyRk5TSmU5Mng0c21oSTlOLzJMS0p4?=
 =?utf-8?B?Q0hnNm1uVWdOSXJxR2I4YVQ4UnpLK0FuR2ZpSGhGUldXaWN5WlBZU3lSekdH?=
 =?utf-8?B?Y2J2UWZJeTA3LzFhUkRocDNQNFE0NDNJcHpMY3RkUEtzVUFsVkQyM0hsS1Zs?=
 =?utf-8?B?elNwMVBEdmQ3MWZ3QldIZjlsK3NXeEdzVlV0bkpuYTJSM1MvSGU3bDBjRDhN?=
 =?utf-8?B?Q24vZDBaNHhNL1NkTDdCZzgzTkdVYWRSaFFxdFdPSXBzZnhTbUg0WEZtOFRB?=
 =?utf-8?B?elV5aDluMGdPajVBbDJvUWJ3WTVFOXZkMENiaVNsSmg0ZjBYcXJUUVRta0xp?=
 =?utf-8?B?NVF3OEpPazBYUU1FY3lUNFc4VUlZMTZ0c25MVEpjTENiRzVoa3p0dWhEczBC?=
 =?utf-8?B?TjV5OEt0UUdzVlRlUFFYbkNoQys4V1AvVEtFTC9WS2R2OEdJMTk5cXE4WmRK?=
 =?utf-8?B?THF6VjlUOCs2MDVETVdkMmFGNHlGSHFNQUwvWE90UmNTbFNYVnZXQ29WRmQw?=
 =?utf-8?B?SEJ1Wk5KL0RWWUFJQk9sWk00UldOVzcrU3B6SUJBd0FhMkpIVnM5bUR5MVZ1?=
 =?utf-8?B?MkN5N1pFWkV0emtEMHRaWmtlc005Nk0vVS9RUWphc0RwN0lzUGZneSt3NWtX?=
 =?utf-8?B?WXJUcEoyaTFJU3NqeWpNZ3l3enJmeTdpR25WQzJsSmZtY2R1cW8wRU4vV1VY?=
 =?utf-8?B?NG1vUDcwSE82K0J0a2pRQjhING5RZVUxMTZ1VEV5S0p4NzdYa1BpWis3S1JS?=
 =?utf-8?B?UUxWanBvTkZVNEpDSmZZaGRlejRSbG1wWmIyOHhXSzhDaEFVVDM5ZTVkVjhR?=
 =?utf-8?B?Z3ZtK0J4RnBsZGM0KzhYd29BR2NCTTZnOGU5cFQ1d2xqWjJod2p5L2NxL3N5?=
 =?utf-8?B?bTdzenFwaG5PUlFGaGUzdnBaamJiM2dJUHR2blVDZE1mT2h4VTljT3RiY2Q2?=
 =?utf-8?B?L1lwa1lwQkJnc0xFQ1BzS3dXcUlLcXFXN0ZFUUl3SGlsekJMd0tqSmovUjlr?=
 =?utf-8?Q?IsgYAgSMX52pom0H+f5TzNZk5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d2b41a-9912-495d-875f-08db718bfcb7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:43:45.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBAwcFaO+nHIH7eF21fAEXkMO2R1FxeshCZm6M3cKHcyAsaO6kkMLE8xaMiO+x9egeYSyeLzkTBNfSSp3m8hNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7476

On 20.06.2023 12:34, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/common/device_tree.c        | 4 ++--
>  xen/include/xen/libfdt/fdt.h    | 2 +-
>  xen/include/xen/libfdt/libfdt.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

I think me and a few other people being on Cc here is attributed to the
(misleading) title. The set of touched files fully maps to "DEVICE TREE"
in ./MAINTAINERS afaict, which the prefix in the title would then also
be nice to express.

That said I'm not sure whether libfdt code actually wants touching this
way.

Jan

