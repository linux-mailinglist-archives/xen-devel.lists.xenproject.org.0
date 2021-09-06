Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE4402063
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 21:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180230.326824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKHF-0003zd-2z; Mon, 06 Sep 2021 19:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180230.326824; Mon, 06 Sep 2021 19:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKHE-0003wK-V2; Mon, 06 Sep 2021 19:27:32 +0000
Received: by outflank-mailman (input) for mailman id 180230;
 Mon, 06 Sep 2021 19:27:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNKHC-0003VO-Rl
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 19:27:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76499510-0f48-11ec-b0b7-12813bfff9fa;
 Mon, 06 Sep 2021 19:27:24 +0000 (UTC)
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
X-Inumbo-ID: 76499510-0f48-11ec-b0b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630956444;
  h=subject:to:references:cc:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YiUT4mNjlZ92jk3RwIuC/v40/jTL0JJz3cuHc6HT3CE=;
  b=bqZvMwPik9E/dlI6xjSQhFZ6z/XLBBeAYbgeT4tTZyjFN5pFRl+g5h3Z
   rLa+h8b4Jsor1gsV6S500phZbsEIUCpjilqowr92Uz7EzH9OCuPxZF/AF
   wNleulWBv89id2uaz4YL/BobadM+kx3dvKZCD2TmagWbVfL9cfvXrPkN0
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: muftSrz5kPvlD9/8HA8ixQ+XB8VqvebWULeKAvwli3Goy1hGAGRhGgS9qyErASdkKDgksYD4tW
 3UXeWt4I8W+wHPjc0R/EmDzZlg8THlv9mUUV86YVpKhlGR5yWdvw9BERKagx/hC1GvCgzciHnX
 Nq+JRGPgDWzvnclp+k1xNxqysOLssoLpbmiT0fAKme1nFwiEGzuEP/3d7LhFiD4vedwv2ZYu9R
 L+ZZmlJFEdXbPdqPxUcBnyi0vTRu6FppTUEdIVfKvzQxVosCXG9//LYvaqUHl3/0gx+BVPwEfi
 3F4X5CoaiBFy9pk81shadGVy
X-SBRS: 5.1
X-MesageID: 52117783
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vFpb9a9FPigGqSG8CoZuk+FPdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQts5
 uINpIOcuEYbmIK/foSgjPIaurIqePvmMvD5Za8vgRQpENRGsZdBm9Ce3em+yZNNWt77PQCZf
 +hD4Z81kGdkSN9VLXEOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv2nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLbU5nghBgr/DWQZAV2Iv/fKXJy/fB9kgIm3UyR9nFohvD2xRw7hdQAo5ot3Z
 WNDk0nrsAWcie6BZgNc9vpevHHf1Aldyi8eV56EW6XZp3vBEi936IfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52117783"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/p6R6dXyjhuqaq8YcR+fIG9mhyXkOUAurGrEy4KswqPdaDfvEC8kU2w0D4PDQXnvrRN1qua4A2xSVzSVZJIkdEe+4nhT+k7KsQ2ygfYXiXSP6dz9oa+/q+67BuTHb9AJYohML78/DP4++KmMUtmqF1+8SjHkBaMtSFy5NjvpmDH8v3XJ5MLnM0OCbWTZYm0thhVfYdy8Hag95jm6NJsLtDMOPoP2M2SiuVgSo/wXxu0030n2XtTFNcfT9bLNdctmZ3EuP732zryuOTG6xTs6avVsFMcUJS4Z95dalICpBD6JZvovZuS0mjTaxWa+pgQZaq2z3C5qZD/K7cAQJ5sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YiUT4mNjlZ92jk3RwIuC/v40/jTL0JJz3cuHc6HT3CE=;
 b=lm83mPmT8xLKC+iEsopt4sfgdY5m3voxhqYD4E1/mulXQ3fy0dJykKotMTbvUatWeZBLpfB2bGAvRYNCzg9gHSXtNE4fW7crPGOBp2r0NxOL1jWrY4QvyhNdPoBgFotXCxvoHjAWiiPdM7D4sL0hqDOfm8yLs6WiG+6OfDTI6tXWT5wjB+z/jDMBOgXhvn70Qnb8tclHxvFMibrWbsvpFdaSjjhbEQBOfbwErN1b+G1SjY+fCoWVgxmioMlfWa/lCSDcrfxEfDPjvIkgMSC3LAJeKsFDI2ces6wCppSd1rz4wyqzNQ81t95WtSuXY7G+MU/vrSFOqIV8nfx7qVAInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiUT4mNjlZ92jk3RwIuC/v40/jTL0JJz3cuHc6HT3CE=;
 b=rK7GqcBhPhf+jCDtJyCMZXbEAWx/r8UrO2FCakqhlgO8XF53exF3VVaB42E29YcVEu8h2hrXoMI2B9L/YXcgNGGjHpsou2Hml8gRLI0FQe3BPzTkk6wdzT1YJfoiOguttz0Bgq1fyOfe1yyRX84mHY7rn+0s0BeayF89CSfsZJs=
Subject: Re: DomU crashes when restored if it has pci passthrough
To: Bhasker C V <bhasker@unixindia.com>, <xen-users@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <CAPLCSGD9ZTaoMSqgo6EEdW4VYs9wrz+YvChR_Cx0Rkm8x5iq0w@mail.gmail.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <65f4630f-546e-57e8-7147-b5add37d594e@citrix.com>
Date: Mon, 6 Sep 2021 20:27:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAPLCSGD9ZTaoMSqgo6EEdW4VYs9wrz+YvChR_Cx0Rkm8x5iq0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6221555b-8e66-4d15-1bcf-08d9716c590b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5000556A10E6BF9460C4975BBAD29@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eFNOS8bYy2gBtslgL45WsNV7fJjcEwe/qiNHKoXk+07DMLQIjHAxKfapJiRCihaEICAM7amsw7zFKl6dTtwMFkElHe3F0epm3/9PHWlVSsubK1k2yk32UezesoNW4+87dIdBIIC0APWx5U8XffC+/5NuJAZtqzcl2ieIxlcdJQWVmTVp7SZgcegb7z/8XWSbyuBApzGJy3V6TZHFe90fxbsZpr9RL4gE+dOOh77G6e2R3ZjVzsZMEdDTfzoFgih4dhG4f6uoNCNAhgcBGxmrx2ilIL1gBNvwBzVWWzyOHbsTOD6mzMkiAXAjPoeTpGlCdEMx/piTWfUxuL95Q11Xgwu/bgLm7yDa+CaU/BV7Lz1XH97jqeQ6mLYuOALYajWAUQYjL2FpJ8xi9T6YLP5Y1yQPM6uTVeZwCgA0MTbqMJbdzoG9JJAiW7FHblxYkcA2r9T19OL2Wkgq9IoiYTBZNFtSh2S/StU838nkU6KEYPaG1zLLigU/fXZBhkOpzhVJzGMlf/tFAGwECyKMsq0SRFhIG4lzfst4SJJqnzMSw8IAsC0qwJptt5zjN2DMwissbzQwdsEyBoSFAxaOUpsZBMJd9aGkreq9xqExAWwbxLnuSjRTSjoLzvfKGYG0eVIoffgn0oSUB9OBQu+UY3MFk8xeM5s1YztpBzfdnFYC0EVSOPCAur90fwHqlGu7VmAKJvXjxcuJMn2qGInQcLgBoOTuVF5ekDw2wr/pNZADOYUOdGH51p/8eptuu/rKYjcv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(4744005)(66476007)(83380400001)(2906002)(8676002)(8936002)(66946007)(66556008)(5660300002)(31686004)(107886003)(16576012)(31696002)(6666004)(36756003)(2616005)(54906003)(55236004)(478600001)(316002)(38100700002)(956004)(186003)(6486002)(86362001)(26005)(53546011)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkFSQjlFMjVOZ1lreVF5Y3ZqQ0lUR0owZVEyUlg3MnpTbDdQM2JYRWdodnlN?=
 =?utf-8?B?dEh3emtrWVc4OFBwTXhvZ28zcUljdlVQdTV0S0NtaTBmRFo0b3RHbitGaW9m?=
 =?utf-8?B?S3ZUOVgyNDhueWUyNHBzVDZYZUNadkk5eXNCS3JWQzA1bkxwZmpUbVZtSGdv?=
 =?utf-8?B?djNyU2lnZ3BUN2xrTVM3Ly9hNXV1SjBPajdJM2RQU1pYWWc2R1ord2g0ZDNj?=
 =?utf-8?B?YVMwelY4cWdVbEw3elU1N3JvU0taT1RwRk5oWG9tZkFTUFNCTkhUS0E1MlRt?=
 =?utf-8?B?RDNXRmlrd0N5cjBOMnBoMVVGS2lwZ3ZnZmRoVm5tRkRuVHlFd2QxNDFIWDRV?=
 =?utf-8?B?Wkw3TUI3Znd0UWJNUHZwbTJia2p4bXZyUTdzcWJlcWRxN1pOZnVwNUREdGt2?=
 =?utf-8?B?Y1FBU2xmMTBkeU1LcllndnZDS0ZCNUo1Z2I2ejZQcWZoN29pV3Z4YVJVTjNv?=
 =?utf-8?B?ak9Yd1BzMlpETGlDNWtIT0IrMWkrMUl3SGpkY0FFdHZaYVcyMkdCUW5rS1hT?=
 =?utf-8?B?QXZaTzdKSFVSZzdSMzlDMXl3UzNuVWxYemsxRnpOREZiQWZtaHgxd290bkV0?=
 =?utf-8?B?L2hyY3lXZGhzbnJCTDhZREIxN2FwaS90RkNmdzUyVUYvMUVpYXRWK0Q3Q3g2?=
 =?utf-8?B?d2VraDk0b0dJQktsNkNVakhzdlo1N2orQVIyc1FMWDArQVZCdGpGK0x6b24r?=
 =?utf-8?B?aDMzWTBkNDNlZytKN2JmUzFmbWdLdVY1NTFDQ25EaWhIblFRKzk0b3V3YjJQ?=
 =?utf-8?B?cFpwVTJPVnhBSTc1bVVOY2diSU1EcFljWVZ0Y3ZCSWRrcUM1THE0T2N3a0t2?=
 =?utf-8?B?dmZIM1Zwb3lNZ3VYcHdDN0EwejJ3NzFCRnovZ1hXd25rZk04OVV6OHN5dklj?=
 =?utf-8?B?RWdZNnZhb3RXN0NRbkNwQS85TGFKQWRyUUxwR1FlODFZK1AzSHlsQnU1N1dl?=
 =?utf-8?B?azdDcUJaaUc0THNZelpxRFJUSmdwd2JFTm00UnlhK0JNbTgwcy9WY1JNQzIz?=
 =?utf-8?B?eENsSHBZMjlWZVl1aTQ0Z2pnN2s2R29COHQzL1dVK0pDSWlDdUFHVnFVWi9O?=
 =?utf-8?B?L2VhblVQaHV2RHRkc0doY05HYW16eHZxejJpMXMxNHlLOEVLcW5mQllyOFVY?=
 =?utf-8?B?dzNtU3ZGNktlcW5KRVU3SnFsRjQrZ3lZSVhoak85YjIwNXgzckxTMXYxbW1O?=
 =?utf-8?B?c2xHMGZLTWhiR1h1MlZWRTliS0w1MjdOT0pkbEJ1Nk91aTJ0bloxeTVZSTAr?=
 =?utf-8?B?b3hUQ2pmWTRtZmhqM0Zyc1I0dTAvbDJMdVNnZmMzekc4ZVVlRVVLdElxcCtn?=
 =?utf-8?B?RS9BOVl2dDFRcTZJS2x1dUtrcmNrSUN2eFdCSjZENFdNb00rZGR2ZSswaUlY?=
 =?utf-8?B?UVdFbGpEdVR3MGZSUjJhZVU3dFp2TEZKenFPMW4wYkQwQ3lza3hrOC8vazVF?=
 =?utf-8?B?NkhYMlk1bWxpMExMb3piM1pZUC9lQ1B3cHpTeENIMUg4Y1F2TnVPTGtUby9H?=
 =?utf-8?B?eFhCaXN6ck95V2tQV3ZRbkNZM0xwdGJMcWppVFE2dnpDQlg1d3ZaU201aUxX?=
 =?utf-8?B?SlhIdjZCMTFhemk3enlyUjQ0UXdVSGVqNld4NUlWYm9FR2laUHZYc0h5RVc2?=
 =?utf-8?B?YmphVE5XR2UvWXoxOTY1eXNQQXlhZDVTcTRCeE9TSlBuTk9uaWNsRzVBM2RS?=
 =?utf-8?B?VCs0cGx6ZjgwbEwyK2ZyZjY0NitmNUQvTlduSW1yUThXUFlER1R1Qi9mbThv?=
 =?utf-8?Q?Pr82dw0aXxI4Q+07sRWbh1/o+e/ML6OGVmgTpxc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6221555b-8e66-4d15-1bcf-08d9716c590b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:27:21.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXgfyeaaLSrj5imdTwnouNIIU4vfJ/FkHQEhEtoipGOtncKN4khFUcCbJ/dZTeiCBqD9VF42AJn7kJ17McBvxAteXn99IMbrBnVzzpno1Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On 06/09/2021 01:06, Bhasker C V wrote:
> Hi,
>  I have a domU and that domU has network vf attached to it.
>  The save and restore leads to crash of the domU after restore.
>  Am I doing anything wrong?

xl save/restore really ought to give up early and refuse the operation. 
CC-ing the toolstack maintainers.

It is an error that it continues and creates a corrupt vm image.

~Andrew

