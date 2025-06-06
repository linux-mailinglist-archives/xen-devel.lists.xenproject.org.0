Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83781ACFDF1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008076.1387293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNS7i-0002Oc-0o; Fri, 06 Jun 2025 08:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008076.1387293; Fri, 06 Jun 2025 08:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNS7h-0002Mt-Tw; Fri, 06 Jun 2025 08:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1008076;
 Fri, 06 Jun 2025 08:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Fse=YV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uNS7g-0002Ma-B9
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:08:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667b168c-42ad-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:08:18 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN3PR12MB9595.namprd12.prod.outlook.com (2603:10b6:408:2cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 08:08:12 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:08:12 +0000
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
X-Inumbo-ID: 667b168c-42ad-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e522IREaWf3rKqZaVtpAtW50X1pw2vukLGNwF5TOSUUdgih/B7tEpGTvv6MXKkzCOfV0xWXIXndIdVnESfVytH8toHZ8uE3A7aVn7YnjY0qAklsqaspjxLETpVeIRWqnle2fmVUC0UkPxVuazmbRj9zAehSwQF4kTmqoDiscKlca7x674pg0bCzZO9Mpzah4xw9l6K0i3c247NbO11jkoihlDnDTd5XV+/eLa4Th3APDXaoHH3Lrl/mlcN/8vVprLLP2bVyvSnMHzobUAHJgzl+BbyfX5LgiSrNGll1xIn9iqxY6g+o/An9eCaN+YJKGZQr6gcSAdpInuspxwnksSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/H1oDzcywQO9/UntSnvfvZiyyNydwEGkaN2gA6gebSI=;
 b=xmMy7tw/AsEcJJWydkGLy8NXwjHhIue+MLCt5tDfKlke8ZPcIIKdPQf/PcIobD2qN96c+Bt/jLzWxkkGhQX1ikzv3uTS6BkSBMgmI+NmKFmEzsluIPevaxhIK5jh3Y42T2FbeFxyiIbUOaUNqAe189GQWGVQFQt0JTasPblon96nqXsJC9fuh6ITcqNdpiAcOQcC/nVmRPEe4xLRtMQQ2nk5dY9wC1cOiSLIRWAJsCGL3P0AzTCtoNCej42BhlgVWRkNpikX+MPP4icOTOsgVFXsUnuH5w/S7nRaOAWjL57LV43+QctbBGsyRJ34bQSeOE3gcdWmwcx3wDD1ckKOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H1oDzcywQO9/UntSnvfvZiyyNydwEGkaN2gA6gebSI=;
 b=W1nbIL1cunoxDLsO1IdGmxFHggqYVFXG1DV1ip/vE1SC1ZmLOO+451u4KlPxUSejxh1TexA2wPmjHZ/GoMSdQuykOtzc5jit2oIIh55nEFPsSpC7kEFTl0+1LUbVxvqHdcvlIWM48Z3dI1oC9rnJlQZhyAJWa8tom8wHKn9S7y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f475f76e-c4e8-4662-9dee-5d09f4d07394@amd.com>
Date: Fri, 6 Jun 2025 10:08:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH xen/arm 1/1] xen/arm: Standardize R-Car platform Kconfig
 descriptions
To: Jahan Murudi <jahan.murudi.zg@renesas.com>, sstabellini@kernel.org,
 julien@xen.org, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20250606070501.3470801-1-jahan.murudi.zg@renesas.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250606070501.3470801-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0084.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::25) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BN3PR12MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1fb8f9-fbf0-4a7e-74f0-08dda4d1484d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2JzRXlwVENFcXNhakNEaTBmekJhRnptNmtmWS9TV00zaGt1WG5RNGdjUVo5?=
 =?utf-8?B?SlVna2h6NENudW56NWtObXQ1MmhvRW5CQkpGYjVpcWEzRnBXUU1OME1iMElC?=
 =?utf-8?B?ZyttMXB3c1pkWldzVUxmQkRIZUdnd0VOUGlFT0dUNWNRRDdzU2I3UnVJY252?=
 =?utf-8?B?ZHlOU0Q3N3o1dUFjVy9VeFZVTU1UeWRsWDZPaXpKd0tzcDYydTVZN0U5eTZi?=
 =?utf-8?B?NzJNdExhSjljT0NDVkk5dmxTWWwwY3krV2NUZm9HRDBaQzBzUnhLajhYUjIz?=
 =?utf-8?B?OXNwOW1Nc1M0cnNvc1dBVVlPUEozaVM3L3Z0Q0J2Y29WSkdEZkx1VG1XNkxv?=
 =?utf-8?B?ZjREcEVETG9OcUppbitFV25lMTFYL3dRUWlRazBWSlE3TkY5c1VBc3oyL3cw?=
 =?utf-8?B?RFZSUjdtSTBGbXkzN0RmcUdGanJuUjQvUmtYdzhoVGI5bmd6TTN2N1RBVGFs?=
 =?utf-8?B?R2hOQkdzMlZkYzg0dS9KbElkQ2NWWHhUYWxkU0RRY0V4RllxS0ZyaTE4SlFh?=
 =?utf-8?B?Tld2Vit0dXFheEZiM0NIbHdkU2hlVENOUUF3eHNzNXZsd3E1ZndzeXVLaXBM?=
 =?utf-8?B?SUJsbE1zTGtzRnZUTHluNXRsNXFmYk1UVEM5ZitIYjdXdHB3U3I1Sjd2bm5F?=
 =?utf-8?B?NDVuaTcxNHowWGhtSXJBN0dWYXNlL0c5OGRUMzBpMk1Nd3l4NHFIVCtSM09N?=
 =?utf-8?B?KzdYdDg2K0xKN2I1ODQwaVAya3g2TnhlY1FxOU9ZdWlyOGtvd0hQbHFzbUJr?=
 =?utf-8?B?QmNTMXdVN0R5dmkyQzV4OFp4ck9xWU9jVDZ1dzI1NUg1aVh6aEF0NnFNM3lp?=
 =?utf-8?B?aktSZmpCYzQrSmVaQ01QZHpCaHNZeUNjY2N0bk1VUEptSzJXUUhnSmRvdDZp?=
 =?utf-8?B?RzdJWGVVOXMweFZjczdNZ3A3dXBnczZyUm0wRnc5TTVielFmaGk0T0F0R2hT?=
 =?utf-8?B?QS9mUnJ2Q2tERmpxcVp5TDh6akFMSkJCSmhRdCtBTGxyekRWanlWcFZ3SUda?=
 =?utf-8?B?ZDE0eWowM09wU0dDbkRiTEF6cWpnSmJIUjNPOC9tVmR3TjhaVEN4eDlNWm1l?=
 =?utf-8?B?dWtjS0JnWGJXcnRKeHlMS3FMbzd1S3IyVllGNHdtQUxneXlFVHQ2R3NrSFZO?=
 =?utf-8?B?Z1ZQeWs4TGZnb2VGN3pTM2dnZVZmMWZ1a3JmWDBQczc3Rko0WWJaMTQzdmF0?=
 =?utf-8?B?V01VSUMxVnNBQ1dLRDlYcmg0cTFIQ3g4S3VTWm5YVkxaR3ZEb01FTkpuaFFq?=
 =?utf-8?B?bkcveEFDcWo2QlUzRkRPTG0wa0sveE13dTVlN2pTZnd1cjEzNStBQ3BMQzY1?=
 =?utf-8?B?VkVIU2g2UzRSVmN6NG1IRWo2MHZ4akRXSzliR0tRemVjUElZVzVLTDU2TW1W?=
 =?utf-8?B?bGtZTTl4a1dJUzAzdk9nY3hGbUZxYkRCZHNPL2toVU1wMzBtWGVVRXZwRzdC?=
 =?utf-8?B?ZXB0clY1NHhRbXpjVUc4SkM0R2lnWFM1b3BuL1MvcmZVbTBxL2pMN2x2VHZi?=
 =?utf-8?B?bDV5VGJSMHo3RE1Td1JUVFlmeFZWdEdyUmVLWm9zNGxkcTF4RVJmdWZnWlpZ?=
 =?utf-8?B?V0RsclFRMC9CQ1hlaTM5N25mQ2M4NUJVM3JSUHlRbmN2SUhqdjJKR2xMckVr?=
 =?utf-8?B?dXpQdnhyZ05aNzFSaEhISExiQUs1aEhmZG9ibzZnNVozM09ZZjd3VjdVOHBp?=
 =?utf-8?B?Q05QcWZWVmp4Tm9BTEQwSzNsbExHY0szUzhXQm9wL3JONTNHR1RJamRtWHNT?=
 =?utf-8?B?U1I3YlB1Sm9qbml1VWJiWWc4WlFjaXgyT2gxazM3ODhSclNYTk9nRTI4RzJI?=
 =?utf-8?B?Nkw1a1dRMUx5c0VZR0JnZWNUQ2hEcVlTVjlvb1doYVYvcHVYNkFHeERlR295?=
 =?utf-8?B?dWRhaDhOb2wzSVZLYktYTXQ1L1dFOEcxVFh0cTNCQkdzTk9GVlpxQ3B0a2R2?=
 =?utf-8?Q?jMbZcdchDs4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUtveFEybjYwMVlRTHRjdXpqV0w0ZWZDVjdJeGF0VENteXhwWWpVWEtJTnRp?=
 =?utf-8?B?V0hnays4Z3p5M2FqeklkcFZnWjMzNjNPSlFqTFo2dmJOejdNbWNQQk44bDE0?=
 =?utf-8?B?TWhPNzdzdTk3akhIaHRMdmdtbFA3QW1naHFDMysybHRvNGtrOHZGaVd6ZEFH?=
 =?utf-8?B?Qk1ucWFaaUl3RW4zWTY0Zmx2aUlOdlFxWFFSdDArME1KQ28rdkJtSnJuTFBY?=
 =?utf-8?B?YTBwL2xISEp2UXNNa0VIZVVRSDBqRy9pdndQRUJsMHZxTDRkUk1pK1k4U0lM?=
 =?utf-8?B?aWIwSm80Mk9HUjVaMlJUVlVpN01Iam5jdWpiVTlmS3d6TUNTNlZ1alM2Rll2?=
 =?utf-8?B?R2xWaXlmMVJ1ZlplNTNIU0RqalA2UElVQU45UVpieXk0cFFqYUFYNDhXam96?=
 =?utf-8?B?aGRLMDh4ajNnQWFJenFzeTZjMmFqZFA4NG1RYUdIZFE4ZWNtN3hLWmQ2c1JW?=
 =?utf-8?B?ZHd2RkJHeVJ1YkRUNDhMcVB4bHVZOHBEZGNSc0ZZY0xhTmxoYzU0YzNNUlpr?=
 =?utf-8?B?c1JXendTTlFpQW02enFiQThKUWROTkhMTHdTeUxDMVpaanROT3pBR0ovL3Ra?=
 =?utf-8?B?a2tsOUlJYjUwTytiM01DQWZBV0FUMUVLUm13NkFYTEZTQUJ1N3hDMDVjZ0J5?=
 =?utf-8?B?UXkzbHNST2ZRaDBHeE0xZXJ5V1FYdStSKzY4ZFpPUFpJMjRKVkpUNHJ1RTlE?=
 =?utf-8?B?WktpUjFFbzBhZnVHTnFSU0RuSENsOXlMNXBac0dMWHhvcC85VkFRUU8rY3RE?=
 =?utf-8?B?VkNWTWh6WjJsL003ZFpsMnZ4NjBibWZhdjZ2bWUxQkRkaVgyRXhEMWwvRHNY?=
 =?utf-8?B?RE5WTlFrdUQvRGtrakh5WG4yVjZDYlhYN3ZaTEt2R3ZZdG1hd2dyRURHTWMy?=
 =?utf-8?B?OXQ0d2dGbTNmV3dVMFMyUVVkVVZQRjVYZitUUGFrYzNyN3lIVURUbmFmNGxN?=
 =?utf-8?B?K1V0dXJvUmtrVE92eUI5NWFHREZOTm44N05vdnBxNjQ0U1hFbDlVN0dOVk1G?=
 =?utf-8?B?ei9PR2NscGRVM3lacFYrYmpWekJ6cHZ2Ry8ra0RDd1FYOE5TNU10azVDS1c1?=
 =?utf-8?B?NnNONll3c2VneThxN0w3ODZQUld5REsyZnpvRmpwUHI1SmRkblJBOTkzck5D?=
 =?utf-8?B?UHN0Vm1mcE5JZ0RrNDFiVkw1TmxSMmNOLzdreWlxWVdaTXRtZ2RlL0ZyclVv?=
 =?utf-8?B?b3hRV1gwN3g3azExSGlQK2JDVDlJM0dxTjRORTZsc1FvMnE1bCt4Zms0ZjY2?=
 =?utf-8?B?Q0tyRFFXYmJDMk5RK2x6bzk0S3IrbWo3VENhcWJzeHRySFVMRCtOU2Z2OVkv?=
 =?utf-8?B?MGxIYmdtOEdIc0ZySWRxL1JDNXhkSlpkOHBpcXVBQlowanE2T3NvcmVRcEJH?=
 =?utf-8?B?TjJ1elY5c3VWSTRleXdzekRPdGViNXhxTEcyWG5GdVFWY1RtS0Z0ZmxNMzl6?=
 =?utf-8?B?OVVhaHlmMExYRndLOHJWTDJzc0FMM2c1d2JHdDFzc3BoTmRJOXVKNG1Pd0lW?=
 =?utf-8?B?U2dMdW1hL3ZvSlh6RE94eDROQXhGb1cxRHczVnpjNXNUM1FTdVFHckdaaEVp?=
 =?utf-8?B?ZjdTeTJVakRnY0c5TFlHWWJ5TksrMUhiRlRRNUs4MThzWG5GaXhhT3JOaXU5?=
 =?utf-8?B?YzBnK2l3TU5SMkw2c2FSN1BYbGc5blJnemVpSk9oUVptWENLc05hdUxoNXBi?=
 =?utf-8?B?eVhzVkQzSVNqbmtXVXRTZXpneXFldDdMY1J2NVA3dExla3dMWkZubS8yckhJ?=
 =?utf-8?B?Y1N1R2NQUUJPRldGR2t5cW1ibGRaTW9zcGlhRkt4NEdoNk1IbnVWc0JMeUJI?=
 =?utf-8?B?TUxnUXFFdzRGcnl6RXg3RzAvVHZmV0kwWE9ZS0NqOWxXMWVvWEZwUFU0eXp6?=
 =?utf-8?B?bVFMY0crZ1BLQ0hYelBsZVdteWZpTGNweGs4NHNnWVJUVWVTYU93UG9jRzlK?=
 =?utf-8?B?bXpJSXV0a2pnZ29jdXlQZm90cHhBeVBDSlMreVJqWUp2SkJMQUdQdERUVGE2?=
 =?utf-8?B?UVN2Q2o3bm1Dd1B0V2phTlQzWnVkSDc1bHBLYUd5QXJVKzE2Q3B0cEZpYVM0?=
 =?utf-8?B?WVgzN1k0bTVLRHdqenJvbzkvbnBZMkswdWZSRm1YNW5kWm4xWVNJMXpyTE9n?=
 =?utf-8?Q?biG/uDNerQ//TBQk6kO/3iAEE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1fb8f9-fbf0-4a7e-74f0-08dda4d1484d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 08:08:12.6294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VgbeWivVIG0a7xI4gMyQYXmcHNg1y+ofxnh1fKj3OnmXWTou9AbPDio+xI6O0EL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9595



On 06/06/2025 09:05, Jahan Murudi wrote:
> Changed "RCar3/RCar4" to "R-Car Gen3/Gen4" to match official Renesas branding
I mentioned this in the previous review. Please use imperative mood:
s/Changed/Change. Also, you're missing a dot at the end of sentence.

> Aligns with documentation and industry-standard terminology
> 
> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

> ---
>  xen/arch/arm/platforms/Kconfig | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 87bf614788..c8bc0bfae3 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -22,21 +22,23 @@ config QEMU
>  	  machine.
>  
>  config RCAR3
> -	bool "Renesas RCar3 support"
> +	bool "Renesas R-Car Gen3 support"
>  	depends on ARM_64
>  	select HAS_SCIF
>  	select IPMMU_VMSA
>  	help
> -	  Enable all the required drivers for Renesas RCar3
> +	  Enable support for Renesas R-Car Generation 3 SoCs (H3, M3, etc.).
> +	  Includes all required drivers and platform-specific features.
>  
>  config RCAR4
> -	bool "Renesas RCar4 support"
> +	bool "Renesas R-Car Gen4 support"
>  	depends on ARM_64
>  	select HAS_SCIF
>  	select HAS_ITS
>  	select IPMMU_VMSA
>  	help
> -	Enable all the required drivers for Renesas RCar4
> +	  Enable support for Renesas R-Car Generation 4 SoCs (V4H, V4M, etc.).
> +	  Includes all required drivers and platform-specific features.
>  
>  config MPSOC
>  	bool "Xilinx Ultrascale+ MPSoC support"


