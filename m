Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5228443755B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214928.373790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrcl-0002G9-Ph; Fri, 22 Oct 2021 10:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214928.373790; Fri, 22 Oct 2021 10:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdrcl-0002DX-MS; Fri, 22 Oct 2021 10:18:07 +0000
Received: by outflank-mailman (input) for mailman id 214928;
 Fri, 22 Oct 2021 10:18:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDp0=PK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mdrcj-0002DR-KY
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:18:05 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee0a58e2-d60c-4d57-a1f0-cfbb03b23133;
 Fri, 22 Oct 2021 10:18:04 +0000 (UTC)
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
X-Inumbo-ID: ee0a58e2-d60c-4d57-a1f0-cfbb03b23133
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634897884;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uqizGUT6Fu/4JuQQPi92JSV5UmjKhcU1j0M0jjc86KM=;
  b=hWOnJs38jIvzI3PJeQdxPAb9NL5Yse5+cF+ZMARgt9OxdjbZqRv5BXVr
   mYYEnU1I7naZwmP+XqciweA/z/gBbnk6SlrJGKSGWT9NYgFrg6G9KvV4f
   bqo35tZgOPoOrmBGlkNvNUjFtTzP3zqEg2zPs2Se2Q0iuvSE/6NDWR8ix
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3sZh67wHG9cgODIgrX50v550rXfpvBu4/Wr3NfKvgOEeoO6qFuo126ehEVvgXrGNbTQXIfmXFY
 B+r0HD1koYumc05RD18PVRPxdGbC+0FiWvjKubnpgcOKbit96B55QTcw4z/iMIuabi1nOo8VXv
 J9N9gFYyq/JgWCRZeyqAZ2uZYUE3mYMsUPZ+7oFiNh90ZliJcjsZiAeRkx/fr2xrTON9+d8nsq
 KW2e7lUf1y6Os9U9jq3Ej0l+sXWoqfLFvBAr3jA1AHd2027Rla8SrTsEyKSAV7ce7Oob8InvrO
 VqxdriVROumPKETgUqWXaf9c
X-SBRS: 5.1
X-MesageID: 57731633
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y7zm7qsM3UmkQZY0LPmInAaSA+fnVI1ZMUV32f8akzHdYApBsoF/q
 tZmKTiEbP2MY2CjfNFzPI+0/BhT7JTUydc3SVdlqi9nFC1B+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplia6yaTgiDLbwl+lHS0JfKDpEF/xl0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258RRq+AP
 JFxhTxHUEqZXT5CJkwtLJcQw92Vu2fjMBBlpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYgadhwLOYI8z2Cx/DMuAGiHVIuHx1oPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOcjdcPX5soR8tpoC5+tlq302nosNLSfbt1rXI9SfML
 ydmRcTUr44YitIXzO2F9FTDjiPESnPhH1NtuFu/so5I6GpEiG+Zi26AtQezARVodt/xory9U
 J4swZT2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybpZYIGC5O
 BSO6Gu9AaO/2lPwMcebhKrqU6wXIVXIT4y5Bpg4kPIeCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGOoNdNdwhTcCBnbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:aseQNKFcvdUC+6xopLqFDJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo6j3zEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfKla9CC4kY1jiaWgOKsk8SgfwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="57731633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS+fCqgCyGg5zF1LTtOHNouGsBp1hBzQ/+htTea7YsLwFgE/6wlzv8vKX4MfrrgHS80eaJyMcEHR731K3xuRZwWKdJu4tsLsu6/k1m5elXHKDXxfkhGOSg6VbZ4KdMEfOnJ7Eg6zCaPpwuvvQz5p7+REykTHm0NrflHFCYdoJBYcZK0UxNg1PtZJhMoCpzAAJkTFzu19iAwEBdxZTT4BTSbYyKs2GD0Zctgxcg8lgxl3G8EQLtsM1Mvq/grlAZdszHW0O76f15smspvTz0VXhFxLAYHmSEfs824llSMmuraWg14dmridZXOwdguCrl7KK+p35dcX21PcGE3FvF8RLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxuHHN9Arm1v4Q9NZNZy/rQ5hYYMUHQICf84d246qtg=;
 b=Ypu4NgfHLd/uQsHn6EDwpsFxqzbhJul5htS2FKG5rF1OFAS+6mBkYTZ2mtMGVWrsXWpJci0lfcCuVltZjaLGyPW5dz0nNyA9w0weHnJgbOI848wxRcvslfp3xPYKRVmUcbmNm9BxqPFDjhRZskWvgKv9pEQgS2/gonLYjQEikpz7jLuVJiHcZiesaTy8a6MXPMc1lMqgBUuzK6qo8YKgCI7cqnkaeXQIHnRQ6Y1tQctS0zSniTMDauOyrDOoR20+XJfrpAfbXCILRTsfLS9LtxTO8lEfKRS0x4S94mUhW3Z48zpkRmJN0u0JFWCto8WG/BOnVdbt1r9lF9xpIdjUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxuHHN9Arm1v4Q9NZNZy/rQ5hYYMUHQICf84d246qtg=;
 b=QVndQqOQ4w7AuOo86Wq08/UZqymWOTqP7UaY3JbfBmao2+KLi8xTtCa7FT4kDRY9vz90XkjDIbXoeFvv+5+49X0Bfxkp4E1TuNV2HZPpjJE57nyyxRzNpX+n1mN9djhVP6nnR3ai3jWDwD3PgukMPLGZqcknawINPEGloyPwmKI=
Date: Fri, 22 Oct 2021 12:17:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 3/6] x86/PVH: permit more physdevop-s to be used by
 Dom0
Message-ID: <YXKP0ZZaBa0dve7U@MacBook-Air-de-Roger.local>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
 <f7023f65-5cb7-fd2b-f320-c46a8e6e1ac1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7023f65-5cb7-fd2b-f320-c46a8e6e1ac1@suse.com>
X-ClientProxiedBy: LO4P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9706f205-e0a2-47f2-73d6-08d9954538df
X-MS-TrafficTypeDiagnostic: DM5PR03MB2780:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27806F7EBEC5F4E32C46B3628F809@DM5PR03MB2780.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwoqpRWux8Q6GHpfOYNfDX5fsu6T1KhwK40J5bIeylASU9gy3Mlm98hqXU05NvgVFPC6mD6d9JI+0llJR4+b2j9j6dtFZNcQ0FwYaVqBDBzwVhAEPpJohAJNhhDc7/c+lv+YSePRXXOsn+8nmkRg6KQm9EhVFr01Ly75KKDQ2otHGgU3+HqiwWxgttlXblM6dxgVwpogwrb3nJXHIjmsZMvOjhzyS7xZcJHB3FFufatyyuLGXwZEwF7sczb/5HJlcWJIcOsLf3sPjUdRKq4Ls+eTPcrImiHOfPfytgk3e2lvbbjj19WN/nxGphZjBGRG2kEeu9lQUzkDmY2S0n2QehSSEiceSyXzOK3MAtK3OxUitaL0OaZDMDBOR4FRkMBWTYGx6NtRq8E1ruRKOVB2wACuKNGJkqV/0ZWbG6MRNw+Axuu+mAZ+3T9eYaYxZh5Bor4QEbCxzsyP9qD8FqRjTkF1/tjrsp5G3f4vwOYPmsDDYE6aDLDdSEYzlSJvqf1XVmkHUd8s5B5L0B5K51YuaAkRaOFImIWSY/A30ZoMmHuQfYFyPm34Hp8aWCZUiVKzXn5/lVeO6oNxb3EQzDkn6Tlz+YQF6ndWU3jEuN3kX1rq2ddybK3xtX6Z0kii+IjhxT1pmdKzZeWZv+C9VVsH6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6496006)(86362001)(316002)(82960400001)(54906003)(66476007)(4326008)(6486002)(66556008)(38100700002)(9686003)(26005)(83380400001)(6666004)(66946007)(2906002)(6916009)(8676002)(8936002)(85182001)(186003)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjlYUDFkQ0pKdlRqRFhCVjUwcEF5d2x3dFFBVzZEenhQSVdkM2FrMDJpMm5m?=
 =?utf-8?B?M0U0M3NNVFZjMkYrMEhlWERBSi8vNURFRzJ3ZHl1YkRQVGZrMWhvT3JTVFRM?=
 =?utf-8?B?UmdFaXZuYWF2QU0xS3ppQ1JVdzJieGw5Qlp4YitWVUs3TkZyMURtaXAyVDhq?=
 =?utf-8?B?K0Jyd1dBZ0tHZ0VHOTYxUnlIWFlsTkNSbXJDcWhYYWNEekdvd2pOQy9NMXZT?=
 =?utf-8?B?NHhlZ1NqTWFnT21kbUZLRHlVQ1NFNzZ2Qlk1K1Z5OE9QR1pTa083RURPUGtI?=
 =?utf-8?B?OHJJMjRTK21VOXR0d0lBSnFYTmRmV0ZtTEwzd0hyYUFpcjVLK1Q3amZhaUta?=
 =?utf-8?B?blNxeG00YUI1K3p2SVhkZTNTOU9NbTBTNmJ3ZDZ3d3h5Slhqeklacm9lWStn?=
 =?utf-8?B?V3VRdE5UZmQ2SzlXS2tOVFZrY2xFTGJXQkRzWDhZSlcrM1FZYWVqMTdVUUE2?=
 =?utf-8?B?T1FJU2F0d3lnTSs2a09ydVNaNnc5L1lDeEdBUWlUOThNYnRKZGUramZzSlY2?=
 =?utf-8?B?WTR1bGp6cGNkN0lEc1NaQjI5VFRjSW0yTFdDNFBuN3JUcWpTT3d3WTFxWE5t?=
 =?utf-8?B?cFZhdVNsNUdTdklLaEVDbk5QOFkvZXJnSndwRTNaajFZeXppOXdPUkhodVVz?=
 =?utf-8?B?RE13QURpRVFkamZJWkRsZEZQVXBLVFJ0cGxiUkZXWHp6MUl0ekI2RmJyb0pP?=
 =?utf-8?B?QUZheW9pL3p6TFR1L2RFb20xTXJQRG8zbS9weS81ZDBRS2hWanVWd0wrVFRC?=
 =?utf-8?B?cHNuRkpEUHpRTVRGSTNYbkpSU25KVzhHWkVwZEZSQjhmRlZGU1BYNXN1d3RP?=
 =?utf-8?B?eGZsaktXblVrL0tLemZuTThHdWFNVVpNWXZ0VkJCbWgxWHlpZUR6SSszUE1j?=
 =?utf-8?B?ZlN6eWVTY3RkM1I3NkR1Mk9UZnRiZzJNTWVmMTlpRDZ2b0tOV2JkVnF1ZDgv?=
 =?utf-8?B?OHBrNTkrdTViamlMWUJNbXA5ZmxvWkpseFNNd29wRUtwbm9hYjl5ek4vZHRV?=
 =?utf-8?B?QjVQaEpEa092eUlGU1RtUHFOWWRXQVkxZTZiMzdUckFkK3JzQjNGVmRCaU9l?=
 =?utf-8?B?NWllaDNOTmRCaTJrM0JBZWRGU2ovV2RXRzdzRDd5OEl0UDc5NHQ4TWt0bjB3?=
 =?utf-8?B?T0VXVC8zai9kaFZCSGh5Zk4xKzVueVhlclN2T1lsditpUmVwTFZCL0NjWGtM?=
 =?utf-8?B?c1NSemdsamd1YjhYb0duaDg5cTA5TngrMEVXMGhCTWpQSEJXUW9lS3diTVg3?=
 =?utf-8?B?S0hIRlRUV2ZPbEdJZWk0UEdmRlZXWFladFNmOHBmMkM4UExrdllsMzdzMC9Y?=
 =?utf-8?B?aUs3Y290cy84dm5rWUV2Wnhldm1zMDlMS2hUU1RoanRNRnY4d3ZseEpFaE5i?=
 =?utf-8?B?WmxFa3FyU3lGNmltMS9HV3pRT00wbFFrTEMyaS9mMXlzc0RJaExjUWxSTDQ2?=
 =?utf-8?B?TkI5cE1uMXhOZGpZV1I4T2ZlcUw4Q0hmWUNDeTRvekpvVGFLNUFPUldBRzlr?=
 =?utf-8?B?S25UVURsZUVoZENuR2dIRGlUYWZ1dGd4M3dvTFhVSWV5ajlTUjdJbS9Sa1hX?=
 =?utf-8?B?Vk9Vb0dlbnpCcCtERGZYSHIvTnhPR1Z2amVBcE0wYUtqSk1pVHBsT08vNXV4?=
 =?utf-8?B?V0JEbU1xUXAxVXliQk5qWHVDTjNZbTJya2hzYkpjTnY5Yi9UOEIwVWZSekNU?=
 =?utf-8?B?aWt6K2F1VjdwVGxkZ1crdG5LUHZud2R4UzB5UEdZb3d2d0M1M0pUMW14NzZM?=
 =?utf-8?Q?chH0ywqma3OOfO2dbtxoirITqLxWKYd2IPkDQ3P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9706f205-e0a2-47f2-73d6-08d9954538df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 10:17:59.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2780
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 03:14:13PM +0200, Jan Beulich wrote:
> Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
> running in. Permit further PCI related ones (only their modern forms).
> Also include the USB2 debug port operation at this occasion.

Sorry, I realize now that I failed to provide a reply on the previous
patch.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm uncertain about the has_vpci() part of the check: I would think
> is_hardware_domain() is both sufficient and concise. Without vPCI a PVH
> Dom0 won't see any PCI devices in the first place (and hence would
> effectively be non-functioning). Dropping this would in particular make
> PHYSDEVOP_dbgp_op better fit in the mix.

I agree, it's not an option to have a non-vPCI PVH dom0 anyway, and
the important restriction for those operations is the hardware domain
part.

> ---
> v3: New.
> 
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -94,6 +94,12 @@ static long hvm_physdev_op(int cmd, XEN_
>          break;
>  
>      case PHYSDEVOP_pci_mmcfg_reserved:
> +    case PHYSDEVOP_pci_device_add:
> +    case PHYSDEVOP_pci_device_remove:

Those are indeed fine.

> +    case PHYSDEVOP_restore_msi_ext:

While I understand the current need for this one in order to possibly
restore the MSI interrupt for the serial console, it might be a
cleaner approach to let dom0 restore the PCI state on it's own using
the native methods like it's done for initial setup.

I realize we are missing a bunch of stuff here, for once vPCI state
should be reset and put in sync with the hardware values after a
restore from suspension.

And then we likely need to either limit PHYSDEVOP_restore_msi_ext to
just restore Xen used MSI vectors, or if technically possible it would
be best from Xen to setup it's own MSI vectors when restoring without
relying on dom0.

> +    case PHYSDEVOP_dbgp_op:

This one is also fine.

> +    case PHYSDEVOP_prepare_msix:
> +    case PHYSDEVOP_release_msix:

Those two again I'm not sure should be added right now, as we still
haven't decided how pci passthrough will work from the hardware domain
PoV. I'm explicitly concerned about those two because they will mess
with the MSI-X state behind the back of vPCI, and nothing good will
came out of it.

If we really need those two in the future, code should be added so
that vPCI state is properly updated.

Thanks, Roger.

