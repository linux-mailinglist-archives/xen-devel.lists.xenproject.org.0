Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F14E6699
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 17:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294460.500738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPwF-0004R5-TY; Thu, 24 Mar 2022 16:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294460.500738; Thu, 24 Mar 2022 16:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPwF-0004Ok-Qa; Thu, 24 Mar 2022 16:03:51 +0000
Received: by outflank-mailman (input) for mailman id 294460;
 Thu, 24 Mar 2022 16:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7/3=UD=citrix.com=prvs=07544547a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXPwF-0004Oe-6O
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 16:03:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd441c5c-ab8b-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 17:03:49 +0100 (CET)
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
X-Inumbo-ID: fd441c5c-ab8b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648137829;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=McTTNOVvj7D4HBBu+A+M53kALxFUjoKv1zerWt+0Wq8=;
  b=VvXJHEN/GgtxjW9owv+4xhh0eFO4FMiC29PFevcV0y6dbsfjry9Vh+If
   o6prr6pfPF9t0Zb86NFDD41IMVcpN4WtFar+DsheTfaVoBXNG213bE+3i
   QhDRwcrr1X/DXn1TrXnRDDEGP0shQnXJP8aceP43IF+KBRVikcdRwDWXI
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67485035
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1rpXqqkaikyBr6+ECEoSUq/o5gwpJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWWnQP/bfNmPzcot/YNmwpxgC78Dcx4dhS1RqrCswESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYdzkTJLLtsvomXRBgKjtDGoJDqKHlLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6mCN
 5dBMmcHgBLoICFyZXcZN7gEgOKn1mf/XTd5qUirqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PKaj6vdgjVmXx2oSIB4bT122pb++kEHWc8pHK
 lYf8y4np7Ua/k23QtTzUhu0rWTCtRkZM/JZEvYz6QWE4qDV/wqUCGUCQjNbLtchsaceWTUv3
 0TPm97vCi1itJWUT26Q8vGfqjbaETQcKGYZTTMHSQYD7MjupMc4iRenZsZuFuu5g8P4HRn0w
 iuWt24uirMLl8kJ2q6nu1fdjFqEhLfTSRUuzh7KRW/j5QR8DKa6Y6S45F6d6uxPRLt1VXHY4
 iJCwZLHqrlTU9fdz0RhXdnhApmX2cyfLxz2n2VhFqEY7QmK1HvzY6JftWQWyFhSDu4IfjrgY
 Un2sAxX5YNOMHbCUZKbc75dGOxxk/G+SI2NuuT8K4MXP8MvLFPvEDRGPxb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjOL2iJ29E+5t3L6yggYRtvzsTOL9q
 Yo3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99W6ePmeN6JdQ4z8y5c9skG
 FnnCie0L3Kl2BX6xfiiMCg/ONsDo74hxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXQnKVb1GQkjMSVlC0r3dm4+venZZWn
 oBMISuHHstZG1UzVpq+hTDG5wrZgEXxUdlaBiPgCtJSZF/t4M5tLSnwheUwOMYCNVPIwT7y6
 upcKU5wSTXly2PtzOT0uA==
IronPort-HdrOrdr: A9a23:FugS2qoVN5YbA+ARBUpeFAgaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,207,1643691600"; 
   d="scan'208";a="67485035"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNkJnap8zEGtcKIxOaYdaQKO5tziKh6eHwZlHBjcZWKK4BN70XveIbi+HHXkie5B2/D154h6Q6UBgkrOnosOSj7sScOYN40RVPTzjiqVFG/ce28S2yJJajzRIkyM0lWErBxjlqs31U55TNfICnnU5FzKagqzloKx7gjv9iHRKnc2ClpAM51JNpp9NRtA5H35cZ7a8ZqTe3WXesRfBcnQnjXMa9tDHnIzhyIttjez189dh1yj+wSiqyG6qFjDN7xjKlOs8GJCx+jVgKaaVGTwKukKMWUKNE3b8JkcU3OgqE7MIoVIo1g+mg3qqUWTojuRvY0V62JC9c+w+Eeesjskag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w00+vhwkz7fVWxJnF+7uzRkfpfCsrkT3eJtQM+05+5A=;
 b=cGeGA7phN7olsL79Z4q111LNxQ5D9hd0hL/XbKjdkid8kbpHOB2hVy46v5l7nQynzah6Tfpd6o+zkQLxheFie1wEOrz5TubqbpWgILXZhRsd15EPmOA7sxpy8v95lpKkZfOp27FfYVz7J6P4aqp/gTYEoNbt6VZPPMVrnHcYNk/oOAjkOo6JqyuVPwgXNd84DH03Hyzdu67Riea4ttpD2Qo+uS9Wh6BSDabynOByso6cBK6HDOIOrswRRdIuR6I40rYkqtNkRP+HaWKP5bNy8J/5To0xY0Kqt/+TP9cMrx49+dMAeenoL0Al4PBX9upSI6e5Jc+Bs7wRG7LTn2sTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w00+vhwkz7fVWxJnF+7uzRkfpfCsrkT3eJtQM+05+5A=;
 b=IsBrdTr9lSX0T5N0Mf1Af2+4Ly1jPbPyWghg0iu4qMG/Y0CU6WwbNlb3pOgvV+1to8PrnuagcUJ9CdbhTb7ekCIaU0Nl9HZBYYvNDCrViSHW53xhyZJXbPdnhIuF3zu7jpIMIWfvrjg6kUi2L/SxtaucnR5UbM/4vOJb6/D7gRc=
Date: Thu, 24 Mar 2022 17:03:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
Message-ID: <YjyWW2CkQv1ckvXM@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger>
 <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f681af-819a-4ae2-4b73-08da0dafde3d
X-MS-TrafficTypeDiagnostic: BN6PR03MB2962:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2962CE199F1DC27C72B97CE48F199@BN6PR03MB2962.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Re6npOiZ73+0GvKltgjYBQ+fZHUuT2UUkIX8QrLILpdbDS700NWrYQwgiM9LxM9xisvQ6+CAc2M9Os9B5jrAmrbvCPRbgKVbc5QWJqVhni5fQHDV2nvwSC9G4yuBBk2yUtcMaygs3NAH5I4rfixPFlGibG/4GfhM8uD4mF1YY6QWL69NwoJXyJV6zl4Oml+PuU/2EHPdTgMMyzSo+YYreVZo6jn5E/LTM19WY0J7H7k7haisR2PKij+7XgTavp7wGSt+xq/9RMTGMO+HsxiseesQrXcBMzB2p39RTAFVOoRA5HyCB1IoXT2oO/vIhjtGqv3C7VVB7afQFCQ4DOAISTTuB93WXnE9EnlFKiLPac6dShsFqqsy4SzEJHxY/L1ZKU+A52vneQVlWXvtLJoRTu2w6j4frcde40fVXoZILaacjNlDvrwXKfZOraLeeS+m4JsQUo2Yp457VwkzO9LZBRpnJVu9OzZ8DFTgK2S80wuoUuNeSBIh38S6VdTwS1d1ewDxx37A58VP5nB3AbjlMPWntRV39XVVfGwmhr7IeBjP7dh9NvafSRidvU49e3d80sS0SObZ0L5Whcyw4V9NV8+h4C5rM26BHJuD2rTYJ77QGq/Xwau0ft3DKUFxsJmYMjhzrDTzYbCc7r75LCdrXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(53546011)(66946007)(66476007)(38100700002)(66556008)(8676002)(4326008)(33716001)(6506007)(6486002)(86362001)(6666004)(186003)(26005)(6512007)(54906003)(6916009)(9686003)(508600001)(83380400001)(82960400001)(5660300002)(85182001)(8936002)(2906002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NWaEgvZzNTVFFOcURybzdaa0xtWmdFSHkyTmFDb3BVdU1KeEpxUkZpTW8w?=
 =?utf-8?B?dnJ1YmNGK1hoMi8wOUFjL25WakN5UlhDR0V1Sk5ubmxiS0FqYjEvK2ZiUjV0?=
 =?utf-8?B?TWljdVpZYUlmZFBla1RrYnlaM05mdnkrUXlUWVJuYmNZdWtZV3gxVWdDQnR6?=
 =?utf-8?B?S1pWbXN0K1J0NjEzbWxRK1FXRzhvSlVKTzkvclZSZ2NvRnpYOXBtUWlzbGZP?=
 =?utf-8?B?NjVtNDIrZFFSR3hIenQ3MVRvTU96am1KaFc5Z0N4a0tUREpsZTJmU2RyWER5?=
 =?utf-8?B?M3NodnUrUEtHVjZsSk1sRkJlWXhzR21nMjdQc0FLMGxPV1ZIMHZOOW1YdVdX?=
 =?utf-8?B?b1c0NGd4RGpsZG9BdjJzNDNUVzNBWE92S0g2K2RWUS9maUFNQTRqSkV6OWxp?=
 =?utf-8?B?U3lycitGb0lTRm9OOEc5ZVliODB2UFRNVnZ5U2gxRlYxSDVsaWZXczhiR05F?=
 =?utf-8?B?N3JZNHZxMGt4VHJ0RDk2aDVJQUY2KzdkNjJLbzIzVGRSMDZjYkc0S3RndWx2?=
 =?utf-8?B?aXJVQWZQZG5RSWZoV21Fa0J3OTJqY0ROYXBNYVZUVUpXbGFwZzQ1VnRVOUlU?=
 =?utf-8?B?UnZzeWJQYVBTaUpidzlRcGY1SncvU1pQTGl0MkpLODhweDZlZ2JmWEhPME5D?=
 =?utf-8?B?NU1FRWdXRXZqajlYNUpZRGNRT3pEekhidXd0NjlEQ243bVhrdTJYT3ZLRWFY?=
 =?utf-8?B?NzBJSGtKSkxMWWE5Z1ZaM2E5MDk2ZEZFTS9xVWdkRE5qTzV6WjlOUEtmWk8w?=
 =?utf-8?B?NzhnOFYzMmVkSzJvQkVJUlJFMTBLS3IvcXJSUkc0OXV4cnJGVGpJZVJWK3RH?=
 =?utf-8?B?REdnNnc0dEN6V2l0WlNueDlRL05obm5KUlAvS2tjRmRGNldaWG0veWxkTmJp?=
 =?utf-8?B?RkJaeTdVVTNwUC9PQ0dnZjJ6ZE9EM2xOb0JUKzBOZ1NSQkdZMHZqWE15UUh5?=
 =?utf-8?B?Z0dkUjVQZEZydlZmYXhEanJMRG9oTWNBdzFaTEl1dXdZaWVsNnpWeUN2V3B0?=
 =?utf-8?B?bGpIWk9OZUQwdHAwWVBDYzRnZUJIQ1p0ekJPczdCT2pDQWJUbndBTm52dFNE?=
 =?utf-8?B?b0gvWDM5dW13SUovNnkxcWxHR0l0d0tkQjVNeDNSa2VjODgyRy9PSGJMK1Jv?=
 =?utf-8?B?THNzeG1CRkc1dC90SVVnYzV4V1RqV2FOUzBndit1d3ZjU3F6ZWNma014cjlE?=
 =?utf-8?B?ajdtVWJHN0p4eUUwdy9CM0RBZ1BOWndtL1h1bDQ0T1RUeVZKQldLMFAyTUY1?=
 =?utf-8?B?VnVKTXM1SnBGSWhONmhuWlN0M1NoTy9jWlZQZUszK3hFd0l1MTZORDVxOVFL?=
 =?utf-8?B?Y3pTU3VJOXV1dVIzUWNZbE90V284aEx4MWFPdExCWUF3WllxT0Z4bTlCRTky?=
 =?utf-8?B?NzdPWXdvN2lMLy9rYjU5MXhlMS9odmU4bUFXUDdqa3Ayd1h4cjk5eFdGbFRy?=
 =?utf-8?B?RUlpMytNZVVUQTUyOGh4U0sra2tHUGFqYVNyME42aXBZWWZHWGxWbzUwZTdv?=
 =?utf-8?B?YUNiSzFoTFU2V29sQ2V0azRyWTZvZmZnTVpwZW5MbjVRY280ekpZTXpUSWVU?=
 =?utf-8?B?TTBFNEphL3pYNUFLK0Z0dWplTmJCaW4vYXpDWHdhcHE5aWNtTU9ERjdhMFZY?=
 =?utf-8?B?RXp4V0NvL3dBbk1PZnQxdURpVlc4UjV4bElvR01LOURtNlNKRnVzVUd0eUh0?=
 =?utf-8?B?YnI2RlAyZDNKaEdVSnlCMGEwMmp5T2Mzc0FORzNkeXdHYTY1Mmx2Rk9oUU13?=
 =?utf-8?B?N0VOSTRwbkJwUTViZ1ViTnQ3cmx2OTk4RW1LSTRVWXJpb1FVTzhmck1OZkFa?=
 =?utf-8?B?M3Z6R0NDbmNpWkxNa3lMZllGaHNkdGwxZHliZWE3TkZIekdKV3pCdGdLWG02?=
 =?utf-8?B?RVhYME5HL29lYlhTaUx3ZHVRWkw5QUVHK01zZmJ5M0FtcHZIekUrT0I0OWlp?=
 =?utf-8?B?YlZhNURnbWF1QXJKajUzdXpHa3BqaHBCd3k2cDg2Z2JEbGJiZmFVOXAvcmhi?=
 =?utf-8?B?TThBZ2MwWUhSQmE2dlp1TUo1aXRaYTZDYkQ5cFJEakR1N2FycWJ1djkrSjJY?=
 =?utf-8?B?b2JuN1pyMjhVdWt4OXduVDgxZTZyTElnaGF0enJYV3dTVzFkaHdySDczVnM0?=
 =?utf-8?B?UUNXTkxEL1R0c2ljUytSTnNEeVNETTdVc084M1hpMXJwVVFMUnNxVG1TZ3ov?=
 =?utf-8?B?c0lEQ3MxQXNuSEk3anc3Um9HMHZFR29hMG54ZUl3S1BKSEpXU1MzMnlEbUNw?=
 =?utf-8?B?VVg4TThWaVRwdGlOOHpPaENiNzBNcmxDc3AzOUNsalNJdXdSeHpKdUdhQzk2?=
 =?utf-8?B?V3RFMWdQcnR0NlR2Z2loa3JtVmlyVncyVWxvRDRYMWdGTkZYRytLbnVPeXd2?=
 =?utf-8?Q?YcIcwdkudyUlgCCI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f681af-819a-4ae2-4b73-08da0dafde3d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 16:03:42.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzedQLVMjym8pkKtNUdJuT9YbOQqBwNamTBHvPykQYeHmAHw7IKb154+fYY4sr0bzCeD1iIuJeokQnEPeJhpHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2962
X-OriginatorOrg: citrix.com

On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel wrote:
> On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> > > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > > index 208d8dcbd9..30ce23c5a7 100644
> > > --- a/xen/include/public/memory.h
> > > +++ b/xen/include/public/memory.h
> > > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> > >                  uint32_t gref;     /* IN: gref to debug         */
> > >              } u;
> > >          } debug;
> > > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > > +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> > >              domid_t parent_domain;        /* IN: parent's domain id */
> > >  /* These flags only makes sense for short-lived forks */
> > >  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> > >  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> > >  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> > > +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> > > +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
> > >              uint16_t flags;               /* IN: optional settings */
> > >              uint32_t pad;                 /* Must be set to 0 */
> > >          } fork;
> > > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> > > index bb003d21d0..81c2ee28cc 100644
> > > --- a/xen/include/public/vm_event.h
> > > +++ b/xen/include/public/vm_event.h
> > > @@ -127,6 +127,14 @@
> > >   * Reset the vmtrace buffer (if vmtrace is enabled)
> > >   */
> > >  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> > > +/*
> > > + * Reset the VM state (if VM is fork)
> > > + */
> > > +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> > > +/*
> > > + * Remove unshared entried from physmap (if VM is fork)
> > > + */
> > > +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
> >
> > I'm confused about why two different interfaces are added to do this
> > kind of selective resets, one to vm_event and one to xenmem_fork?
> >
> > I thin k the natural place for the option to live would be
> > XENMEM_FORK?
> 
> Yes, that's the natural place for it. But we are adding it to both for
> a reason. In our use-case the reset operation will happen after a
> vm_event is received to which we already must send a reply. Setting
> the flag on the vm_event reply saves us having to issue an extra memop
> hypercall afterwards.

Can you do a multicall and batch both operations in a single
hypercall?

That would seem more natural than adding duplicated interfaces.

Thanks, Roger.

