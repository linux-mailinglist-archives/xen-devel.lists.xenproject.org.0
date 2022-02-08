Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B504AD603
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268195.461986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOQD-0002Xz-W8; Tue, 08 Feb 2022 11:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268195.461986; Tue, 08 Feb 2022 11:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOQD-0002V5-Sw; Tue, 08 Feb 2022 11:12:33 +0000
Received: by outflank-mailman (input) for mailman id 268195;
 Tue, 08 Feb 2022 11:12:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHOQB-0002Ut-Qk
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:12:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0096ba78-88d0-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 12:12:30 +0100 (CET)
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
X-Inumbo-ID: 0096ba78-88d0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644318750;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oe9eTTPd/LwDSOZA3u7TyfBxq5h5/0DZw/vz3uH0X5s=;
  b=eFQEcYD/AE4aktacY88tdVTA0dRA5418giZjrHLm7DWlQzKaqI12NtUP
   RYfD/P0p2JwreTgFUR+T+9TfQyt1MeR0oFa4ENkP1DzTrIO75zlvQaIld
   1epaMACnJkqzr1AwvhC1D7hclPYWcQrkw9dwWfvuI+DrlqE1RUWQhUAZn
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AFikgXmEOuxZkz7vtxm0Nac16LcuG5TvCMx83JEx42nB2u/S3eEx1arAhcNeYX3xPViH612oEm
 4gB9r9Al7q1zAurvfYBWtI5hpxjDroKm06NbY6wz5TjssCRkkvszDiqJdrwS97XQsbzEZ7nSzu
 eqlqSUW2+eH3lH79VvIPkapAHYvQMmPWgI3dSe2i73tuaBDzENFpFHfL7UR99/M+jCPTLsvlcy
 yp4Jiw/adYvu9akikF6+FwL8IPfZjA4s+NJW6HyVUcL7MrFE+GwpZ1mxMhqsRBDYoU45Sc0eME
 2HS0Cq3uAwGt9deCCpzndZqI
X-SBRS: 5.1
X-MesageID: 64127044
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p0RnaqB7nF6OtRVW/wrlw5YqxClBgxIJ4kV8jS/XYbTApD8j3jMPn
 TFLUWmDafaCMWOnLYtxO4yypEoEvpaHnYBlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970UI7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/l2SFkfRR8
 sx0up2PSTp1E7fHw/slXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHfmTv4AAgGtYasZmIvWOR
 tcgY2pWd0rRZhcVamkzAYoXpbL97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibexPgkudk
 UfX8G34Dw8yOcSWzHyO9XfEruXChz/hUYQeUrix7Od3gUa7z3YWThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYGUtpNF6sh6QeCyoLd+QPfDW8BJhZ/b9ghuN4zVCYd/
 FaDlNP0BhRiqLSQD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLiKY3gxHUR9BvCpmciNHvBCrwy
 DCHqis5r7gLhMtN3KK+lXjFnjatq57hXgMzoALNUQqNyQd0Z5WsYYCy3mTK9vZLLIufTV6ps
 WANno6V6+VmJYqWiCWHTeEJHbeoz/WIKjvRhRhoBZZJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkR8A6JF3HEGzVKB2XIKMV+kwxvP/LduwA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuOHciT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7cApiwZsTX8meRylrmgmreFsOJY3ZI6WNqY7NgqQ890ivqs/G/
 2umRmhTw0fliHvMJG2iMy4/NOq+BM8h/ChiZkTA2GpEPFB5MO6SAFo3LcNrLdHLCsQ/pRKLc
 xX1U5rZWakeItg20z8ccYP8vORfmOeD3mqz096eSGFnJfZIHlWRkve9J1eH3HReX0Kf6Jply
 5X9h1yzacRYHWxKUp2JAM9DOnvs5BDxbsopBBCWSjSSEW2xmLVXx9vZ1KdoeppRckWanVN3F
 W++WH8lmAUEmKdsmPHhjqGYtYa5Vex4G0tRBW7A6riqcyLd+wKeLUVoCbbgken1WDym9aO8S
 /9Syv2gYvQLkEwT69h3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSB0XQPLLZ8PI4/7
 /0mvcoat162hhYwa47UhSFI7WWcaHcHVvx/5J0dBYbqjCsty01DPsOAWnOnvsnXZowVYEcwI
 zKSiK7TvJhmxxLPIygpCHzA/etBnpBS6hpE+0APegaSkd3fi/5pgBAIqWYrTh5Yxwls2v5oP
 jQ5LFV8IKiD8ms6hMVHWGzwSQhNCAfApx70wloN0mbYU1OpRirGK2hkYbSB+0UQ8mR9eDlH/
 e7HlDa5AGiyJMyhjDEvXUNFquD4SY0j/wLPr8mrAsCZEsRoejHimKKvOTIFphaP7RndX6EbS
 T2GJNpNVJA=
IronPort-HdrOrdr: A9a23:Z8947KpcOai/dW4UWpEvVJsaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QpiAoos+O/P+XZgNddvpfvHHeVAlYSi8Rl56cm6XXZ3uBRr22uzKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="64127044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeioHVBj86kzymeJ5aEiFRjjV/4xan0eg7grZSM9yLkJIh4I4XYigXwCPmEEQ4nTvSpYDC4I/Hr6/h2eMKl8bYnve0XfYWdxa60xhBKYfH4qqf1CUn3w8q9FlrknpdZk55i//GvIrCg3KEsSOFz8ibu6Qzdlm4Tpz34bU78gmgwwbN2L8MtCjwMidcGPZ+idbCKlrIC+QxI5bzGG8AiScpdAY+HfCimLMTbtRlg1MO3Dx5Hmyfb3q/1rMrobkx1Co7YeXXshqLk+FyBpoUfnWO+TN+tNFa9VS3hOojVmQoGgbalsvs5O2zoJq4RnQCtJpq6j6YVuri30WPlccvjicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpHPeFK8/aFvQVhXcdAxvEMAyRgM08EMrbSWDNq0ceU=;
 b=hkHZxGGppCVw9niZQq5EdbiqWSMQv/0c/ZZAEh2Y6vFVNXHFHoFDu3EtQbUCvdT+L9F735DJ5DInDbgCX0RHbytNjqHWNxPM7S8Yes7W9SmfBOPOCcEiRDn+cug8Rt8pDzI2gLitCxkf8zS06k/ckO2ouFX3WbQJpdI4TZTkb1JGqoy1TB5W2xGvJVj5uEEWHZ5tBAURSylUTryuoLV2aEF7MGQzuitK8j9umIaRf2U904xZm/aTDN0rpiXfcWjiYwaSeBF2bNtNOVcTq2kj5pX8cT9YB/f16gX5uxz40wT2zzloR5yLKrQ44ZVL7nxNOyKll9own63elAhV8wDINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpHPeFK8/aFvQVhXcdAxvEMAyRgM08EMrbSWDNq0ceU=;
 b=G756MLZxe8SIX7z7W0C1NGN3hsX/ujt0qr8Q0mZiR+P0HdDh0RVkjObR7B+MHD8RL0u4yoxprLifdKU2EzHQ1R/5V8IU+Vt59HTLhN0ubnHLPuSdaHWC7Ka9I0V4SB8UDWb56M7XAtPRooyULFc10djvdZZL1nHqRPOcPpMRBrE=
Date: Tue, 8 Feb 2022 12:11:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <YgJP/jMhWBrLOpb2@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
 <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
 <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
 <ccaaa9b8-8ed9-054e-b724-70ca07401be9@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ccaaa9b8-8ed9-054e-b724-70ca07401be9@epam.com>
X-ClientProxiedBy: LO4P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9e6b1b5-06aa-471d-a58c-08d9eaf3d524
X-MS-TrafficTypeDiagnostic: MN2PR03MB4782:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB478249E14497790987CF18A08F2D9@MN2PR03MB4782.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmpVPlkhxENOiOP08ZurlBFSjwJDF9Wovl9QbME1wkm6WKN6pVCaDEQN6934QtjTWYWkI9DELvWTTForQeDj913T7dyseZiSMmVKMkzSTkKTZxehHjyiqSb+k8LbBPDc+0dKbjkFFZVOVT7TnNPfsVJTqX8k/RQ6+FAYHfvOYG7jSeQ+76XQ18HvGnzekyU5IaEE+x5lAUDE2nAF8LNlTGNO9HjmNP4/6alMqmwKVmTovaT+McaFqOVBQxSKy7dSOrnRirX/WklgDPODhVs/opaNH0+oYE11zY0HwZaEKNJ3dOqNyTrKgsQ2NfITlPEwz01gZ1xLhRGFSuYehLbol+FOA566rgB7ekUFsJrUOlm6RmKoNz4L63aan6JrY7Bhg9rg29Nm5TME1OGFwdhk7w+4Ibkd40hTjof+7qk1/x10upE1TY0O5kwXzaeVMFAhsu3PhPJvcsgrgfNpXzaIO3V3IAbCmawybQDEQRfjjIAi5xk7oz0KgTY3Gez6DxwbraA2adL1Qk5n1YY+Okv7BnEAMjcw5zk4XfbxHC79CwfG+5A1ML+w8eWtV5yaKrQEF+ewCE3j1nFq/xRjSqqz7YnQMx9cfchxR1r/no5MWNDHH4ynWoQgaFymRwfeqdcdq+vwVlSI84AvbpyKOCP5nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(5660300002)(7416002)(85182001)(8676002)(4326008)(66476007)(66556008)(8936002)(6506007)(66946007)(9686003)(6512007)(26005)(53546011)(33716001)(2906002)(6666004)(83380400001)(86362001)(508600001)(82960400001)(38100700002)(6486002)(6916009)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVovMjV5WDJ5eWgwVFN6SWhMRHR3alpTSW1PUHg3NEJWeFZGc0lVTUdFRnRV?=
 =?utf-8?B?UDNWNkhxSkdmdkE5Rzc0N3RvUU1EQXpBVXB4L0xURUNXQXJYbm85THpTemZJ?=
 =?utf-8?B?aWlUK3F6K0xMM3pEMHR3VHdMNW1lVS83UytvaWxaWW1ieEhnOGZTdXVvVTBp?=
 =?utf-8?B?dWxVN09OR2ZweE1sNHBiZ0dJWHdiL2V2bjNYN3M2ayttWjYwRy8zUDdLMDFh?=
 =?utf-8?B?YmR3VEFKWjVyMW9pcDQ1M3hydVZiQVh6eDQzWkhWV3JmSzZEZkJEdlllNVNU?=
 =?utf-8?B?bHFEZ2xNenB4bVFzM2IxWU5KNGUwT21Pek5mTlJEYTV2QkU1dVM3VklkQWZC?=
 =?utf-8?B?SXlkQzdZQ2xYeGEvYm9NVnNTMjBoaXdiZFl3ajI0WXRMSGdtakVuOEhsSzVl?=
 =?utf-8?B?ZUdudnBHYVcrZkdpbFByQndMeE5oMnJBQmtpdlhZajc3amEvN3VCTWpQdnB3?=
 =?utf-8?B?STQxZUtSZmxJYzVNUzJuVGdNWk1vSW9qZGJ0WGxkWmUrVmhxTG4yMktPYnlE?=
 =?utf-8?B?N1lRT0xwaVBORTEvQTZlRE1PdHN5N0ZSKzdja0VXWExjdHRzTzRCNm9NZmYv?=
 =?utf-8?B?ckl1RzVhZGVid3FUa2wxUW40cGt4Y0RFRTNkVWMrYitsRnVNY0VVTzNWQkRG?=
 =?utf-8?B?N2MybTFZb2x1QXlsdFdlK2FSREhvbyt0eTMwNjB4K1ovalhpWmdNVHZnN1Yx?=
 =?utf-8?B?VFYyN0pzSmF2N0hDekdpQVBYZnZrMXZpZklQcmJzQW51THEwT09kUWovUUhr?=
 =?utf-8?B?VzJlZFlMbkFWQ3k5dGRZNGtzRUtiOXY2QlRzRTM0Y0ZhSHc0bDBZa3YzMksx?=
 =?utf-8?B?bTZlM3lGRVFFcUNqQ3dlL2FsUVRHQlRwblFOL0JZR2VBcFNIYXYvWVJpZit2?=
 =?utf-8?B?ZEFZMldIckhEKytqVU9SdGh1VGpPV2RDUEV3dlh3ZmI4MDF1c1phbXNQVmJK?=
 =?utf-8?B?ajNlSVBnVGxQdHV0SHZwWnYzbWd1aW0wMW1IYlZobVZJUXgxOFVIcTNjMWNR?=
 =?utf-8?B?WDhYMWJxckVpVXgrMWVyY0hVdlUzYTkvT0t3cmlaalVJSm9XMEwzK3BQTHQ2?=
 =?utf-8?B?UE9jV1NKTU5tblJObUkyUmRZcWZFS1pidW1pY2RZTW5GU1FOV1JvOTRLSURa?=
 =?utf-8?B?WUtxYTBCdEI2QzlQKzlMTEw1Mml6ODRuM3pNTWZGd2xpcnprKytld2pYczlq?=
 =?utf-8?B?NkJJMFFPZkVJMFdMZGtJakdrL0VtVHhVdXo2MHRVY2dUZjFkZWllYjBaQ044?=
 =?utf-8?B?SjBocnJrZ3F5c3hud0twRkhDdEdEbGdPRzRpVTNhYzdDbkdqUUJsdzNPWmNS?=
 =?utf-8?B?c2twZXZSV2pYRi8vbGtLekdjeEJLVE9nMVA5a2pXNi95bldKSGtqMHh3aTVB?=
 =?utf-8?B?TXEwNFc5Z2lCZUlWRkVOMEwvQlB1VWRPR3psSlZSVm9FSHMxRmQ0M0hOSHh3?=
 =?utf-8?B?K1BIMVpYcWNsa1RpOHFvRlVXVWQ4d1VLTDBqTDExa1lCQ3l6cEpjT29JQ3Vx?=
 =?utf-8?B?bnVXNE1PWG5vVUQwZE1LVmJHdWRycExzcCthS0l3Vm5MejI4aCtZcmNJZ2FR?=
 =?utf-8?B?TzlZQ3NlY2RTbElIVHlsajZvdWY3WG1EdHpSaTkvbWc2OW1aTGdFOGdONEcy?=
 =?utf-8?B?UTc4bXNtNlk0eG82SnZSV09vNjQ0Q0xkWGM0VmpUWlFadnorcDV0YThmVXIz?=
 =?utf-8?B?UkNXcjFJd0VFWm4wQjBnNWk0dWNhaGFYYmhsMUpMWS9taDBQSTFNSlpXOXZY?=
 =?utf-8?B?NXhFZk9mZm41UkNiYklKQWdIMEVtTU1yZEhMa2FuUHdoaXh5aEh1cUhBVVpP?=
 =?utf-8?B?enJnWFNQS21PYkMyNDBkc0l4UEZpMW5kRUVCbmhpSGtJVGJUWm9XYW5rVncr?=
 =?utf-8?B?aW0waVdWM0tSaThrMVBZQnE2a0JuRnh5ck9GeWoxZ3VpYUNDd2VkN0hVWU5R?=
 =?utf-8?B?Sm5pbmM3c0xRTFZpVllrMFp2cFd0bUZmY3doaDVVSnFzTXJjbmlTa0htNHlU?=
 =?utf-8?B?SU9mc3ZuZ2Q2bllQcUdRdWdNQmx4VEdCWE1maHNaSE1SZjREQ3JGWkVsdmpG?=
 =?utf-8?B?WWVmdDFZWEJ0cnQyRWgvVGJYWGl6NHNYalB2SVdMNFlWMlRRak5wMWtMOFkv?=
 =?utf-8?B?c2JkOG0vaE1mUzM0ejZPYXBScHRTaGJFblNNZTFJMGo2WTNyZk5OTmpSV3RD?=
 =?utf-8?Q?5WEU1g7Akd8QKqEixAZfYik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e6b1b5-06aa-471d-a58c-08d9eaf3d524
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 11:12:02.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fxXI1ssAfSORnoIvHbeIjS0TrREKii4psVAIEBEb52Hp8MwVfAnBr8kuCbjG+l0ORh8PeO/Sidyum+zDsYFzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4782
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 09:58:40AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 08.02.22 11:52, Jan Beulich wrote:
> > On 08.02.2022 10:38, Oleksandr Andrushchenko wrote:
> >>
> >> On 08.02.22 11:33, Jan Beulich wrote:
> >>> On 08.02.2022 09:13, Oleksandr Andrushchenko wrote:
> >>>> On 04.02.22 16:25, Jan Beulich wrote:
> >>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>>> --- a/xen/drivers/vpci/header.c
> >>>>>> +++ b/xen/drivers/vpci/header.c
> >>>>>> @@ -454,6 +454,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>>             pci_conf_write16(pdev->sbdf, reg, cmd);
> >>>>>>     }
> >>>>>>     
> >>>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>>> +                            uint32_t cmd, void *data)
> >>>>>> +{
> >>>>>> +    /* TODO: Add proper emulation for all bits of the command register. */
> >>>>>> +
> >>>>>> +#ifdef CONFIG_HAS_PCI_MSI
> >>>>>> +    if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
> >>>>>> +    {
> >>>>>> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> >>>>>> +        cmd |= PCI_COMMAND_INTX_DISABLE;
> >>>>>> +    }
> >>>>>> +#endif
> >>>>>> +
> >>>>>> +    cmd_write(pdev, reg, cmd, data);
> >>>>>> +}
> >>>>> It's not really clear to me whether the TODO warrants this being a
> >>>>> separate function. Personally I'd find it preferable if the logic
> >>>>> was folded into cmd_write().
> >>>> Not sure cmd_write needs to have guest's logic. And what's the
> >>>> profit? Later on, when we decide how PCI_COMMAND can be emulated
> >>>> this code will live in guest_cmd_write anyways
> >>> Why "will"? There's nothing conceptually wrong with putting all the
> >>> emulation logic into cmd_write(), inside an if(!hwdom) conditional.
> >>> If and when we gain CET-IBT support on the x86 side (and I'm told
> >>> there's an Arm equivalent of this), then to make this as useful as
> >>> possible it is going to be desirable to limit the number of functions
> >>> called through function pointers. You may have seen Andrew's huge
> >>> "x86: Support for CET Indirect Branch Tracking" series. We want to
> >>> keep down the number of such annotations; the vast part of the series
> >>> is about adding of such.
> >> Well, while I see nothing bad with that, from the code organization
> >> it would look a bit strange: we don't differentiate hwdom in vpci
> >> handlers, but instead provide one for hwdom and one for guests.
> >> While I understand your concern I still think that at the moment
> >> it will be more in line with the existing code if we provide a dedicated
> >> handler.
> > The existing code only deals with Dom0, and hence doesn't have any
> > pairs of handlers.
> This is fair
> >   FTAOD what I said above applies equally to other
> > separate guest read/write handlers you may be introducing. The
> > exception being when e.g. a hardware access handler is put in place
> > for Dom0 (for obvious reasons, I think).
> @Roger, what's your preference here?
> >

The newly introduced handler ends up calling the existing one, so in
this case it might make sense to expand cmd_write to also cater for
the domU case?

I think we need to be sensible here in that we don't want to end up
with handlers like:

register_read(...)
{
   if ( is_hardware_domain() )
       ....
   else
       ...
}

If there's shared code it's IMO better to not create as guest specific
handler.

It's also more risky to use the same handlers for dom0 and domU, as a
change intended to dom0 only might end up leaking in the domU path and
that could easily become a security issue.

Thanks, Roger.

