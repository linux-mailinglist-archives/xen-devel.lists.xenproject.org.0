Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D147B7F3F1C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 08:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638465.994995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5hte-00019L-AT; Wed, 22 Nov 2023 07:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638465.994995; Wed, 22 Nov 2023 07:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5hte-000182-7Q; Wed, 22 Nov 2023 07:43:42 +0000
Received: by outflank-mailman (input) for mailman id 638465;
 Wed, 22 Nov 2023 07:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5htc-00017w-V4
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 07:43:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d983ca3a-890a-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 08:43:39 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9859.eurprd04.prod.outlook.com (2603:10a6:800:1d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 07:43:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 07:43:08 +0000
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
X-Inumbo-ID: d983ca3a-890a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvQ3VSJFR4Xcf1iG5Nk55+pIWyMWxyjsSWpvHfnmDGe7UmMk+wrBLmWhy1ldQLlc0noHmri8LGgidbmtmgNZLIQNR3FhfPIxa7v2wFo/dLS3t/MSIKUaB47jrfE3DXIaaRcTZJlyqVjUB7aB9GsfNgnMI3Kb2T9ORs0a8oXbpy/g0fyHU84qA8ytszZJ29fgQ4+3baFXVjizYLLT988/k0Ea4NCVPMJnwUIoLKnDtaKrVnWaudOk0NUDx+LbIArTSmPGUftdqGB+r+uaPRu3G6uzYVKbjoczDkmDFrAYsvw7O89cFnc+uG8zxMR2e0rhkJ9hwitCE0Al1boJ91Tl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrlPF5MN7NH0C6bG6eJdQezjUMoAaUeRdlpm18KoPYM=;
 b=MxUdZPNwcHxusni4P5wehOU6gFWTXoC075M86b84Mit3SMiLbPf+hJe7AAGOXDWvVRXCEVaHQLxdASgg9oCm6hiQMJGHAYyQIE5+tmNq4cujg47gVYqOlVmCLNt/lxc2qh21QLz5cPWoXZp0Gdadi8MSfeiJQETqa17pOMCaOTPx++RACkgjZz5TIX8lGrHrf8EzSUsJ/oOsxLrwLE7ytBVxHEYR1q2POW3Hozk1q6J9TpCdMQClGp12PXNhZLRPsmO3+sVnCik0wkwMu2IISlYkbD/YyV4n/UTuGtRaZ9vEFGCXzJvP2B1+kf22SVcrXkOEWX8kcIzCgfshZ4nTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrlPF5MN7NH0C6bG6eJdQezjUMoAaUeRdlpm18KoPYM=;
 b=bw5KIIdBDqYrYpQnjqzTqTuvUACmGDKJ67Ta27Fo9LjsKFisngJwsMYk40zIdSUUbVeoGbgMte6HsCcFt5fucr3uE0nFTNJpfRaSM6gAM7Ax2dax7lqJogbNcrQNhN7ks6tFekujIJ3+AxX3uNxnTw5n1L+VM2QxP7FdMQ1hUs30HfK1IbnJdWsG6SeHD+SL6rKNKRUtm5U/zH588l2RNe8QCdhp/de2LOmpkNNaIkjGYv9zg4A1O3tAHbM1p7sqFD+IJ+hkVRe3QwKSx/vkLkWkvmPMLGVXN/nADwrYG0lZavsH3pDIzFNiqt3JBGvfzWs35Wh9V0r67E0pb3p0mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2736e884-4b28-4ee9-b23e-24e763355d1f@suse.com>
Date: Wed, 22 Nov 2023 08:43:06 +0100
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/cpuid: enumerate and expose PREFETCHIT{0,1}
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9859:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b981998-1b25-4ae6-a1e9-08dbeb2eab50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HHkmd1OmMQ7T7po+baXMC3jb7egLhh2Cvqo1Vx++p+SnBUttTtGBo9uT+BKor7odfwKgyM9zgMFHXqQJK+wLJ91VTw+Ysvy/VJuGoIY39yeB9kSTzXCeTRC2GbMWvUFD0bcGayNMwfj2GeMjExNdnDpDYg44A2iSsRxjeESVzGDyS+ReJHapzZLZ2jOtTI5AjqV/YVEvIN7t+Dg1jFEanMWcgGqocHk1vfW86ueyaddeKpUvC1DjkSKSA0P/uF/GdF34/Ep2plceBMUlodM2dQia4tivml2PclrziNp3UqqM9uf/OothnBLFFMESQH4uoSJhOHVWWzIbmasqFVWm31LBcj9ue4YwOrnB0Cl6UHBB5nh16Zyrn0pxMDOZVrMjFsUcbijfj3ytFKDDZWvNqRa1fVkbL7GsIKfDW5zUY3Bk0kHRV+BfZm/aHwnkKCeUuOlJ9c/AQWYgp2A1h85Bi+IslW+zsFjeIaGaNEloHV0i3mt9RvdBCB5yNrP6IEyO+0K2fTpaRTZJWo5UxM4RrtpV0vM3w3pimFVZ99Cmsk69IdA//pxFxecnVL1PYdCMbZaDKnH1/vJrbVuX5148Oqb3k9zRW+KL9L3MedjwHlbFWqBGhahsW+RKj5GJLWqw3Fm/g6GTGrcBq5qTJzK9CQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(6512007)(26005)(6506007)(83380400001)(478600001)(2906002)(5660300002)(41300700001)(6486002)(4326008)(8676002)(8936002)(6916009)(54906003)(66476007)(66556008)(66946007)(316002)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0dCVkxyZjZ3US90QVlHUlZ3N2xMYUFQQjl1K2svVkhvSlRKekxyUm9zeVNL?=
 =?utf-8?B?b0IvazIrVm5RemZSckZNdThzRndxWmdqK0NrUWxjeDlpWXpEZGpXcEVrSCtB?=
 =?utf-8?B?WjhUZkhjWFNuaHFKQndzSVZGaVFhNWNReHZ3UG5hOFYvSjVuVExGL3RZaGtP?=
 =?utf-8?B?NTdCTzNQbVhyK1pMZUdFMm93ZFFXeWNNQXp5MkJoaHBzbFQ2MnpDUXNocyt5?=
 =?utf-8?B?YzZNRW5Ub2NlbUdLWUk5b1JuYlNXKytxZmRxcjJ2cWExYkpsTVUwT0s2Nkph?=
 =?utf-8?B?WEdmZHNqN0QvOHp1WFhIZTV4dUVFb2toMmNPMEVYeWlnYkptZ3YrcHY3TVFU?=
 =?utf-8?B?T3lUdVk1VnFjVDdCUDdRL251aG00dFJDUTEwY2xDUUQrRmY2M3IxeUZuNXZX?=
 =?utf-8?B?VzhYSHgwWjlmeUp2Ukp4VjRuQjB3VnRNTE83Q0hOcitZdWRNemlYeGNZQlZS?=
 =?utf-8?B?Z1dtNmExNkpOOVRxL01zandwTWh1bFdZRHNISFVNbDRlS25pbGtqRFdRZHd3?=
 =?utf-8?B?eWhCcUxoWm5mekd6Y3kzM1lXem9laUxCSVZYQk5kZnNLa0ltOVVFSzlZa0lx?=
 =?utf-8?B?WDE1TEJRamdTNHQvbW03OHlpOUc4ci9jQmhuSFc3UWJWZDRFRm45YWxFeE43?=
 =?utf-8?B?NXlic1VaYy9uNm9iSExmaG80U3Y2cXE3bmhrNzV0YzUxKzBxSi96NWNTNkQ5?=
 =?utf-8?B?SUxWa0dYQnZNTU1kRnkvbDRCNnFmeXR0VTZnTXE5Si91TTU2UjVLb0F2TURN?=
 =?utf-8?B?aHBmLy9XVE1PZkRGTkI5bE5aVEU3R01LdlRaOHNXSjRWaU5KNjNIaDJYN0Nx?=
 =?utf-8?B?MlYxaCtyVFpBMkxTK2taSnpoN0NSSjVRZzFnQnFJb0xmTEtlUFJ3bnlkdURZ?=
 =?utf-8?B?TU5qL3RHTThtdkZlYVNUMlN0ZTZSTDM5Ti9tWUhSREJVOERFMXYycVlkWkhl?=
 =?utf-8?B?SnZXWk5FQjB0dG9seHhrVnVlS2pFdGtUTUMyYWgrdDRuVHAvWDRHa1BOY3lC?=
 =?utf-8?B?RUluMlJZQ04wQytqbDlraVBFeTFyTjRBczg4SGFpNHg3aC9UaVY4TC9kSzZ4?=
 =?utf-8?B?MkVycEsyZUV2ZFFSV1loaXRKZnIzMjJnd3B0TmVYM2N5UHo5SVJkUWtReUR5?=
 =?utf-8?B?T2VUamFPU2tTbWhqZE1YdXNDSHBNeHNZU2VRWjZMcVpvUVIxWjFqSzhueXRz?=
 =?utf-8?B?THN2WEZBWmJBY2lNMnpTUXNiQ0lqRitZMFRNRlloeWZWWEpFQUJrWGZQbGRP?=
 =?utf-8?B?bVJNTWppWDRRNXY4d1Roc1RCQUdHY1FzZkhMckZrQ2wyM3lmNTA2VGRBR2kz?=
 =?utf-8?B?NklmRUZtcnFGSW1TQU9FVkE1REJsaThtaGRsTjV6Q1ZkRW84TCtPajdzRVJq?=
 =?utf-8?B?ekVUQWN0cnNpa1FrWHhicDdYNFBaTlJuWkhYNERMQzM4NHlYa2xlaHdiYlZG?=
 =?utf-8?B?RDNPNmthSjVzVDFFRzJKOVIvcDlmN3VoOWc0UG1LVzNVTzdYaE5pZUVoM2xK?=
 =?utf-8?B?S1V3bGl0M2w1NFJ1S0QyQ1QwWEhzWWJpQmUvRHBKZUhWQ1ZMVkE4TUdHeXVX?=
 =?utf-8?B?N25wUy9ubDF3SmRTTG5paEdWSXk3YTBTQm02dWhuRHFyQnpXRUhsUElHakxa?=
 =?utf-8?B?cU5QYVduQ2pDVXc4YW1ZY0I2dXdnS28wczAyRW1ZUklVc1N5dnBMU3dFanRj?=
 =?utf-8?B?UVNGaTBzWUF3Y0FwK1U4RWNWc24rbkorbVhZcFhWNEhUMTdLUXNxZTF5enI4?=
 =?utf-8?B?WGEyTEtWRjRxVEFBQU1kRlJJY2hBdHBJM3pqZzRXL1JVdHYvQU1hcGZUbVRm?=
 =?utf-8?B?UUtLaXNwK1crL3VuSmZKRFlMbGtFc2dud3lNVmlBNG5Ga0o0cHc3dCtEOTBN?=
 =?utf-8?B?RjR1M0REcjJNNzZnTGwrSGFlZWovWUZZb2plNGVzVkY3L3dHd1NYbTQ5Vlh6?=
 =?utf-8?B?blZJVkVOMlVNdFpoa2dDeFFDZWFCL2VuZ21IRW5IWmNJcVJUa3U4S2pDTTcx?=
 =?utf-8?B?UjBCMVpZdW4rcEl3Yy82NytET0NTVnRCOHNCTHNuRENsTDdtQVJIZ0FXS2Ez?=
 =?utf-8?B?WGNxOGlrRGRlZE1qcUxITWJJYzV0TGpVS3F6ak5HaS9JUnRUalh4UXgvNlhR?=
 =?utf-8?Q?FcJXZfJG5hBkARRLUSmWjJRUz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b981998-1b25-4ae6-a1e9-08dbeb2eab50
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 07:43:07.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llV+xNJikG3kJ9UtrHtAKETnTCDWQJVLoANKSSe27o0TiwtE40VWdeFN7JRW3nTvcU+9D8EDmvb0xDpgGZUyGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9859

There's nothing else that should need doing in order for guests to be
able to use these insns, as the encodings are in what's otherwise NOP
space.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: gen-cpuid adjustment.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -220,6 +220,8 @@ static const char *const str_7d1[32] =
 {
     [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
 
+    [14] = "prefetchi",
+
     [18] = "cet-sss",
 };
 
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -310,6 +310,7 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
+XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -274,7 +274,7 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, PREFETCHI],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.

