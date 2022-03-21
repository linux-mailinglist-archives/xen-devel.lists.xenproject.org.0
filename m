Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE394E23AD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 10:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292844.497324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWEkc-0000nA-PX; Mon, 21 Mar 2022 09:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292844.497324; Mon, 21 Mar 2022 09:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWEkc-0000l4-LZ; Mon, 21 Mar 2022 09:54:58 +0000
Received: by outflank-mailman (input) for mailman id 292844;
 Mon, 21 Mar 2022 09:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaY=UA=citrix.com=prvs=07205606a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWEkb-0000ky-SA
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 09:54:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f50e0e09-a8fc-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 10:54:55 +0100 (CET)
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
X-Inumbo-ID: f50e0e09-a8fc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647856495;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o5gvo0WpTiObXSAwcQvUuMS6gGkOEiiLhzfmBLJxljg=;
  b=YXf60LBPnhSYN2qx7mE4WwNsFKKICHTxSY9+uyhJRm1UoyZNZC5JSpxH
   74RxB/21hSr0ebU0sLfVBJSJlN4YKc9Ve8UX6clW5iFV50EwqQxoNpkXb
   Nh+e94SDtyMGAxKWjzfXrl4/rB2fgmDwdQ3UFZ5Lhga59z6d6vT90nXKy
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67147516
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4ImSfaCbPYFy/RVW/wLjw5YqxClBgxIJ4kV8jS/XYbTApDJ23zUFy
 mAWWTiPPfqMZWqkeo8gYdzn9hgPv8KDmoNhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhT+
 dNftZOvQj4bAZDtlOMxTEgFLyBHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg25s2Z0XQ54yY
 eJBRSVLYkueTiZUFUlJKqkvseC0gmDWJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMOb4SqI9DSrnOCntSHmXIMfEpWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+yrWOAvxUcc8FNCOB84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvLNDp9sLKKQkuvyYq1oTSeJnlIEW47MHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQerBCxWtamS0bbtT834JrWjFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztVJRzlfG5RY2+B5g4i+aihbArKWe6ENxGPxbMjwgBbmBy+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbYe1s4Qj59U6GNqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937xs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:Vj/Zk6BEQZnPrz7lHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="67147516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmfN7bjtk9km6m1J8ytupsC7yFC0PIZw753RMPHVRjyDW+ChsvBHh22jMqN6sozhjZyw9DzhjETIMZFMEbLB+YhV4XRWjJaw3uwBtw4puduPGqSeKHNHuoBlGC2jtyBDgFZvMvyHoxjm3V+483CxkDyzNpNdMcSNYR/DkHgMkyxqaBASd3/3wwwk2FBUE1iVC6Ii3hTGW9iq5dz1iJetlc5G6AYnB9POVNhKEZZLwhCoVZP0OfmWXCfkNaZVmb1Liqy947XTA2g2A/+gSMielKhzLjeGTwO8M8pBwiwptnKgyEBX/Rn34WZz1V80+5IMmJ2SA+q9bjKuCJXd0Jl0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGxpGz/5jcyAmpgTvIgBZY79YADEvb/wm6QO7uVsn7M=;
 b=ecQtAYj+aHDpyGbpUvXV9gLFlzdV4qJn5VKoi5A9cVxtuwwftm28TrCKFVb64u0qPgW5PyYuN1bPVMH8wrTOjnCHGoJIt/h6GNHMiAgL45axjkeQsjr2f98cRS3jDVcp9ZaO/qIH0c4LqOgTB6Htw3gKC10fbqgDlEwUFnEjIiUhdkZl0MPk86c8t7BVu44SFSf065L7tPT51x+MZhOtgeaRK9Mu98tmTKy3NIzYopK/2vTq07f8Qu9u3bDCBlEiPkb9hRZ0KoQntw8HQ98/t7xGlxUSb/T/UQl3MXA8TkY5e0kQTageyhdAgNMuDb+dykM4Mxk1La9t0rdZCRJ30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGxpGz/5jcyAmpgTvIgBZY79YADEvb/wm6QO7uVsn7M=;
 b=L9Rp7GbjNx/TvNxiKc+WEDAAtGecRBMgM8saz/KVPk7U3VA3qlTOR2fsDdLH/NKT2nONgYVwfbakUcc66hmLtQvZsWbRpvUzijtF1psw4WjEYqgi5uWnNbgx+2cbjU7U+vQpQHGmvE9AuxZfheA9mugfQp16lTtvCNGUNAmLAhc=
Date: Mon, 21 Mar 2022 10:54:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] codeql: add support for analyzing C, Python and Go
Message-ID: <YjhLY1Wb4HF39gIC@Air-de-Roger>
References: <20220307164552.74818-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220307164552.74818-1-roger.pau@citrix.com>
X-ClientProxiedBy: LO2P265CA0331.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c8ae615-189b-4d99-1e2b-08da0b20d68f
X-MS-TrafficTypeDiagnostic: BY5PR03MB5143:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB5143569FC399278F181F509C8F169@BY5PR03MB5143.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vy10hRcq1xWeTU07r/kY+BD9/KAGOH2EzaB+KyZizUEORCL73/kEXw2JE3JdImhxTzXUfUxv2HmbdfLtJ/3cjEu0NRV/1M4f4VFW+E/iodnA6vIstzHj/q4UVoYHq/p+Cd4Yrhdj4utMANKaQ/Qk/MmzK31DLy6z+t7M2FjvcyROh1tZyIjqF/mpbEzhza43XlBWuxABfrCo3lYm/qqiI7HHdAEgCoIF6ZsD1HLvPW93JI3TSiYUjSd2ZC+N2SJtEh9rTt8YK2Q2fKgnr/c2nDqQvjFyDlwO7i24zdMPx97YKAQAbpxAxRvST2aYozzYPo6GRj2Izq7A+s/NJ5VQAk4DcY0RxP8XVIpPUyEEmAcxugNoOR6b7zSYP2QYXVFY1RFBYduXNqeFxcPwO8tlFp4hPfej5Wl41Wh1cVyVew6NMN7tpgEg/HZLpJZXUARYvd39CDJjWwdJRpsB/KECXlln4wVEOM5eEjEhxmTCtMAvplTPHQxfxu3NGOMlej1WOCb66FIWtsKixR2VQww79TYNNFtEEOil9gz2ZvXxPWn/aX7iRXd2IyOZGkMMMJvyBNNBuUDHuhou0dTK8XyJvxaTbIvpkKo1eRSYoREGyrw9vIb4WoFz/Fla3w5N02Mm/lO+OVQpg8bo0JUI5c7h1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(83380400001)(2906002)(86362001)(9686003)(5660300002)(6666004)(6506007)(6512007)(82960400001)(8936002)(6916009)(38100700002)(316002)(54906003)(508600001)(66476007)(66556008)(66946007)(186003)(26005)(6486002)(4326008)(8676002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnlXWkQ1bWloMGNrRlhpSUY0b3FYVUhnUHo3RlBkTlJ6WGk2QWFER28xYjk4?=
 =?utf-8?B?dU9wT2FhOUNwY2d1V2ZFU0wwOWN5bmxreWlNeFhJZWV5ek9hajN6ZVNKZ3hp?=
 =?utf-8?B?UEV1Sk5qenI5NUZ0TUwwMlBQa2dGSmR6NjZRQU1QRko5RURCRXhueGFNMWdI?=
 =?utf-8?B?ejN0emoxN3NNbHFWUVhFbnNzYWFTcE9CNkRlL3BKZ0hKNG9GcDZQWVVMM1VU?=
 =?utf-8?B?My9uWm1Xak1kQzdXSnF4cVIrQjc4Ym1JeWNRV0E3YVR3bmRBZEZFUjA4Y2M1?=
 =?utf-8?B?a0ZjY3VmZWQ1VzRYNnZlVVc2aWM4NEZ5U2JhQkI3eDlCVVBtbSs0a2dNUTho?=
 =?utf-8?B?Vms1bmlOcnQyU3U4dW9FaWdyMTNiS2lWc1RzV0ViQ2hFVk04WHp1K0VYWHNL?=
 =?utf-8?B?S1hLNmIrRzlkems5SFk0RHdEeHFTc09JV2xSRGlHekhHL0RidDgwZ0tYaU5z?=
 =?utf-8?B?TU02L0JPUDlvcXhTd2xTeEkxb1BmMjZUdjU5S09SVXpacXI0WjBTT2wxekFs?=
 =?utf-8?B?SzdydzNBNXFDeHR4N0gvUHp4UzlYWG1FSkszS2ZFT2R4d2UxckxDWHAzemNm?=
 =?utf-8?B?Z3k4Z3RsalJicmJ2dGJnWTFWdFlSeUJVRWFRLy90QURBOEVJTk1pVGFiR1pM?=
 =?utf-8?B?NHNWMmZ0R0VJWGUvbnhHaWtKOERhRFVYSHBnUUlaTGJBbTBUdEFJcTdyZmFL?=
 =?utf-8?B?NzQyMUc5VysrRm0xcy9YT2Vza3U4elZzTENIUGZyckJrWEF1Ry9JWEMrNVRS?=
 =?utf-8?B?UW1zc1VKTkN0cmZ6TUkxOXdyMkcybjM2WXpZYU1HQW5zYkg1Qkt5R3IvcTkz?=
 =?utf-8?B?blorWmpTbTZjbFRjaWNGWnBNY2RPSHlOcncvbWlzMmVIaisra0tZZS9OcGdW?=
 =?utf-8?B?OXAxZmlUNzhaZ1N1eFltTUVBUElmMVVIL0l4QklURW5mU2JuczNna0hYNDJ5?=
 =?utf-8?B?TmswYkJZdWkxVFVGVTdhZ2kwNy9KT1UwN0xRdlgvL2l5ZW9mZk5oanlINW5X?=
 =?utf-8?B?MGF6V2pQR29KUk5jTzE4Ym80eXRHZWYwMzE3dEFmSFhKNERXTTlXcU4yZzBW?=
 =?utf-8?B?V0dpVG9aWVBZZjlrbkZ0VEprTDJLUFgyQnQyRkM1TEUvTmp4Rkl1bXA4TmFh?=
 =?utf-8?B?ZWo5clpBVDdSOVJQeGdXcWpzSEtZUXZKMnB0Vk5UNGk4VHBxYlZwdSt4SFky?=
 =?utf-8?B?em4rOUJkYUdpZ2RVajdiK0F1MGxrMGNIZUhqekw3TjI2MW8wMkF4UUlhVnVO?=
 =?utf-8?B?cnZqeSszc1NCVlpQYmw5TXJjVFFzenlqdmlEYWswYTRPZjgwYWZ4VkRvRjNB?=
 =?utf-8?B?TmgwQi9JQWhoTUp1a2h1RzNtaFd0aXAyT2VQZ2tUK2J2WWZiS3FYdnkwWi9W?=
 =?utf-8?B?bDM5aUpuRDNCYWVZeHY5dmUzUWFnTGtUMWlEd25ndHlZZGJBY0F1Y0F6TTN4?=
 =?utf-8?B?QkViRitBL3VsbHl3RjlrT1RJbkdCMFgzVnNOcVJmVzR5dG05UmhPaTdwbmFG?=
 =?utf-8?B?V0pXUGZoVUg4d1ZhUlVMTHBBM25FUUwvajJLOUhCbU53bFY3NEptNEZidXpp?=
 =?utf-8?B?aGJmUmdKTUFuUVZJa3RmWlBxRVY2aTdkSGJaaGs4UVFoOVgxbEJ0dXIwRHU0?=
 =?utf-8?B?bkpHQUF1dEhTNytXQWV4dFFaemFFU1pkbXEyU2Jic0h6bG5jelJId0ZKUzJT?=
 =?utf-8?B?SjdQdmpUK0tZWStkWXBza1F2alU4Y29hbWNyYUZpV3dXMmxFcCthZkgzSlhn?=
 =?utf-8?B?UHFSVlFkTU50UUQ4Mi9XYUFKNWJwbWJyRkJ1YTd5S0VaSEdPU0xRUjJUT0M0?=
 =?utf-8?B?WkRjVEFSU3lCVDNDQUZ0Qkh0SCtIK01LWWl3TGNSakFmL3RiSEJadk1nVXhi?=
 =?utf-8?B?RmZ1ME1TcjlSNkFkdFBIMHRYdFdCZ2JZR0JqM1FHcTBVRndCK0JKMjVYaEtl?=
 =?utf-8?Q?DibfXdIqWIc8XOg328pu3I4VHnSmbX8/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8ae615-189b-4d99-1e2b-08da0b20d68f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:54:49.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v4FzpgIvsqL1M1x5z4LJzVtJr0U4cN1UoHK7sqZPbBiHbmNDznR909wvxwHqy/BFXbBdR9mfEG7gfjV9Asxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5143
X-OriginatorOrg: citrix.com

Ping?

On Mon, Mar 07, 2022 at 05:45:52PM +0100, Roger Pau Monne wrote:
> Introduce CodeQL support for Xen and analyze the C, Python and Go
> files.
> 
> Note than when analyzing Python or Go we avoid building the hypervisor
> and only build the tools.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Rename to note it's x86 specific right now.
>  - Merge the ignored path patch.
> ---
> It's my understanding that we need to force the checkout action to
> fetch 'staging' branch, or else for the scheduled runs we would end up
> picking the current default branch (master).
> 
> Maybe we want to remove the scheduled action and just rely on pushes
> and manually triggered workflows?
> ---
>  .github/codeql/codeql-config.yml |  3 ++
>  .github/workflows/codeql-x86.yml | 60 ++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 .github/codeql/codeql-config.yml
>  create mode 100644 .github/workflows/codeql-x86.yml
> 
> diff --git a/.github/codeql/codeql-config.yml b/.github/codeql/codeql-config.yml
> new file mode 100644
> index 0000000000..721640c2a5
> --- /dev/null
> +++ b/.github/codeql/codeql-config.yml
> @@ -0,0 +1,3 @@
> +paths-ignore:
> +  - xen/tools/kconfig
> +  - tools/firmware/xen-dir/xen-root/xen/tools/kconfig
> diff --git a/.github/workflows/codeql-x86.yml b/.github/workflows/codeql-x86.yml
> new file mode 100644
> index 0000000000..a3ec6236c4
> --- /dev/null
> +++ b/.github/workflows/codeql-x86.yml
> @@ -0,0 +1,60 @@
> +name: CodeQL x86
> +
> +on:
> +  workflow_dispatch:
> +  push:
> +    branches: [staging]
> +  schedule:
> +    - cron: '18 10 * * WED,SUN' # Bi-weekly at 10:18 UTC
> +
> +jobs:
> +  analyse:
> +
> +    strategy:
> +      matrix:
> +        language: [ 'cpp', 'python', 'go' ]
> +
> +    runs-on: ubuntu-latest
> +
> +    steps:
> +    - name: Install build dependencies
> +      run: |
> +        sudo apt-get install -y wget git \
> +          libbz2-dev build-essential \
> +          zlib1g-dev libncurses5-dev iasl \
> +          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
> +          autoconf libtool liblzma-dev \
> +          python3-dev golang python-dev libsystemd-dev
> +
> +    - uses: actions/checkout@v2
> +      with:
> +        ref: staging
> +
> +    - name: Configure Xen
> +      run: |
> +        ./configure --with-system-qemu=/bin/true \
> +                    --with-system-seabios=/bin/true \
> +                    --with-system-ovmf=/bin/true
> +
> +    - name: Pre build stuff
> +      run: |
> +        make -j`nproc` mini-os-dir
> +
> +    - uses: github/codeql-action/init@v1
> +      with:
> +        config-file: ./.github/codeql/codeql-config.yml
> +        languages: ${{matrix.language}}
> +        queries: security-and-quality
> +
> +    - if: matrix.language == 'cpp'
> +      name: Full Build
> +      run: |
> +        make -j`nproc` build-xen build-tools
> +        make -j`nproc` -C extras/mini-os/
> +
> +    - if: matrix.language == 'python' || matrix.language == 'go'
> +      name: Tools Build
> +      run: |
> +        make -j`nproc` build-tools
> +
> +    - uses: github/codeql-action/analyze@v1
> -- 
> 2.34.1
> 

