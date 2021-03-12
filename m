Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EFE338849
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 10:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96913.183837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdnA-0007Ft-R7; Fri, 12 Mar 2021 09:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96913.183837; Fri, 12 Mar 2021 09:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdnA-0007FU-Mm; Fri, 12 Mar 2021 09:09:08 +0000
Received: by outflank-mailman (input) for mailman id 96913;
 Fri, 12 Mar 2021 09:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+C0=IK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKdn9-0007FP-13
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 09:09:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82f122f8-a63a-4a9d-bb7c-ccb06753dac9;
 Fri, 12 Mar 2021 09:09:04 +0000 (UTC)
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
X-Inumbo-ID: 82f122f8-a63a-4a9d-bb7c-ccb06753dac9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615540144;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=378qcNixXSwSV7WZBQWsevkgR8pimNwXN5aigWCHbC8=;
  b=a96GKs9xp/8AwPskMWyQ0ZAMhqFsX4R2lmh7T9bq3gvHjigRzpjydw2S
   3311yZxoGRZSdkFKcbuGuufj6vJmkaJNc35L4PXn24+u3i+GsvF/dRLvc
   siQ7BMmy5gTLejzu9MxhH9TMLIr9HDC3+CjoLJuHv9W8rym2CihEhmdad
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: swwvuahnNB5VfZDgcfvlqvSCCpLJuuNWK+GzZhDBfOmdApXllrMh9wVTZ/CIibnXOsqAqnspP2
 1BXRNZA1caGgnRIhrUDO7Z3wC6q+uedpJBY4K/ZPeOm+zTpkT0YaI90WSuQiTbt65uaRQYktPP
 4DXbF0PGCcmd5xEeFLc4imlnl6x7OS7rKDLnFdJbQb/LxUiXEEHcBbvRUPhf5QTLtwvLNNgBRV
 Fn9cHVgvSpodDKSkAaOk5chq1YjWcogrEVOKVvxNuigntePEEaObXdh4aIfRJLXk9t1ugBCikv
 /SQ=
X-SBRS: 5.2
X-MesageID: 39498421
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c6nJdag2CVO13SlUUTX3BhDZQnBQX3tw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGzGdo43Z2j+Kenme/Rwx5WPH1XQotLhj0JbjqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGms3TmPvdEFA7LjMEyC3LtzOn77bmDwOVty1+bxpjyaovmF
 K16zDRyb6kt5iAu33h/k/Vq69bgd7wjuZEbfb89/Q9DhXJpkKWaJ96W7uE1QpF4d2HzFoxit
 HDr1MBEq1ImgjsV1q4qxfsxAXsuQxGgxSJpD/o4kfLmsD3SCk3DMBMn+tiA2HkwnEtoc1m1+
 Zz13+Z3qAnVi/opjj35NTDSnhR5y2JiEciiuIagjh+VoYTedZq3PUi1X5VC5sJEWbG7pkmGo
 BVfafhzctRGGnqCkzxjy1K+piBT34zFhCJTgwpocqOyQVbm3h/0g8x2NEftm1ozuN8d7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWOpJ0j9Hq1vAQOPl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeqDwYNM6RKIZGmmRzzixoV/6vFCy//BbYuuFRfGZEElksOmrflaKNbcQe
 yPNJVfBOKmInDpHYpPwg3iS5hfIXQTS6Quy5IGcmPLhviOBpzht+TdfvqWDqHqCywYVmT2BW
 ZGXDWbHrQG0mmbHlvDxDTBUXLkfULyubhqFrLBwuQVwI8RcolFsg0fj0Wl9tiGQAcy9JAeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fHnSHNFpQgDNkvuarYds9CDeWRftUH3YyNXfofzKk
 pytl538aW4I9i73iY5Ee+qNWqckj8Ovn6QVowdnaeC/M/hfZs9Av8dKfVMPDSOMyYwtRdhqW
 9FZgNBe1TWESn2j765yLYOAvvEStV6iAC3AMJdpH7Fr3+ArcU3SnZzZU/3beenxSIVAxtdnB
 lY7rIWirvoo0fQFUIPxMADdGBqREvSKrRcFwiBbJhTgdnQCXBNZFbPoyebhRE1cnft7GMIiA
 XaXHepUPnWH1tQvW1Z2K728FVyMn6QZV50d2oSi/wPKU3DoHZr5+qCbaa3yQKqGys/6/BYPz
 ffbTQIJARyg9ixyR6OgT6HUW4r35M0I4XmffgeWqCW3nOmM4uTk64aW/dS4ZZ+Ldjr29V7G9
 63akuQLDniDfku1BHQrnE5ODNsoH1hlf/zwhXq4Cy523E4aMCibWhOVvUeI9uG6XLjSOvN2J
 Jljcgtte/1K37vcLe9uOjqRi8GLgmWrX+9Tukup5wRtaUutKFrF52eVTfTznlI0Bg3Mc+crj
 JQfI1rpLTafoN/dc0bfCxUukAkk9mCN0MnuA37CO1WRyBns1bLe9eSp7bYo7smBUOM4BbqMV
 6E6itH4rPLWTCA2bNyMdNHHU1GLEwnrHJs8+OJe9eOVEGkd+Rf8EG7NXH4erlHU6SBEagRqB
 E/49zgpZ7iSwPonATL+T18KeZS9mziR8W4CgeFA/RJ/Ny3Ik7kuNrj3OejyDPsDSKmYEEZj5
 BffUMebs5fmiAv5bdHpxSaW+jyuAY5iFNQ7jFsi0711oWn6GndG1taMQexuOQgYRBDdn6Sjc
 rE9uCE1HPypDhdsKOzZnttQg==
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39498421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFwILX97UcbEOKdBMCdzDBsNl7mMvRtI9vkrv+SCvVp+ml9cfATbcuW/WEGums8gFcLn1RLDm185q5A24x9/YSifWJDa5qd8emuYufwJc/kXviZIVKhnF0xHrsPapspJXlWzWgI2nm67dowHH+Z3BSlILcZgkf8ZKdq5BFpYpOxxb5FZrV5Dls8/o+uzVmZSDBSWLTWT4kSW8XvTpXbq6H0RoJw1UcUJA9dYM+gtUOZHlPL0xhPcVTdVuCHDV8LwP+Nhlf3SL5vfegut2iBZv6SZZ+w7Ayv93VvOpa3dwF66VCtLSbyZrMBQNDv5mlL6tz96Wku6FNnYWYm4mhy5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDW0PCDjN+tn7CYPrCPUjvIRmk30V9xvRTya61+pBzM=;
 b=hXLmCMokRyyaXnWtxsrAEGQSryZ4RaRSVlo91THYrA1f0BRAexSVEMrguVAXEJnOz1Mm11wug7pfyz4TuXSGlVL12mWY2h9ICiG9RC27XZeriXWop/lvl6beEbjTF+CNIVihJnC53+0K5GGX8FVHV3GHB5Pl0CMGH/Y/vEsJ+PLtlnkxpvi2V7UP3O8+HairSAWqfgMlUWhPSj+LE7hwN8GHT37j8d1BNZrGg8QgYgYHnfz4kjTIthRP6pQ4bMHhf/iWu7FCyKDlCjqbpMCbphU3uZNPOgEu+QnUDEWfUdmz6jaV/as1otY5mRxFsyh0SwYaRaU2+bGuBJtP4Ry73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDW0PCDjN+tn7CYPrCPUjvIRmk30V9xvRTya61+pBzM=;
 b=mHcx44E0XDTfqxECOYnqVnM21n/1GfivfCJieuTCEhVzm1uumLJww2/5cavg8JqPKj+zsux6idD32neORGCRD68WZ4NskI9z3vuevJpr7rn6zaTESwRphNXt8d20He6wYTLx9LzA+D1+34vh4YAru44yPl8+DEhYJ7ZaGyxR2i4=
Date: Fri, 12 Mar 2021 10:08:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v3 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <YEsvpK8WJQNqSQGe@Air-de-Roger>
References: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
 <90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
X-ClientProxiedBy: MR2P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f11af745-c8a6-415b-e399-08d8e53678e5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2635:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2635979FBDED15A3EADD379B8F6F9@DM5PR03MB2635.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZHpJlNo3yukoQbo39A+lfDEX6zeakh+CNhlarPbraBrHx9E2QdkIxgHHKFXwPwqKiQ7H44JduIgLsyUVMrEkNZEVxw3jtSDh70X8ROlCAG011gSTu9Ia9nMvsbKEMF8bGFbpd7xhrL+zyBaBnA/aazKrgK0efWqDdylhcRGNu3vEl+EjSnDEfL8cOhkBRLAnZ6EvoKAMJEks4KI6I9fupbifeZHIofTOdbT14dNpLqJf+xX7CqKb7KuFH/02UW7/weeIuA9czDEiFUHr4GjbBSIv+yj3AHQtkEXIxs5t6vm2veb8B6/n4UVGf2QnokYBfsqt7mxDEZCbh9xUW0DwBxgl7LB1jLNmTJCcWVwfNKeWOCcKWD3RTpvLz7uhnENpm93CkYBHYmi0maJ2qDFQXnjSSGHy2nFhKcma1ehSVeRdRxMv6GvgaQRn7Zc+csRu/0gv7eTz7S11khv4umJgEO9ybg6v9WWcp8KCzlbv+OnKYQEk60fBgyJgLf5Q3pjyD1a5Hd/DEb7/Pl60vGlCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(4326008)(186003)(2906002)(8936002)(8676002)(85182001)(26005)(5660300002)(956004)(16526019)(83380400001)(86362001)(66556008)(66476007)(66946007)(6666004)(478600001)(6916009)(54906003)(316002)(9686003)(6486002)(33716001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnVHRTE0YVBrQmFUV1NIZzJEazYzbkNHYkVJcWZ3ZXhHWXYwTGhDVEpYU1Zy?=
 =?utf-8?B?K0Q2SDRYdWhIdmNzMXZxTUErVmsrL29ZUVhuTEdPZXAxdlErdWh3SmJvdXY2?=
 =?utf-8?B?dE9jckc2Z0FJVjZ5ZlFtWmhkYlVjczNmWTRyd1NZYWRCMkt0Q3QrWjY3MHRt?=
 =?utf-8?B?d2ZvTFR2cyt2STRDWS9pY3VPdGJ6SUZEZjhDNG5uTmpnL2t4cS9IM3dHek9F?=
 =?utf-8?B?ekNGVFJTYkpqWXgyVEVXS0FTZTNibUluenRYNnJJMm9VYmovNWJLUzdVU25w?=
 =?utf-8?B?UmFYWThwTVg5QWNYTUxMcktDa0FBdmswdXZDVmwwSUZ3bHFBaFRLTWV3Ymg1?=
 =?utf-8?B?d25KMXVEb2oyU0UrRzgyamhFR1lTK0FLYU05WUduV240dUU4Nk1DWWJsMkZ4?=
 =?utf-8?B?ejFIbDZ4akQwSUtJOWFVb09NZ1RUVm1CeXJoMC9UQ3FPTUlrZE5vU0dYbjE1?=
 =?utf-8?B?RzF5TFZpMHcwc0hxMXlrcXFCR0cvejdud2FhT1FkN1VQcmRKS2kzM21nNW16?=
 =?utf-8?B?NjlOZ2RuK3drQVdRRkFHTUZwM01yK0g2bmR1TnVkY09waUM1WDF5M2h5WEhp?=
 =?utf-8?B?UXdYTUk4Qkx1cG43cmxIQ3I1ZjdENFUzelFEUnVLeVR1NlYyeWc5eGpKOFQ4?=
 =?utf-8?B?ZjhlSWxvU05wWCtSaHdRbElyNm1UeDRSVDdvc0JHbjRac0FMWXZBYkI3K0gv?=
 =?utf-8?B?SGhNNXNLNmVmOENqeDVXREFxRHNtWDlkV0FBSmhWYTV5dmlVRlFEMHVlZDJr?=
 =?utf-8?B?eFFXa2s1cFlKbXA3ell4ODRRdnNjNHhSM0NBd1J1K1hSZm02ajJBNG8rM2JF?=
 =?utf-8?B?ck85bE1acmdwRXFyTHM4dmRyc0NwRXV1dmg5L3J4VE9UOU0yLzB5ZXJYRlI0?=
 =?utf-8?B?TU52emVQaFRiNGc2ZEFPUnhSZndTanFwNFdIUThJZUJFS1dtL1JJcE9nNW1r?=
 =?utf-8?B?U1NhNGhGbnE5TFNjazgzRmIzVEtybm1MYXNUUXg4VWJVbC9BYkpUYWFSdk82?=
 =?utf-8?B?T1ByT043dmVIalIxRUY2NzB3RkVFR3E5V2tJdStoS0loWmtCM2FMS0dlK0hp?=
 =?utf-8?B?YnI4dnV6VVNlSmE5eGFYUk1vUzNLeHBBMUUvY1psR3EvL01EWEF6RHIvVElI?=
 =?utf-8?B?K214WjM1U0hPYU95QmRNQ2YrZkJRcVFvMVVzcDVGaThFVHd1YVltQlFwd2Nz?=
 =?utf-8?B?TnlzZUQweUZKNHo4NFRxWGYvbG5jQ0FEcXlNQitvOTBlV2RzK0tiQ0VpTDRj?=
 =?utf-8?B?OEcxZjN1Tko3Q0k0Q0VFaXlHLytRenZKYkFJRnJxZHU3NlZXdVF5aUFDZ2o2?=
 =?utf-8?B?U0NyS0NEMFZFdTZCdWNFN2haWElSQlprZ3B0bFdwYks0Sk5jdU9vSVltTnNU?=
 =?utf-8?B?QmtWenk1R0VCRzg0YXVHZHhJQUpBME5ZVGdiNG5pZGlGTXZLaUFJSnN5ZXVO?=
 =?utf-8?B?bWdBejBRU01jSFF3d1FaODc1TkszbGd3V1dEMS94QURSaUp5YXFxZTJDQVlu?=
 =?utf-8?B?RFNyRGhNNExYT3VkQjQ2ZVdqUTFjRGFCK2diV25SNDN5YnZEY2g3RStuQlp2?=
 =?utf-8?B?MkkxY25DWnlKcmV0VW8vUFhaTlhuWVd4Q1g0dWJVeHhaeGl4WmhTdGtZWTV3?=
 =?utf-8?B?c1NHTUhlTDFFdWt6bVV5OFVnL05jYkxUQkJEVHRhVUJwNmQxSnA1SmtTTVVz?=
 =?utf-8?B?RFpwOTB3cC84V251QUM4Vkw4ZVlTd1o3NUlMV1VVNFA1alJRWHlqM1dvUDNx?=
 =?utf-8?Q?d5BNbHNpyVfMGg8qvuOMWhQ+yeOOBVZyxTo5sa3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f11af745-c8a6-415b-e399-08d8e53678e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 09:08:59.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PZ0YsaPmOQh+7gBqx3WSdY+CLEaAFx5TBcXjl26cuOVej55gaO/Se1UnJtBN3GxEuAXyWKIlNrPvAvCB5HIWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2635
X-OriginatorOrg: citrix.com

On Fri, Mar 12, 2021 at 08:54:46AM +0100, Jan Beulich wrote:
> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
> handler early enough to cover for example the rdmsrl_safe() of
> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
> of MSR_K7_HWCR later in the same function). The respective change
> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
> backported to 4.14, but no further - presumably since it wasn't really
> easy because of other dependencies.
> 
> Therefore, to prevent our change in the handling of guest MSR accesses
> to render PV Linux 4.13 and older unusable on at least AMD systems, make
> the raising of #GP on this paths conditional upon the guest having
> installed a handler, provided of course the MSR can be read in the first
> place (we would have raised #GP in that case even before). Producing
> zero for reads isn't necessarily correct and may trip code trying to
> detect presence of MSRs early, but since such detection logic won't work
> without a #GP handler anyway, this ought to be a fair workaround.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I think the approach is fine:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some comments below.

> ---
> (projected v4: re-base over Roger's change)
> v3: Use temporary variable for probing. Document the behavior (in a
>     public header, for the lack of a better place).
> v2: Probe MSR read. Exclude hypervisor range. Avoid issuing two log
>     messages (in debug builds). Don't alter WRMSR behavior.
> ---
> While I didn't myself observe or find similar WRMSR side issues, I'm
> nevertheless not convinced we can get away without also making the WRMSR
> path somewhat more permissive again, e.g. tolerating attempts to set
> bits which are already set. But of course this would require keeping in
> sync for which MSRs we "fake" reads, as then a kernel attempt to set a
> bit may also appear as an attempt to clear others (because of the zero
> value that we gave it for the read). Roger validly points out that
> making behavior dependent upon MSR values has its own downsides, so
> simply depending on MSR readability is another option (with, in turn,
> its own undesirable effects, e.g. for write-only MSRs).
> 
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -874,7 +874,8 @@ static int read_msr(unsigned int reg, ui
>      struct vcpu *curr = current;
>      const struct domain *currd = curr->domain;
>      const struct cpuid_policy *cp = currd->arch.cpuid;
> -    bool vpmu_msr = false;
> +    bool vpmu_msr = false, warn = false;
> +    uint64_t tmp;
>      int ret;
>  
>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> @@ -882,7 +883,7 @@ static int read_msr(unsigned int reg, ui
>          if ( ret == X86EMUL_EXCEPTION )
>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);

You might want to move the injection of the exception to the done
label?

So that we can avoid the call to x86_emul_reset_event.

>  
> -        return ret;
> +        goto done;
>      }
>  
>      switch ( reg )
> @@ -986,7 +987,7 @@ static int read_msr(unsigned int reg, ui
>          }
>          /* fall through */
>      default:
> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> +        warn = true;
>          break;
>  
>      normal:
> @@ -995,7 +996,19 @@ static int read_msr(unsigned int reg, ui
>          return X86EMUL_OKAY;
>      }
>  
> -    return X86EMUL_UNHANDLEABLE;
> + done:
> +    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
> +         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, tmp) )
> +    {
> +        gprintk(XENLOG_WARNING, "faking RDMSR 0x%08x\n", reg);
> +        *val = 0;
> +        x86_emul_reset_event(ctxt);
> +        ret = X86EMUL_OKAY;
> +    }
> +    else if ( warn )
> +        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);

I think you could add:

if ( rc == X86EMUL_EXCEPTION )
    x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);

> +
> +    return ret;
>  }
>  
>  static int write_msr(unsigned int reg, uint64_t val,
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -143,6 +143,12 @@ typedef unsigned long xen_ulong_t;
>   *  Level == 1: Kernel may enter
>   *  Level == 2: Kernel may enter
>   *  Level == 3: Everyone may enter
> + *
> + * Note: For compatibility with kernels not setting up exception handlers
> + *       early enough, Xen will avoid trying to inject #GP (and hence crash
> + *       the domain) when an RDMSR would require this, but no handler was
> + *       set yet. The precise conditions are implementation specific, and

You can drop the 'yet' here I think? As even if a handler has been set
and then removed we would still prevent injecting a #GP AFAICT. Not a
native speaker anyway, so I might be wrong on that one.

> + *       new code shouldn't rely on such behavior anyway.

I would use a stronger mustn't here instead of shouldn't.

Thanks, Roger.

