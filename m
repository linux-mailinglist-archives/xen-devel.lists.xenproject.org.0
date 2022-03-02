Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EC4CA921
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282367.481059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPR0X-0007AM-Oq; Wed, 02 Mar 2022 15:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282367.481059; Wed, 02 Mar 2022 15:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPR0X-000775-K2; Wed, 02 Mar 2022 15:35:17 +0000
Received: by outflank-mailman (input) for mailman id 282367;
 Wed, 02 Mar 2022 15:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPR0W-00076x-OS
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:35:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 595688dc-9a3e-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 16:35:14 +0100 (CET)
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
X-Inumbo-ID: 595688dc-9a3e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646235315;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pj0Y4LdJ1nEakHOg/9BV7BcLzHgHTL9R/Sw4x3+t2Oc=;
  b=GFjzjMgaozgG0Dj4ACkrLR9MqQZ298W+fiHE7AoCN1x3x8rnsu6RdlBA
   bKgJ+QTFZfCxkM+DBf8anNssrNVAaz0nZTGjMcNX8VUMd1j+ImZaE+vkU
   vzIxeNQpVo8528EB3AP/tZ3ttlLUh++VOVoetA7RdOKnwUv4NVmArVD8Q
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65309310
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2lUqXK2VKNMJsfZ2N/bD5SBxkn2cJEfYwER7XKvMYLTBsI5bpzAGn
 WQfD2qOPviLZGeheth2bou3/UsFvMLTn9JlTAA5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw24Dia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Su4K5bBUyLJHs27sfYjJZOWZsEZNvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDP
 JJIMmM3BPjGS15RIUk1Jo8vpf6PiHbUWBFzrl6Ir5NitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRCBwAKMaWzzbD93u2n/LOhgvyQodUH7q9ntZUh1mUyn0WGQchf1KxqvmkiWazQ9tab
 UcT/0IGtrMu/UamSt38WRyQo3OeuBMYHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqZzIATAYDy8nupsc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/7q141nikSm+mriKEQwEzQT9GXCJ0CosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxT4M4fFyhVErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+PAPCbEF+5UajNii9zVCove+m05F
 P4FaqO3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYvF
 6hVI5jbW68XItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:/sc4PqoDnyJrcuCp5PqMXlUaV5uFL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhcotKLzOWxFdAS7sSo7cKogeQVxEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjHzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2XqbRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX242oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF3nAjv0idprD
 D/mWZlAy1B0QKXQohzm2qq5+DU6kdq15Yl8y7AvZKsm72geNtwMbs/uWsQSGqm16NnhqAn7E
 sD5RPoi3IcZymw7RjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklW6voMRiKobzPKt
 MeRP00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7djDlhCy8rBrZbQQF++oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65309310"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7SqQJ/IhdlTEbCiPW6YEjLlArtZTldka9r/o0eo/wiIf3mdlkp5lpFBYlovVZI2UmNvLsIqEzY7UZYXvVkWF4ea1Q1iFWNKWHM9c8T6wpUkvQSgG9PN+FBCzx7Rh1OLui7yCJ+ALk94QdYNcUxZ5VaQV3psOsyrURy5BSEVmEFo9sumxJiIZG3k5QYlGmYFXZjn+/DApwwItdaK2mTaUO7SDj25NOJP/BD/lZ6AqL+In6mKMf8TxZQs/kG5YYONNZMMQhdv/04lksE+9KhEW4cAqW7k3Rm590twGN1GkxD6jlsvgmj8lRfywerpbmzPA3sBsp9uXcdRm4wBnDHfdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj0Y4LdJ1nEakHOg/9BV7BcLzHgHTL9R/Sw4x3+t2Oc=;
 b=jpjfIpzZjHBd1D0lCM50vBPi5TLt3x2uQbMFSIxEtbrX5Ue7BIuYY9x7AHFyFpYBi7uHv6Zw8u1W+I2+bzKu1Y1TAwEivHlvpmIYbbYcbpRfyFo+JzdNg3TvR15wZAz4ih4ye2GKt9bFORVB9ZZfct8Ra8zyaXRcCKe4qNgJlsKg3usZqbQZPFTjuC6jWDQGciiOS6716drSPyc9MDh4vap4uyzeVNca12tt/cjQEjrX8IQIP67axMsPWtUHatGpWpmzq0g/AP291gP9A0xIfwjAYTskDeldt83Nli72OH1J28AzNmDq4Mh0GAplpaM0pCdYVx5JS6XXw+U9/lqG+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj0Y4LdJ1nEakHOg/9BV7BcLzHgHTL9R/Sw4x3+t2Oc=;
 b=T4xtgktQcgBT06+f66Ps+Do+eA9CYZx54FtgIXOs0U24EmTHprhwYuwPtxc+lSiAiQMxhbHpiDewjXNaLo3ZqphFA/VlHQWvrYxvOv3Bpwe5FRUa2XXcgJNhJeoIe4KYQlN04gY1iAJwInmHLjejLOo6En6mUyrQw+05o3SnIYw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Thread-Topic: [PATCH] livepatch: set -f{function,data}-sections compiler
 option
Thread-Index: AQHYLjuyHNmMpGp0pEK3C688krS2saysObiA
Date: Wed, 2 Mar 2022 15:35:07 +0000
Message-ID: <b2381496-4dc5-5051-2bf5-9d164041c9c8@citrix.com>
References: <20220302134425.38465-1-roger.pau@citrix.com>
In-Reply-To: <20220302134425.38465-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23290885-31a7-4fdd-c282-08d9fc623b13
x-ms-traffictypediagnostic: CH0PR03MB5954:EE_
x-microsoft-antispam-prvs: <CH0PR03MB5954E186BBA944DFA02B15EEBA039@CH0PR03MB5954.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8orlaSIDFj22BkIZ6wu9X83kXu3FfGphi9PgP1bv7QrPgsdtOa5mjKLkxC71p1C8SuJw8Xtd3r8iI2xO4wNknjE0xDzb7xQg1+QC1daxdDf8xhIEj0W3q/lqEN9HEWy0JGoX2f7+FtniHHodGX3xZ7S7rHVBCjyx6+Iq9HezyNejjfIxFx6J6IFRkp8mEhtZmwLwlVVbO1TB5b1KVml3alhoG3IscExxkSOdIgvjnoLyCC+ygcr6BsItn3J5OaVff3+J0ey9jm0+lCt9N9A1SF1XjlzsR1wHN4B/BjN1WMQtsXDdJIFpl92kXzclaN6qW12BO2xDDUG2sfB57lkoA6d5XTriVNxnrXKkyexPBybFPRlRhtJADH6vGYN9hHB5RostZPxCQkqy6el6JZMts8R8p9qLqRr/VVKRZZrAW1lN9TqCbuw6AxcHf4N3YFs8d45V+yECbmJItttH5Apk138dWdHA9FwuYxlLWZe/va6NoijUo4BV43Uo2eQbX017B+f9AC0u4cloGHU4ttDe76sqczN9mio0YJL8biuEz9vp7GKHUqo5RXom1Bay2dxrbgtc0X1sPnDkPQGN2LJ3pq6JrUos+ttQcyGOw2BWNrvTeuI3qgy33ZdJ6xFFzpfEBmiKKeGokxt1IJyv0LRMOTnzGkfp63/EyS93AP8hKKvek7v/36tz7O6JLHRIsy9h8wCePzVR9SzVzYnoQcdnz7yNR2dmG7QDBQuwcyy1S/gr028/u+/f66KLUdIvoL5VVFcFKtsSHaxiuxnDe2y9Yw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(38070700005)(110136005)(6512007)(53546011)(2906002)(6506007)(2616005)(86362001)(38100700002)(31696002)(82960400001)(122000001)(54906003)(71200400001)(4744005)(5660300002)(4326008)(31686004)(91956017)(8936002)(508600001)(64756008)(6486002)(66556008)(66446008)(66946007)(66476007)(36756003)(316002)(76116006)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWFhMlA0NG5RcnZYNE5zaXpWSzZWTXcyMHZidzFic05ya3RaMG1Ca24xQk5r?=
 =?utf-8?B?YzdsSHZaK3Myc01nZ0loSVJxZENhZHo1TDJkYURaRWFQOHM2TmM3YXg0MkxX?=
 =?utf-8?B?enhONUpVWDllM3JJYVdzN3crazExTTc5eHRXcURUTUtEWDFHdENaNTY1ckFs?=
 =?utf-8?B?OW9XcllsTm5BSEhnYURPTU5abFNqL25pclVkUStXdlh0RFE2ak9pS3RBQm9D?=
 =?utf-8?B?VkQvVDNJaTNiRkx2TWdHSWU1cEp2UDk2dE5DSEUrT2xVUTAxUUxhZFBzZWY5?=
 =?utf-8?B?ZHRtZmRTbER1czRSSjZ2QWg2bXVMRzdrc0UxeTRndlUxYXlRZCt6Z1YvTHlR?=
 =?utf-8?B?L3pNTU5oT0t0WjZ5cmRueklvRmR4OE96K2QvWDArRkxUSkRXdzNyM1p0eFdi?=
 =?utf-8?B?djZhL1liYW1WUzNYWThMcmNsQmpIUUNsenB5K1o0eVB2TCtLNEMxTXFibzFw?=
 =?utf-8?B?WTlzRTNBbFZZSEhCTW9nemU3Q2JhWEpQUEdIM0RKWm5mUERKK1RONG8wL3Rh?=
 =?utf-8?B?TjIrUlRZVVViWDhNT2xJZ2xWdElLUkZlUUhKNzVtNWhVUmVaU1ZhdDVkb0pD?=
 =?utf-8?B?SUxFdktEUnU4RjZTRjlWK0QxNHJhL1lzVDNnYndOT1Z0Z1MvVnRZMlB4TWRa?=
 =?utf-8?B?VEhMMXU4SDdBZ1ZDT1JqUjF5cHZyOUlHMzJ2ZGpwdVcxYWlsSStSZ3lxakQ4?=
 =?utf-8?B?bDBtb25uc1dSeVZrZVd1OWgzc1IzWmNuRXNaTkFaeXJ0c29oUmRiZ3IxUU5z?=
 =?utf-8?B?b1VUakl0RjUzVFJRbmJqSmVZS3NKNllQU3dhVEV5U050TVVmc0tESVlxRnVr?=
 =?utf-8?B?cVRZREhIVTVSM0w2dFBnU3RUdWE0UkVHVWFwbVBqS0FXK0NGaHcweFMzaURU?=
 =?utf-8?B?aUNHQzdpbytrTkQrN2VxSFRhclY3dHNRNDluRUl2S21jWEdOVG1jbWVHTFV3?=
 =?utf-8?B?VmZzWGNpTHB2eFNCRFFsUnhOL09DZjFxb3NXaTcyRUR3MjVGYXU5VFMwaEJx?=
 =?utf-8?B?NXc0QU5kUldzV2VGTDRaNzB5NDdXd2RFSFUxOXNnUjBCejh0SDdNZHA4YjNM?=
 =?utf-8?B?V3RlODNVQXhVc3BaVHQxRzhaTyszWTZTSTBQUi9HVlNFVG1YYUpyaDRrbitz?=
 =?utf-8?B?WGJhbzJicDl4NnZ2bEtmdjZMcHBUK2VXa2ZScVJpT1FpdS9QRitmOGcwQ1Zq?=
 =?utf-8?B?MDQ2U3FnQjVUb3RqS1VvbGpIcklqZDNRU0VSVVB6MlpYYVR0OTBpK2o4d20y?=
 =?utf-8?B?QnBMeFd0cnAvTW1zbVN2Y0MyaDBST0c3dkx4ZnFVNTJZRDFkdG8zMCtnVXBW?=
 =?utf-8?B?Qys4ZnI2V211cmFRa3RNMVllV3M2RzZkWWc4Tlh1SnpUNlN3TC9XWk4xYnVR?=
 =?utf-8?B?WG41LzFVa2ZZTi8xSGdQaisrT09pZDV6eEtIR2RzM0lFcnpidGVFZ0ZGYTY2?=
 =?utf-8?B?eGRqcE5MeHNxSXZkY1gxdm9xdEs4aUF5ZXJTbXR2STFkM05ZTmpWZmUxNTFC?=
 =?utf-8?B?eFJoZ096Q2wzNlIxZStOQjZla0xTK1JLWWsvSmFFb1F0aTZRUW4xajNCeU9n?=
 =?utf-8?B?TUR0d3E5aHhTMXY0Z0NYWmpwbEljcUEvci9tcmJ0Q0hOZllTQU1FN1ZLVkNl?=
 =?utf-8?B?NGZSSFFma1JVVU4vU1Q1Z2FGZXgvQnJlakYxbUJzZDF0aDJZVEM4ZlNWcWpM?=
 =?utf-8?B?Q1FqUnpjTGk3QzVEdFRzYkhHcjZ0ZWJaTnpOdFdBYk1JVDZJR3djUm5IMS9L?=
 =?utf-8?B?NFl5bzRPMWQyZDZuaHYvMG1tUXpnVVhSK1JDSW5zL3ZBZTRrN1BxWVNLdCsx?=
 =?utf-8?B?MTJDNEZIRFhpTG0rRDU5Y2xKRGtyVEIrVjFwc3QyRVcxQjNLVHNwT2ZUb2w0?=
 =?utf-8?B?aHJOempQYlEvMitxUDBiaW8rM3ZnWEZJRlJ0UzdiSHZJZkNwR2cyempWMGoy?=
 =?utf-8?B?ZHIxZ1FnMTZkSmRjN2Z0V1lIZXMvcTRyb3N1TWg1R3VsTUh1bFFBUjZ1R283?=
 =?utf-8?B?YStpcFNOSk1JQ3dRS1QrWTA2K2I5cUhCODVYRm8rczlianovOEEzUkMrNE9N?=
 =?utf-8?B?VTY4elA4YThuQWx6Ty9DdzVCQ3JueFpkM3RpM0ZaZXZzalZjUlRsdkhlMVJC?=
 =?utf-8?B?WEs3S1BaZmp2T1d0WFRrSU1vSVArNzYvK2NRTC9RLzJRVEFJZ3pNNWY2MzJ2?=
 =?utf-8?B?c1hLUktibkxKOUFNRHd2YVhDdnNKazhId1lTYzlrR3BFbnJBZ2dZQXpUY1Bj?=
 =?utf-8?B?VkZSTzZxSVBKbXVpU1RvMkZCSnVBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72454B80150A934AA0FD3674976F1FA8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23290885-31a7-4fdd-c282-08d9fc623b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 15:35:07.6687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EkGWP3uaTMdPEDeTMHrqQO+9E2FCA7Mq1Zpdx+CPWCLwL7AP6nDZ1DQbZwcIohFWm/UcqxlMKlVa6SDj/yMVfe9Ue+N8HZ/2f8kCVrfD6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5954
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAxMzo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+IGluZGV4IDY0NDM5
NDM4ODkuLjI0MjNkOWY0OTAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiAr
KysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gQEAgLTM1Myw3ICszNTMsOSBAQCBjb25maWcgQ1JZ
UFRPDQo+ICBjb25maWcgTElWRVBBVENIDQo+ICAJYm9vbCAiTGl2ZSBwYXRjaGluZyBzdXBwb3J0
Ig0KPiAgCWRlZmF1bHQgWDg2DQo+IC0JZGVwZW5kcyBvbiAiJChYRU5fSEFTX0JVSUxEX0lEKSIg
PSAieSINCj4gKwlkZXBlbmRzIG9uICIkKFhFTl9IQVNfQlVJTERfSUQpIiA9ICJ5IiAmJiBcDQo+
ICsJICAgICAgICAgICAkKGNjLW9wdGlvbiwtZmZ1bmN0aW9uLXNlY3Rpb25zKSAmJiBcDQo+ICsJ
ICAgICAgICAgICAkKGNjLW9wdGlvbiwtZmRhdGEtc2VjdGlvbnMpDQoNCmNjLW9wdGlvbiBjYW4g
dGFrZSBtdWx0aXBsZSwgc28ganVzdCAkKGNjLW9wdGlvbiwtZmZ1bmN0aW9uLXNlY3Rpb25zDQot
ZmRhdGEtc2VjdGlvbnMpDQoNCkhvd2V2ZXIsIHdlIGluIHByYWN0aWNlIHdhbnQgdGhlc2UgaW4g
Y29tYmluYXRpb24gd2l0aCAkKExEKQ0KLS1nYy1zZWN0aW9ucyBhbnl3YXkgYWx0aG91Z2ggdGhh
dCB3YW50cyB0byBiZSBzZXBhcmF0ZWx5IGNvbmZpZ3VyYWJsZS4NCg0KVGhlcmVmb3JlLCB3ZSBw
cm9iYWJseSB3YW50IHNvbWV0aGluZyBsaWtlOg0KDQpjb25maWcgRlVOQ19TRUNUSU9OUw0KwqDC
oMKgIGJvb2wNCg0KY29uZmlnIExJVkVQQVRDSA0KwqDCoMKgIHNlbGVjdHMgRlVOQ19TRUNUSU9O
Uw0KDQpvciBzbywgc28gaW4gdGhlIGZ1dHVyZSB3ZSBjYW4gYWRkICJjb25maWcgTERfR0NfU0VD
VElPTlMiIHdoaWNoIGFsc28NCnNlbGVjdHMgRlVOQ19TRUNUSU9OUy4NCg0KVGhvdWdodHM/DQoN
Cn5BbmRyZXcNCg==

