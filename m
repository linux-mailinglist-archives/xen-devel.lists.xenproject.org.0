Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A73EEB6F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167761.306263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFx6F-0005uF-R2; Tue, 17 Aug 2021 11:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167761.306263; Tue, 17 Aug 2021 11:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFx6F-0005rO-NF; Tue, 17 Aug 2021 11:17:43 +0000
Received: by outflank-mailman (input) for mailman id 167761;
 Tue, 17 Aug 2021 11:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFx6D-0005rI-S1
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:17:41 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc0ff85c-ff4c-11eb-a4a1-12813bfff9fa;
 Tue, 17 Aug 2021 11:17:40 +0000 (UTC)
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
X-Inumbo-ID: bc0ff85c-ff4c-11eb-a4a1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629199060;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8yD9UVpc/pWgSfFypgqE5p/P+U+P/T0YPCzBm1CvqlQ=;
  b=T4BMBnn0Y1XIw2IIv7eeh+Ugu7J8YNvnItIkhKROwikESnzrt7VJ4937
   gO/fzRpagEYGDhGjzGaA9CyU3Us259z054KASm7ouJ7D0+pyPt8xaqHAd
   U+Xkp1lh3FQhDwoCECKveybgcxCZ78lwViqdlNmmAYkeyKE1oY7q2RCCO
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R3sk5vOF8BpqSUrlCvHcCwk7fJcUNX+HAM5uLrrV/xaBK3oOO+m74pkg4XJ31RZ7dmVFC/F6tZ
 9fOEDtLfKyK04kejg0RBWgyzi4HJXcoa2eI5dHytRcry3m9Pegt3s6jEpZ+TquUK//UaISKdrw
 Vj9tMGCFlODhgL/sKYnAp2X/uwDptnpblYZoWt9tPB9YeCTdb/1uKDsstJHfF02wHHVhWUhiSV
 mSZnJ5KzAhmswAKD0i9Lsz+LI4hxLo8OLQk/iFpQv/3BJT9KwjsFXiT8FKWT0F55Ob6BWy0rlX
 Ix5KnzGhbCbpxsWGKhgOMQ1D
X-SBRS: 5.1
X-MesageID: 50606499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2HVSFql5j/1OcDG88P60XEAZJhLpDfOiimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IObuEYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtNdBkVCe2Gm+yVNNXh77PECZf
 ihD6R81l+dkDgsH7+G7i5vZZm8mzSHruOoXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Qs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgt/DWVZAV2Iv66eDlEhiTMuAIm2kyRjnFohPD3p01wsa7UEPJ/lr
 352s0CrsA8cicUBZgNT9vpD/HHUlAk7Hr3QRSvyG/cZdU60kT22tbKCYUOlZSXkaMzvewPcb
 T6IR5lXD0JCg7T4fPn5uwDzvmKehTnYQjQ
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="50606499"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzp5ONv9GYiJ5TUD/ZptpqY0786c46HSsgHVDtCZ3qdUtJA1137yUQqwgUiAzHvvyMIP28lMHa33MZoe24NS4TCG/titlsy3NZxB2c1QdpfgS6u7P/m7eErpcCz1w783DH2m+ZCyAb7QKiy4gTpNUCKctwC5wzPEsAVa+NVoT6bKtC6bkIpvOTtWqt93kxzH99NmQuXfuQo2b/2n9Z1dmjP24Rgpvq7IiQN3yahEK2xfvC/4/OuGP9RuRNyWsyh4B1FFXq6AwEi80SALj0NLytnMfVnoqbeE7f31HYIzVedoJZPHJmmlUpUivaaJQrEmHCtyXxt0FWyA8Ji5ccQKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncX/Df3r66yg/lXVk/jzVAADHcM2C9LCOTQdDGWr9vY=;
 b=ocaFGj5xb8Teb+gi4KIpa6YsvnYQbq7Iq4toae3UykQZmG6km4+AcVKHy/VOWhuXW3Sh5dAGKxmBTctJZrXw8sVA8Ctj5sUZyRw9djw6dNS8o5eEbwLgUC7xSkXdjjaxpyPQ5QaaaNkP/fmoV5vb8I4nAobO05xoZvF2WEEwfKe9x1uu02tWdpxhpiCtbiCZ7y6VQhUTbpFraOfzjGVbfGYI3riccQbBbQu7HH0tRJkHb97HBot8pYqo0qqosa8Isf3Iaua8mqzJ03DL6Mv+uSG3V32/cWWMlLJirEPQYPcZB46k73IIeqhYTGN56BsX5mCjlIDNuXIkeffRZpEtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncX/Df3r66yg/lXVk/jzVAADHcM2C9LCOTQdDGWr9vY=;
 b=j8s0fddObPegga/kL+5kNXyZw3tjzx8y101mNVVu8s/P12h0qIO3rKB9FBnZmo8440Kr/LXgQ35fiPYGl8bFZPq/TWWlInluVTBXd3D+E1h43iYxc1tjD392pHH1m6X6UHFuV/tZjcwH2Dltj3K5Yy8b6jy4cBHirVuaXWtROaw=
Subject: Re: [PATCH] x86/cet: Fix build on newer versions of GCC
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
References: <20210817105656.19683-1-andrew.cooper3@citrix.com>
 <YRuaBIc+bfErQnDy@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e80d5b51-47a2-c778-f9ef-707efd73aa5f@citrix.com>
Date: Tue, 17 Aug 2021 12:17:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRuaBIc+bfErQnDy@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e4decb6-161a-40d7-ed93-08d961709e9a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5920:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5920DE24E0CF44AFFFEB8663BAFE9@SJ0PR03MB5920.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yjnnExykoFFno9yNa1z225DdlOJ5kronJdk2IlsKguXkv1CNKP3xLGkB6kuEB/shsuom3EoOXa8q0+Q32dYpfphM2jKnseT4FC1MFXskXYp9AWXUppOXDuGbFbBt+H7b2Z5ynknFnwHKuVegG4jbKfze4Uj0UjVOA3nPEADJ+yTaIgCSVO8idEjb24ZSg/B1CfJ0Vouw3BhdjzykhSg8TaGjIN0MJIvw2Y+1Y9V6wF/PyOTi2RsCu4jviRAqdZ/GWx5DIeN6CFBzaFps5P+MtqERNKnG++BjMde9TVtC4gcjOtYi09Fm2F5ZmGwdXp7x1elH0gG0a4mMHzyIb/Cu5ixLU7/3ZRKtb/4fglkNa/Z0wk4tMdJ8ZHiwImKXEjECuiZ09za3az2n0lcIdElxWJGSqRGBsZ/jlpsaI+W8iAtainRdmpgJs0IRL2RhCxnkOaHE9Yv37zNnohQyBHkLYs0IUsJSRVj6izQiD0xBgQoMErNrRHSzpqqjr6yjE5XOB6e5TSKmdAQfsl92Uj4hflyGTXJ4UG0Oa0FyBgB7enGxVbiRjmCk206uj2Beb/9jBoXEgv+ToMrFNtbdzEHj4YSq1YlKtQGQDN0zfqWdfmYU4gP4D5nZlRn+nrfoNoRm44LY/aa3YK4IH47XgAuaMe7v/Z7tttEOcdsVIaaYNNbPJCp/J3j0dg++zo76ZHOMM6zB04f80hP5q1YHOQpXH1wvb1jeQNZTawKuRgv0OM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(38100700002)(53546011)(8936002)(6666004)(66556008)(66574015)(83380400001)(5660300002)(54906003)(66946007)(66476007)(2906002)(478600001)(86362001)(4326008)(956004)(2616005)(31686004)(36756003)(16576012)(8676002)(6916009)(31696002)(186003)(316002)(6486002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2k2RDdpMmVmRkVITG0yV1o2U0xuQVYwb2VzNkJ5MkxDNXNua0FzN2ZzeE9X?=
 =?utf-8?B?ZkhTU3V6WlFkZC9EaS9vV09RYlpPRmxybDZNRnNaU24xeEZ0a0k1d0IvV0Z6?=
 =?utf-8?B?UDQ2cEZXMytZRld4YU5oYlpuT01ac1dvRzludXc3cUJrTVNaTzEzQWRBMmd5?=
 =?utf-8?B?K3dOR2pLcWhqY1VaMHB1YlcyOTJNdWZCTmtQanJoc1BXMG0xbjJveFd2d2Jj?=
 =?utf-8?B?allMWk1IaTJGZFB2dmRFRlNqbFJRYmdQUHpIdkRvNkVzdU5nUjdoVHlUSk9Z?=
 =?utf-8?B?eVgyaEVnYzY3ekZuNkVHWEpFZlVzVVo0Q2R2WFRnT3dpUFZhb0dJajkrUEtN?=
 =?utf-8?B?QTZHRlJnWFZkQ0ZsdnNIc0xzMnhHekZXYklabGdWSXdXdERETFdTMlpZU3ly?=
 =?utf-8?B?empwTjMzY05BY2hSMjdQRFVWTmNLT2ZzR2J0V0Y5SzFvZlhQQlB3L3BGSHJQ?=
 =?utf-8?B?MFBGVGNVaE92d3N0ZXd2SzBYd3JiWmN0RXdtK0hxY3pQTGpXVmFyNDcvOXp4?=
 =?utf-8?B?UHZvMG16NEMvS2tnMC9CTFh4eFhtZ3EyUDV0TWpEY2RzeHhiTzJGSk53ZVUx?=
 =?utf-8?B?dkNYSWptcnJSYTlhNWtXdGtXckRUc0tZNVVPODEvNjh2RVAvRXFNd1h2c1Fr?=
 =?utf-8?B?MWtxaTJvbnRFcjU5dG1PVC82L0NKWnBOT3hheVA0YmZENzRjK2xEc3BKVElw?=
 =?utf-8?B?Qk1jUGVyazFsNEQ5VmV1RURRa0lmUzR3Yi9INmNWZHc4THRSUUM0MHRSZzRk?=
 =?utf-8?B?OWowNG5sTWkwdFhYdjJSdk83b21Fb1VGcjRsQlNXOFNpakQ5WmszbWEwRDhE?=
 =?utf-8?B?QkNyekVhSHNQTFNEam56Q2t1YTdGUk5ua3dKY2pQZjhmT1N6RnNYTTlNYmVK?=
 =?utf-8?B?MkRYejdzOVl5azJrS25NSGh6NFpNTWpMNStpeE5QaTRkMXFySjRDSmtCN05n?=
 =?utf-8?B?SXhvcXlwaU5ET3NLRjNsbm9GN04rZnVud3ZRdS9zdzVHK3p5MHdBejNFRjNy?=
 =?utf-8?B?SnNiK09lUjJ6RThjNS9HZkJBdXY3ZE9ENkJRRlhBeUgxdXNYVzFCVVdIMjJt?=
 =?utf-8?B?aEFVZnk4OUxDek9IYzZpeEF0YWgxT0NwdjVpeFM3U0tRSk53RU02WnkySnpx?=
 =?utf-8?B?dUloT0NGbzhqdmNvUFAvTmhXUGcvRFZDT1FIT1BYa1p2RVpReXFwR2xJdzBI?=
 =?utf-8?B?MnRrL3hCY2ZBNTN2MlAxb0pzdGUyMkFkeG1qRUVKbXQ1OEp6OTd2YmR6K1ZB?=
 =?utf-8?B?QkZ4UC9raE4zS05JbEdXcmdRbWwwY3JmUTZ6MjRUYlRPaWhzSHg0YWdtNE9I?=
 =?utf-8?B?ektLNmNXbW0yVkhXVWpUeDllbTEydFhRMjhJcmxEaExHQTVPYzZRd3ZtT0Z5?=
 =?utf-8?B?WkFiR0xkbmFTNGFhRFhLSExmLzdvclZyUGErY20vaTNpNk9iTTMvRjFUeXI1?=
 =?utf-8?B?cFZFRmF2S2c3TE9aNms5TTZmS0xiUEhWWWVkNmNrY2hpNXZsb2VXUWVnUHRz?=
 =?utf-8?B?R24wTmNUbVN0Z2RGMTE3dDdRd0Z4Y29YV21uektKN0d2SEwzRThLaVFaTXVx?=
 =?utf-8?B?NDFUSEZ1cGdkc1dmZ1ZENDdCS3R3L0tDK0ZzaE9jajRsL3ZYR2ZDcTFESDNI?=
 =?utf-8?B?RjYwR3BJVCtwMnN2TUZxQzczU3lsSE15aDNaQUx2LzhsL0ZDcmxaeDNGMmU5?=
 =?utf-8?B?YXVXWFhieFRKWFFHbjYyRUdWcitKMlFTTTVUdlJiOFgwd2MySGc4b1VuM1Yy?=
 =?utf-8?Q?fO8kgURMx3IB5LUVomLh578IwRQpnp6aL21ILg1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4decb6-161a-40d7-ed93-08d961709e9a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 11:17:37.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cv1dPDBeLK/B/vsuX//F45aGyl0IiaYW/ywSD+34l5ZsCxhI11TDuNyH8QB1GHzj2G4YRscQz7LyBobA82JoWW10BsIZalj9qMiNNQIJQDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920
X-OriginatorOrg: citrix.com

On 17/08/2021 12:14, Marek Marczykowski-Górecki wrote:
> On Tue, Aug 17, 2021 at 11:56:56AM +0100, Andrew Cooper wrote:
>> Some versions of GCC complain with:
>>
>>   traps.c:405:22: error: 'get_shstk_bottom' defined but not used [-Werror=unused-function]
>>    static unsigned long get_shstk_bottom(unsigned long sp)
>>                         ^~~~~~~~~~~~~~~~
>>   cc1: all warnings being treated as errors
>>
>> Change #ifdef to if ( IS_ENABLED(...) ) to make the sole user of
>> get_shstk_bottom() visible to the compiler.
>>
>> Fixes: 35727551c070 ("x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Not actually tested.  I don't seem to have a new enough GCC to hand.
> I have just compile-tested it and it seems to fix the issue (indeed it
> failed before with CONFIG_XEN_SHSTK disabled).

Oh, thanks!

>
>> Most of the delta here is indentation.  This diff is more easily reviewed with
>> `git show --ignore-all-space`
> Wouldn't this make the compiler include the code even if
> CONFIG_XEN_SHSTK is disabled (not a huge issue...)? Or is it smart
> enough to optimize it out in that case?

Its a trivial dead-code elimination example, and yes - the compiler is
smart enough.

~Andrew

