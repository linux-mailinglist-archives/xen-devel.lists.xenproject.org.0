Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B43515B1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104561.200131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyW5-0006O2-5p; Thu, 01 Apr 2021 14:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104561.200131; Thu, 01 Apr 2021 14:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyW5-0006Nd-1t; Thu, 01 Apr 2021 14:41:49 +0000
Received: by outflank-mailman (input) for mailman id 104561;
 Thu, 01 Apr 2021 14:41:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRyW3-0006NY-D2
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:41:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f39dbf3d-bdac-4c02-a137-b50b724c5aea;
 Thu, 01 Apr 2021 14:41:46 +0000 (UTC)
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
X-Inumbo-ID: f39dbf3d-bdac-4c02-a137-b50b724c5aea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617288106;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/X2Hzn0CPcdcMW36/7RyKPJCS9nBRAhgqyqiVCc7d1U=;
  b=bmNIAMO/fG4bV7y/OUnnSgr5eEFmcqZMNlv6LK4MdmvwGY1oM/Lh630C
   d+qKqXnsgAJQJ2mycdbMpaycSV4IbqrruGbXHUkpUk+EuncdrJrEKj7lh
   FCV0rVDbWWyu4c/iKf6B5yhm760z2/PSaGOFBXwuAOz2lm/lP1MpK7+4g
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OmOanxswyiBeYzkZgXhdPixdxdUIhuiYcDszPZBaca1CgrtMsmGNnE5qxpxibWyVLl7xEiw+zN
 tjgjFSMk344gEVQlZzx/yvZGFL+SjSrc5RM8yM8ykIA/7LSMQOnKW8imxg8pXjacw/hp58Lv9l
 PjOyPIZmcI88aL7L46ZIen2P9Q5JULXMtz7VMUJ4MDOs7Ye71tkI4ErZ/shEPfCwza9h0Nndjp
 sU6CcGNpopRdRdq6FcY/MgCKnlMly50pn7NgW7P6GT+5qwLbrF/1fa1JshOt1HgV3LHNZ/pHx7
 N4M=
X-SBRS: 5.2
X-MesageID: 41083627
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Hmhh/qkRISdQzE4Hz/+EPcz1h+rpDfOcj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN9AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 1dWoBEIpnLAVB+5PyQ3CCRGdwt2cTC1aiui/vXwXsFd3ATV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsnfZvjTymZHgRc4CHHXEDRefOvJnmk5jhbB4ACXccmUOzpBmv76P3FAXd4wcGX1p0sPwf2E
 Xmsyi83KWstPmn1gTRvlW+0716kMbso+EzYPCkpdMSLlzX6zqARIMkYLGauSBwnefH0idSrP
 DpgzMNe/t+8GnQeGbdm2qh5yDF3Cw143HvjX+06EGTxvDRfz4xB8pfiY8xSHKwhCQdlepx36
 5R02WSu4A/N2KnoA3G+9PKWxt2/3DEwkYKrO8Jg3RTFasYZbNBxLZvmX99LZYaECr2rL0gCe
 llZfushsp+TFXyVRDkl1gq5ObpcmU4Hx+ATERHkNeSySJqkHdwyFZd7NADn18bnahNBKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SG1L6D6sKUki95aLf0fEQ3qWHaZYIxJw9lN
 DqS1VDr1M/fEroFImo0IBU9AvOBEGwRy7kxM0bx5URgMy8eJPbdQm4DHw+mcqppPsSRufBXe
 yoBZ5QC/j/aWT0H4JE2BD/RolSJXESXNZ9gKd5Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGDj/Tf8wrHyDazvdulz8Snntckvw8dZbC67B5dUez4ALK8lJuggRglKp+9GTJVR5w+kLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ilVWhLqw8MO0b9aq0CpN2bZGBX0BK8V19CZvKTND
 Qai0V8+KqxIZDV7zslEcibPmWTiGZWuGiHVI4GmqqI5d7sf5QxCppOYt00KSz7UzhO3Sp6om
 ZKbwEJAnLFHjT1kKO/kdg/H+fEbeRxhw+tPO9ZoX/Srl+nuMkqX3cXNgTeFvK/sEILfX50jk
 c027IDiLCA8AzfU1cXsaAdChlwT0i5RJhBFx+IYY1InKuDQnAMcU66wRqAix8yfWL28V41nW
 KJF1zZRdjCHkddtndE0qzj7VNzcSGHc1htb21h2LcNaVjuqzJ91/SGabG01HbUYlwewvsFOD
 WAejcKJBhyrurHoiK9iXKHFX88wI8pMfGYBLM/c6vL0nfFEvz9qYgWW/tV9o1iLtbgr6sCVv
 +eYRacKHf9B/ky0wKY4nYjNy8ckghSrdr4nBnk5nO/xngxHL7bJ0lnXagSJ5WE9Hf/Lsz4o6
 lRnJYwp6+9I2/xYtmJxeXeaCNCMArapSqzQ/szoZ5ZsKouvNJIbtDmeCqN0GsC0AQ1Lc/ymk
 9bWqh97bzbMoJkfsAZeUtijy8UvcXKKFFuvh39A+c4c11okmTSOMmR5aHU7bUoGU+MqWLLSB
 Gi2jwY++2AWSSN1bQXUf1tZWtXbVUx83Rk8qeJcZbKBACjauFE+x67PxaGAc5gYbnAHa9VqB
 Bwp8yMlauQcSHz3QjLpzt1Iq5U6Q+cMLGPKRPJHfQN6sCwPFSHn7Cj78GyhirmUDfTUTVnua
 RVMUgLKtlZgjYsjIcrwjG/R6z+rEUiiUZf61hc5y7Q85nj5nzaE0FAORDYhZsTXSA7CAn2sf
 j4
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41083627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onzlnr8I7O9M67fvOGY/bKshC+JpdakDZUfirwu0JVtKy3YgMeWvFADVND25oUF7aWu6HRVNejNnGAig8rVmP0aHp8O2p4Ml1ZK+mU70nXt/2VXILA6Tg5IDxHDRWfG3wVWCYJcFv+sACRwzYaarQNJ9FuxHpJGi7tvuq+720RIcFjfFdCEaAVmbe1fYwJtYbopPPtY+TDitXHl2+hwV/sOugz+Cvu9pYgTwuJxoid0FXdPfxLt7gL8jmSm3vxzgE7w0m1j8DwqP3airddzKTc0DcKH3PQWmrx6ZVgCC/pFn2JOUwW5qr5R26gUc5o79issRUDlz3JOXx4Ik/bTuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIBgrf8rWSxNvI4UbkFBbnOvBhTRTt+1mPDmdjgQG8U=;
 b=Re0IFBc9MLO39ckJWRsSDgVMVKJpYryrLKgBRZW2wgcw210P+TnVgnNoG3BRCe+fd/0V8P+YcjI6LIpV7Wg91KDVItjzst/BlrBqg4ZWkahJxEQOMTlkFt8yyoXGBTaDYWAzO+rMuDAdPFvldOui/K2MnToGArxu0Om4laspWKGKWXiB+/47ozk446cNiYe2jHq5bfL0Rmowle6GK7uEB/HbPmGitizOce0K2qVjcIetBBrch6EqeIX4EapUIWM/m+DCSqlwHEGmxMg4uq5ZoGukL4QZ+Vo7BXFh6SuBtq/r3VYhxu8JSyV1JmcZmwTzu9tBRJlaNlD8SkU8A5lu+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIBgrf8rWSxNvI4UbkFBbnOvBhTRTt+1mPDmdjgQG8U=;
 b=rddeDgrEBwWuNC/JbI6Q84qToonkpSAWgMOCvkEzcSp/WHIIVGt7tW7/NOt4rWIbxxZ/yUKa79MD0xs4wLOPtyGLrYQ8rBLaT5itdWCjYdUf9O6ppzPpuZAN7wFuCK3Q1zfxOyxKMcmIJDsuvJvELcbE0LUokMckbokeWOFvJug=
Date: Thu, 1 Apr 2021 16:41:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
Message-ID: <YGXboI1bAGcE67LT@Air-de-Roger>
References: <20210401102252.95196-1-roger.pau@citrix.com>
 <b8fcbe35-2c9d-fd8a-0200-90d9c1039a27@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8fcbe35-2c9d-fd8a-0200-90d9c1039a27@citrix.com>
X-ClientProxiedBy: MR2P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c3f9391-b398-4d43-2f60-08d8f51c43e3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4140E167F09B081EBA0297138F7B9@DM6PR03MB4140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9zIppC7hW8avchGJWVOpPbHjSG7FEC6OwmJTsAaS78cFo/G/rOuUNMW1q6oQtSlCwEFmuiMQxjTomqlX+xxCJheiDl86+kFLQSP0WMNXqN17ZwSLrZFTrH4hosOdlJglbClOT8RI7Yt9AWJL3LLS2f8mKRPyz2ZmdozrrHej7UdHuQuk+fEnPg+mv5ReW70AlZbHw/mjkk+U35ZeWxtYlewHkEGmpjKwhxiMV2z8J+WP4x0lh7OU4LvieZK7TZj98m9IuDtiPyp5UVbOUMqBbmoVoSJGZaWBBCg5dEvPCpOyqR7SoVqPCCYsRhYBoPi/HAI5nF3raR46ujXFQKcrI6qpP2RH11SWksgVVmSaZfVT8av99BGeQ4um5sAK4DUqT8sJt3daalLNHNi3qs7mXJL07PkdvbhBWZedx5iqRd0iAJVfXeBTOZyfQ6Oha3tD6Zm/zBbNcTLT9ClqQR+Tws8ogE+3PKt2ZCr5hCwfGP/QOe4Plkv4iF3EprkphdTTZZLTX9h6jipDPpxqdwjzq8Bp5Db6ZR3To4ULIDJVGP0RxGyIFZ7KK3iSrdzsBnEIs7aqo8A+0Ye99MDlU/cTZdeKUyMqIey7LJb1NuJx/0ynMe/XQVlTu/YwWdZaLTzYQzGGyzVbGybiBCnnsCJyx+OWGvn1W7chQ8EEP10+rkQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(346002)(136003)(366004)(39860400002)(6636002)(8936002)(16526019)(86362001)(83380400001)(54906003)(66476007)(66946007)(478600001)(2906002)(8676002)(6486002)(53546011)(6666004)(6496006)(4326008)(33716001)(5660300002)(85182001)(26005)(956004)(9686003)(186003)(38100700001)(66556008)(6862004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0RQNEFlczFUc1N4a1puY1FNaXoyTWpkSENtZlZ2NldFYytQVnVFa2hEYVh6?=
 =?utf-8?B?dGhGcDhnUmN3Q3B1V3AzUnB2TVNyejFkSSs5YnVmMGt4SWYwV2VENFBLbi91?=
 =?utf-8?B?eEk0YXN6SWY5NjZFSUwyUEFvdWVEWXROZFZLMTdsN1JZakJMTGk0N0VPUGR5?=
 =?utf-8?B?UDNZdWVpTmE5emZJYXVrMnRtWDU0Vit5WlBXemZiN214MXpSZFdtZmZiUytq?=
 =?utf-8?B?OHNCYVRLZkk2eHpzeG9kTXFkUkt0bjlDQ3YxL1drSkxURFBJOFYyUmFXTk9G?=
 =?utf-8?B?Z21lcDVIVGtENVowS2kvOVRjS25ZcG1YKzB4eVlsOFlPbnh2Zzh1bFB4cXMz?=
 =?utf-8?B?c0ozZjBCSFY4V1cvS1lIWXcycWV6dWZTZ0tNK0U2aHE3bmpPUzFsNUJkUzJB?=
 =?utf-8?B?UGtJR283MTllcmhNTWdVL1JzSmpFUFlYRWs4TTlNeW1RaHVUdnVLWFBYZ0tB?=
 =?utf-8?B?cXNFRyt6N2d3M3VhN3l5WDBHSkV3eWhkV0h6cEZ6ZWh1ZEtIa2crU3JFck5p?=
 =?utf-8?B?ZnBESVU2dVhieGt6cTJnVmNSTzI4UG8vWnF2MndIQnA0cVlYYjZ4MnlsR2tH?=
 =?utf-8?B?bTZtUDZIL3dDSk5JWXNNOFk1dXNvQ0QxNC84TlVWZHZDVjI1WUV4S2xUc0pu?=
 =?utf-8?B?dmE3dVhMOUZIRXY5dHRBVlFVbzIwOGNOK24xMjZXWnJ1bFhqdmNmUjZ4WG5u?=
 =?utf-8?B?ZFRZNFo4MXNBWnpFbSs5bnhCUFZmVHJWdHUxdENrREdwSURjQVZNamY1anpk?=
 =?utf-8?B?MTdSV09mRjgwMnJidjlhU0F3a25WOWUyNldEbnAyN01DRmhVQmZaRkR3U0lW?=
 =?utf-8?B?akxHQ1VIeUJCMm9oanJ1bVBmb2dHbzlNMDVsbzFqL250SmdrMmRWN3VRdUlp?=
 =?utf-8?B?c05xY0VxdDg0WnBzOTd2MmoxaElrUDUwOVVadlVuUXN4RXc1alBHSzNsRktU?=
 =?utf-8?B?VTV2NUhPQ2JlTDkvTDN6KzJZeURhcjB3TG1vYm5KeXhPd0hpTjJ6UGtkb283?=
 =?utf-8?B?cndCNGhnVTlEVWU2N1doVzBkakhuMTlTcWZZMmRWRDM1cEF0L0VkcDA1c1hK?=
 =?utf-8?B?cnBKTWw4WlRlOVJnTDc1VkI0MDVHbzU0RW51d0g1Q0JPV1FpaU5nNm52TERq?=
 =?utf-8?B?ZE44SjJvTHJlM1luT01LcFhMZjgvUkVwNlU3VWpDNEsrT3I1aEtkb2Fzd2xQ?=
 =?utf-8?B?ZURvLy9pbmZncjkwZ3Npd2k0THRGalBUZThUTk9UeUx5QUJZZVp6MEd0UFpY?=
 =?utf-8?B?aXZQRis1RCtlMitpbEphVThwaUJhZjRIUnp5WkZJVlVaNEc3T3ZCZGRrTGh1?=
 =?utf-8?B?S3V6OWZUOEpGY2N3UnRzWGsrUFpMZ2lzb1hKVktzUDNBajNNbGZEQmVnWnZI?=
 =?utf-8?B?dFQ0NFFFeGNWOEJVSmJERnhFSktDTXYxWTRwY21MbTN4elNUakZoQ1BZM2RK?=
 =?utf-8?B?OTZTUDVYd1NZazhzczJqZ0lDQ0xxbENQU3NSVnRIcDVrb01Jd3RZb2dlU0JE?=
 =?utf-8?B?TjI0SHE2UVdRekt5aE9RNGd4Qnl0K2s5VS9oSThGWXdLWWJ3T09rZUYvTlpw?=
 =?utf-8?B?d3d2NmpteHZqeVhxZWYvWHMvYUdFZzI1czVYSXdVSDd6SXlCUXBPTllIRk15?=
 =?utf-8?B?ZlZwRnhRQ1BpMWZWdG1MYStKQnUySm8xZTFyNFZYZVEwZUdqWkFZNmVLcCt1?=
 =?utf-8?B?YU9FUnV5dURCcVkwMy9GZ3lRR3lUMXcyZlFUamN4TkQ1K3RlYlB1U1EyUTJG?=
 =?utf-8?B?VEt1cXdrVTgvS1M3emxyeG9Ob1BpQmEva0l5Sk1KODRiWHkwQjdaSGVXdHRv?=
 =?utf-8?B?ekNWSHU3dnlLbWZkUVc4UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3f9391-b398-4d43-2f60-08d8f51c43e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:41:42.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZ1P7iL0e1pcEaPOlSW8onqgI87V1Fvi2LbHHFUSCHgNgu+TyI3GaapdPYMDd8v367e0P3HHqqJ3dx4hQJ+65A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4140
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 01:44:59PM +0100, Andrew Cooper wrote:
> On 01/04/2021 11:22, Roger Pau Monne wrote:
> > The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
> > as current, as there's no support for EOI'ing interrupts on a remote
> > vCPU.
> >
> > While there also turn the unconditional assert at the top of the
> > function into an error on non-debug builds.
> >
> > No functional change intended.
> >
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/viridian/synic.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> > index 22e2df27e5d..e18538c60a6 100644
> > --- a/xen/arch/x86/hvm/viridian/synic.c
> > +++ b/xen/arch/x86/hvm/viridian/synic.c
> > @@ -79,11 +79,20 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
> >      struct viridian_vcpu *vv = v->arch.hvm.viridian;
> >      struct domain *d = v->domain;
> >  
> > -    ASSERT(v == current || !v->is_running);
> > +    if ( v != current && v->is_running )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return X86EMUL_EXCEPTION;
> > +    }
> 
> The original ASSERT() was correct - both of these are easily reachable
> in control domain context.

I'm confused, if it's reachable from control domain context then it
shouldn't be an assert?

> If you want EOI to not be used, you need to raise #GP from it, but that
> in principle breaks introspection which really does write MSRs on the
> guests behalf.

Looking at hvm_msr_write_intercept I see that indeed introspection can
monitor an MSR and defer a write, but AFAICT the postponed write will
be performed in guest vcpu context as part of
hvm_vm_event_do_resume?

Also AFAICT there's no way for a control domain to write to this MSR
ATM, as the allowed list in hvm_load_cpu_msrs doesn't contain
HV_X64_MSR_EOI.

Thanks, Roger.

