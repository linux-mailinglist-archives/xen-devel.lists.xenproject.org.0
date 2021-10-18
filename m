Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338EC43232C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 17:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212474.370352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUm7-0006Zg-Ss; Mon, 18 Oct 2021 15:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212474.370352; Mon, 18 Oct 2021 15:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUm7-0006Wm-PF; Mon, 18 Oct 2021 15:42:07 +0000
Received: by outflank-mailman (input) for mailman id 212474;
 Mon, 18 Oct 2021 15:42:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcUm5-0006We-83
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 15:42:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0d65f32-3029-11ec-82dc-12813bfff9fa;
 Mon, 18 Oct 2021 15:42:04 +0000 (UTC)
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
X-Inumbo-ID: f0d65f32-3029-11ec-82dc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634571724;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NK0ySM5BDbAMR/5pJvLLECJhlcat3ZjFUW/iLeLS4sY=;
  b=iRlyS7E2WkIQs0Xvk9npzcnktVj1HZqZWNuoYkOoBV/LbrVh/XwavIBp
   UZK6W/PgDDbCMaGHYfIaPGWKg5g2bNm5d6zk4BdEdtPYQylrpmRCJDqcj
   FMiJbTXXE0yOktyl5XvTy8Uxc9O9+SORpwRZcO0kh1YLseat31i44HX4E
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IxZho07Rll2YSGepH2CpjA7ZrHnGW7+Wu9e/OZtqDVRSaxmQn0bGbK/W6ayDVqigq3Jh0Lu57R
 9JXjGwU9Wm36KtXNzW2LDhOpsI82XIgTsOs+DZfNGa1DUj4dd670f3rtVOKindecrjilAKs+F8
 FERkUavgfquhbFZZYLSa6mhtCQ1g2E8uk8zkh4hUxemm/vTlMULR1eCnhsI2jxwxy3YEEEEW+V
 nQ9pM4KSqub1Dh0eV/SH5MmXLBLOYRVI6OdCMFOMZKuvbJNkqX5p6yFY77Vrlp/lfh6MQxZ5zr
 qjRIa2WlXFi0uTDblZeESA09
X-SBRS: 5.1
X-MesageID: 55481363
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vtlYPK9i9Qu8dkPbdwnZDrUDW3mTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zEYUDqBMvuDMWWkedglPojk9kJXsZTcx4BqQAJr/i88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh61
 9FpmN+pdz4pO6j2yc5MTDcJCHhHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgWtg35sQRp4yY
 eJCVzxKaSzbZidwFXwoIsNgne6BokbgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHWbujoxGMNuKu0/7Tvc4PvLzVeCX1FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjtYXZNfAfucQdBFFFfu4Cy/+nfmzqWFo47eJNZmOEZDt0ZL
 9qilyM5m6kIxfAC06G27DgraBr9+8CXEGbZCujRN19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmoieBY0Y5xYJWW4C
 KM2he+3zMUCVJdNRfQvC79d9uxwlfSwfTgbfqG8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLaiO3aKrdNKcAliwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSevxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:hTvxHKtBDPbmwiT4hmtUXel37skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55481363"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW/uT6dmkwzQDh6hjUhqfiig3JhtGY5wtF0NpnKCZP28jxnaYC5UePQIlGSlTuXBTPQ2ptrTO7aM0FMLiU/VCUg4G95SrlpkJdCixeApDVBkf5RSbAX9VKNnvXkl1jiq2PaDsizP7Z+QyXihbmwkOHhRHjNG1QtY83Ns4c4SB7ea+UQ3SLP54i34ePwz5PKS1sdqZMq1YbESM5ef7oZRIG57bCHi7GiY2slkaR/LwpUgqRSRcQSsu6sbVZDPCtpRqp4f9bVwvOabRPrsZavVPpoTcm6LeXwRcZ7Egu2rO8swkj4xG+rEZgwptCAdbF5JRYi4pqiwSfkwEceAI9o0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY/D0QMVjGS3U/WUIUrBzOE/lhuGLCxFMHpuPHZlzIw=;
 b=YghZxlXQgzmxdshfeC3cCKgJBX9op12tRdQEReGt3poofEdV8OVOHox2LpQPhARB5JHLeQGTXWCeEjFkId7M+lg63PvrKOMvaWSQ4cGSeVrF5V8Qi32E1DSl96M5BoB3XhxyqYQahUFUnSmOAg2CYXDqEnfPDVS9ECv+stGgifsGnBzlLTZCxLukvkognDzDq1Y4wCgVpp5jWjf7wTdaC5CmoSbuXtlpDEJZW9DLDBgx381MNLyeCccPziFL55RHqKqNHENvs4XercEd+ti9CUZG7oLpltK9Zpvj4C105WBNaD8XEvMXBzs7+6FhGYkyGt2d6PZiTcBNgGb7RSaAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TY/D0QMVjGS3U/WUIUrBzOE/lhuGLCxFMHpuPHZlzIw=;
 b=ddR8ymQcoKYQLrPkAJ2SpAtVeGvLTpgcGO2KDLLaLmP5VHuxLaZekGzx1HTpgjkfcFn+IexID2Ne4KlhEeT/C9NvYTEPtv3nDgEpA1z+Bt6t26aDbQwAniQdkns/9PxhHQ4OnQQx1s9lizSr7Ln7HU0ecXpvodxBlt5zmXoojtA=
Date: Mon, 18 Oct 2021 17:41:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86/PV: replace assertions in '0' debug key stack
 dumping
Message-ID: <YW2VwAz9L1IRPHjK@MacBook-Air-de-Roger.local>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
 <5ab88195-660e-5d73-cc34-67734ae161fa@suse.com>
 <YW2EJaZ4DoR6ptp1@MacBook-Air-de-Roger.local>
 <1a9b77bc-3637-e1c0-4a8e-63126e643aba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a9b77bc-3637-e1c0-4a8e-63126e643aba@suse.com>
X-ClientProxiedBy: LO4P123CA0265.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f216ec7-f83e-4265-bfb4-08d9924dd18b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB44768A6E06844BB9FE8168688FBC9@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RBh7LZp1I+/40nRbwxLfAyLquUff7wvh8EMQj8xYr7ZxtjOuFlYBmWxdaLkjeEhOPweRaES5VXzfIIDJ693YVbxzNvZ7VkjFzljAR8evAS2EdkKB5c7UVFHjjmE8F9x3ahMK8aZsigUwetJn0cx4Cj+VisNQzOFvbKM9MIXnUJGkPfpEkoad1It/ZXV7bQ5wdP2r01LWCNJEOyKdOXbmfRY50rTKU/wwpB4oF5RZkxBWfUHXDGUiKxlBtAvYdlHHDGrlYtfnimgYrsQ1aYF0wDffPpxYhEA3h74L1nbLliZN7rDVSES5X2Vvc8e5lkEican26kVOhLnEv11vTwMSeSd9dU69q0LREPWXs1ABxzDNW8sTpHuLitFifgaqi8etuJ7sDdRLsMin5CgDA2yxqB/CY0lGnXRME9PbPw645pTnWvcUhmPKoZldRidhBQO2uv0+hyMUxjpngv9LYkC8WX5SRQriRy46lJ4Iz9vbZegTBp7KqPPafm359ijMDwYKUChS4XKridNlDcThJGT11wzZuODhIKnmfkpD58kWR0JuL5rdMRymVJlt+X3tuy3gRytw9OgI0YZynP2g18ecHVumzAvs7Fm+d5IN+1wL2+YlDr+ACAa6JiSjhKLknL+/tJAHY+N5E9S3mFeVZ5rOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8676002)(26005)(66946007)(54906003)(8936002)(2906002)(5660300002)(6916009)(186003)(6496006)(85182001)(6486002)(956004)(53546011)(508600001)(9686003)(6666004)(66476007)(82960400001)(66556008)(4326008)(86362001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JYRzlHWmt0WXdKQU1uUlphRkhFVmxDVFJjWCs2STlNelA1bGpmNjVjSllC?=
 =?utf-8?B?M2U0KzBtUDRJcENiUU1ZYmNrMGFZeE45NU1GdXdxd2t6RzVqeFJzWSsvZjQ5?=
 =?utf-8?B?OVNKbVV0anVrcjhNbFlMUC9EUmlKb0FDYmF2d29JdVFIVzE4NG5NenZ2MVE1?=
 =?utf-8?B?aFduREJ0bUVMUDkyNm9UaU1GZWtoK1Y1eHl2L0JwRmpHZkttQkxUT2o5bm1y?=
 =?utf-8?B?TVRzVmZLaTVhOEhLUGUvYVhIazJFNGN2MnROUjVLdmVsQmZqQVdBaTlJWXdm?=
 =?utf-8?B?OFpvRDZKU0lITU9PRm5Ua2dRenNobHVVc2hyeVNkS3JCQXVvTm5BSzkvVzdQ?=
 =?utf-8?B?aVZXVjBUN0QwMVRnb0NOVWdpZW53VnplVkRYR2xtUk1QM2piaTVJakUzdW92?=
 =?utf-8?B?SlhSS2dTTWphN2pxUlJqSS9teU9MS29YTUc2V1ZLWWk4WnVHdnRkdVB6czIx?=
 =?utf-8?B?dS80OVVrZmtLZmRUZ2hvRWcrUEF2cGY3KzNoVnFnekVndHlTYjBhaGdlZDA4?=
 =?utf-8?B?dmlyZmgvMDRMYk1RbXlwMzN2V1RTYWlXc1dEZkZ0aFZXRU5hb3paeUZMekcx?=
 =?utf-8?B?cXNyaDhVSzNuVzdPUWQwVmg3d2lRSUNkNFluQ2NmdUNhS1F3MHMrRlBXd3lz?=
 =?utf-8?B?Q2RWdVR3VmFMdzZyWEpXVXEzdThsNlIzZEIxUjFpRitqa3RJcDNZR2QrYUxZ?=
 =?utf-8?B?ZTFhK3VxZW5oQ2V4TmpNQmkvQ1E2a3JSaFpEREhyR2p4a0I4dzJJejV6NjN2?=
 =?utf-8?B?QmRWS3VTekxTTS9LYkdKS2hXckFBTGdqOTdGdFhTMkUrUnM5RUlqVDNTdmt2?=
 =?utf-8?B?STZzMm45R1FiL0ZZMStFQ1BKQTdoK3BpaFhwNU8rNlhyTXZET1lpeS8yVGdI?=
 =?utf-8?B?cDFrcE5RNDFPMWpaVnpRNmtTdUVaNWdtQkhpZlBDZXlRR09iOHo5VGhwMnp0?=
 =?utf-8?B?amMzTXpiS1F4cG5oUnZ4RkVQV3RSRHA5T3d5SEZKdm9ldWVPakdndmpTUnln?=
 =?utf-8?B?NXRLU0lUZmI0UGN2anZYTnBsRjlhMFNjbHV1UEVzL1hmMWI1em9McWl1Rllp?=
 =?utf-8?B?dElQZWRISXU3S0RJdlR3M0k5c2s2WjBUMndCRXBGWHBXZzhiRGFuN28va3o3?=
 =?utf-8?B?a1A0WllqeGR3K2plUjhnKzBGcUFpQThHQ3o4LzdNNVFEeVVneVl4VGJTS0la?=
 =?utf-8?B?dXVWL0hhWXF1TXRkeXhObW44WXFJUGo0c294dk1WVUU3U1ExeFg5ZzNpckN3?=
 =?utf-8?B?R3J5bnJJeUFjU3dWQ0JWRlFJT1Roc0hSaTBFbGpEbHhLUFNtYTNLL0NwSTFD?=
 =?utf-8?B?Tk52VkVneWgxTmY0NGxGSjFmR3Q5aks3bHI4M0xHL2JBM1hIYXVxZE81cGdR?=
 =?utf-8?B?YzU0TjVEcmdDdWRlUTh6RlorRnRQbW1rR0UyTjdiaGdDMWF6a2Nhdm42bnBT?=
 =?utf-8?B?Y1pyeVVUSjEwVVNXajFKZktTR3EwREdudEZhZFJBeUJBeDVHWWhzb1VJOERl?=
 =?utf-8?B?YS9xb2xZcVZOaEtmUEpVbnBhMGlNWDBUQUFYejNWTGs1b3hUNksveVk0NWYw?=
 =?utf-8?B?YXRaSEZwWWl2bURJL2c0ZitFdW9WK253R1ZTdG1qcXZUTkh6ZVhILzRvSE5t?=
 =?utf-8?B?MzExNTFlRzRJQ0QzWm5XbitHTFJsMHBJUUI0NmozUHJRQTNESnQ3Q3lQanhK?=
 =?utf-8?B?KzVDWXJGOHlreFV4RGFSY2FINHgvMWhQK2FqZG85ejJ3WCtsdnJ3cHNjcWh0?=
 =?utf-8?Q?TAdrPLu9OIWFOOoU6/F3oVrB/5674VMseOigy1Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f216ec7-f83e-4265-bfb4-08d9924dd18b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 15:41:57.7789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZXj6IxURiXZibqI6BKa0YHsWZ/+EMR499qCfyUX7SoJgPl3rTjSaa8+oZoaLPYruf+BRlN7su6Dg3Rob344dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 04:37:27PM +0200, Jan Beulich wrote:
> On 18.10.2021 16:26, Roger Pau Monné wrote:
> > On Wed, Sep 29, 2021 at 11:42:54AM +0200, Jan Beulich wrote:
> >> While it was me to add them, I'm afraid I don't see justification for
> >> the assertions: A vCPU may very well have got preempted while in user
> >> mode. Limit compat guest user mode stack dumps to the containing page
> >> (like is done when using do_page_walk()), and suppress their dumping
> >> altogether for 64-bit Dom0.
> > 
> > I'm slightly lost by this last sentence...
> > 
> >> @@ -328,7 +329,12 @@ static void show_guest_stack(struct vcpu
> >>      {
> >>          struct vcpu *vcpu;
> >>  
> >> -        ASSERT(guest_kernel_mode(v, regs));
> >> +        if ( !guest_kernel_mode(v, regs) )
> >> +        {
> >> +            printk("User mode stack\n");
> >> +            return;
> >> +        }
> > 
> > ...as you seem to unconditionally prevent the dump regardless of
> > whether it's dom0 or domU as long as it's not a kernel stack?
> 
> Well, Dom0 comes into play by way of me talking about debug key '0'.
> I've replaced "Dom0" by "domains" in the sentence.

Thanks, with that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> > I assume when running in PV 64bit mode user-space could be executing a
> > 32bit program and hence Xen could then misprint the stack as a 64bit
> > one?
> 
> That's not a primary concern, I would think. The real problem is
> do_page_walk() doing
> 
>     unsigned long mfn = pagetable_get_pfn(v->arch.guest_table);
> 
> first thing: No consideration of guest user mode here at all. And
> I didn't want to teach it without real need.

Oh, indeed. It would need to use guest_table_user at least.

Roger.

