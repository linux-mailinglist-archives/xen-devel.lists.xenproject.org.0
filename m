Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019F59055C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 19:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385047.620603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBcb-0007f2-G3; Thu, 11 Aug 2022 17:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385047.620603; Thu, 11 Aug 2022 17:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBcb-0007bv-DA; Thu, 11 Aug 2022 17:05:25 +0000
Received: by outflank-mailman (input) for mailman id 385047;
 Thu, 11 Aug 2022 17:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMBcZ-0007bp-Rs
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 17:05:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c82583bc-1997-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 19:05:22 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 13:05:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5588.namprd03.prod.outlook.com (2603:10b6:208:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 17:05:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 17:05:17 +0000
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
X-Inumbo-ID: c82583bc-1997-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660237522;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ei7UImJjUhQiyB8Z2knWCeFrYrAfCUgsrtREqc3wWL4=;
  b=amlWxmngRiKqsFXeZFmRciIQYBlPfK7HszhHVWVOxcM6WPgJGmymZBJN
   izdq0GVvSDVzrTlN/JEXTV6YO9+OhqiU30bzPNBLL42B/cUK55ZRFVY9h
   eRqXJir0P7GPvyTRHm7yzENJuG5zGlJtSJc60vyCNczNLrw7OQpn0CS37
   A=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 78335814
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:er7/36jn6qMukWomouesw+hJX161VREKZh0ujC45NGQN5FlHY01je
 htvDDyBPfiIamP1Kd0iaY7ipBkOvcWDnIA1TQs4qi1gFCob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSr4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eP6cn5cB4Gj512
 OE5GDtdYzC8o9qfz+fuIgVsrpxLwMjDGqo64ysl5xeJSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9RTM+vdfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i383bSSzXqnMG4UPODk6KZBuQ2w/FUeLxQReX6UpsazkkHrDrqzL
 GRRoELCt5Ma9kWtQsPsQh6Qr3uNvxpaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLR5FvaCRSHmd3qyJtj70Mi8QRUcdYQcUQA1D5MPsyLzflTrKR9dnVaSz3tv8HGiqx
 yjQ9XdjwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:PVQdTq5UaohCK2YtLQPXweCCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FXQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMk5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvvn+9Ua1wWR4S2rpXV9
 WGP/usosq+tmnqNkwxi1MfhOBEmE5DRituDHJy4fB9mAIm4UyRh3FouPD32E1wtK7VAqM0md
 gteM5T5c5zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCZgOlZaXkaYzve0PsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGa+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8XXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummkZ5osQD2LwXtdKtmrwwFI8vl9CmRliHlntX2poseWNDZFrqs6OE
 NjPbKPqNLImVWL
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="78335814"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqbvuZkGFBvQDZ1RfK1u0vAa32IpnZYzYviXZwoZrDf0fkjnt1AYKWYA9gOpM89IuCib8s+PFSN9C6hJEJ1vKjJHRkqML5va4ycnBGa/GRnRxYkdyx3sgGRf8bUDAsaWcx8fLMul/3MI73hQFUQm3OHY5QrTL+/Fp2nzI9ijMksDa2nBK79HQSE0Vyfqs8Gh0Y8HKrTRCSlbZYU/L8YVposabscgej6DfJgG20GZgHxrHzLIwL1HfEwQsrTtUF16bpa4PT/f1SqoV4oPvVre0sE9xjbu9nSOpsNUxBj1IRUvjv+5u+W1KV4HLeVeQ7pU4IYTFxD1qKdhapZcVEYcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ei7UImJjUhQiyB8Z2knWCeFrYrAfCUgsrtREqc3wWL4=;
 b=jB+5M5dWdIZqrqv1zlLESxhhDdKONFRi9OXjSF1ckJzZpWQjsY1dKLv9Xub1jJipfWhkcOS2bPjYZitIlH+GVlWoubvSeZX8K2B6vWwmcccC4zRzETQoCEmG7Kmf/irKzQBQasAm08MDmxtpYITPcPHnmL3wGKkjekOCeOzWZkkd6WgRBpQ9QjT3niGZX9hSxmVTXnRsZykBzcAD8+f2TQZvGhH/f0IFw5B33EOp1cc7cb4n0GhpSjlIDqr9h7KAvl8BJJyGdVj3qCKnqb/5OCaGwzMTEAxO8VEgfRLooOeWRctsaUE17qehEzkJ6KLZXdqcsKrrvvu5D3FH7IaohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei7UImJjUhQiyB8Z2knWCeFrYrAfCUgsrtREqc3wWL4=;
 b=JXMZbfOstnt4NdnM5aYd3DmNqJDW3cnODkuwlGw1x9FDGwqy+icNhn4P4EUUEeJiyEn2uteagm4dx3h0hvRNeAThePFskvQb68AjSVE+jWbcR10Lx8tVbcLluyQHMC7oMLCi92TioH1ZvfCnnRaYUgNrM1oH5QH5YxsJhKPpXuc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where possible
Thread-Topic: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where
 possible
Thread-Index: AQHYrBGVOnpsJ3EHKEGHOuDU3gegNK2nAqkAgALuQgA=
Date: Thu, 11 Aug 2022 17:05:17 +0000
Message-ID: <4254c2bb-6f54-a453-7ab9-9ba5b4de66e4@citrix.com>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
 <20220809170016.25148-3-andrew.cooper3@citrix.com>
 <CAKf6xpurnYVf-xz4VcFwq3uwbqBowyWJjgP=oLVZU3kWKtEWDg@mail.gmail.com>
In-Reply-To:
 <CAKf6xpurnYVf-xz4VcFwq3uwbqBowyWJjgP=oLVZU3kWKtEWDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae796c72-3dc1-4aea-5558-08da7bbbaa3b
x-ms-traffictypediagnostic: BLAPR03MB5588:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VyPot0AwKoeVCx65mMcoSGPUuQ1+qtrUTWOEz2PtnVGb6Brzr4H5jlDjIDZtRi+1kqrLCpkvNZJe3UPC4n8ianYIR6TJGhnlplPK2nqk++kNsl5vWJhZWIkBkIguMs5RiI9tKcd3sH40yU6AEH1yi0NQ+0Jcy405hh6UEOOq84Smd5dOqWlZAoaWxCf0zfFn2PV50DE4vT0rOYUPtD4o4Kz1e9dIziugOJVXm6QdS2cCHexFaCMv0uvOobcqlokZeU08V2qc/jCC5aGlik73vNSYWcJ4l4yf7NGskv+oUcaOM7f5HqWhMTOTUvB3BGVdSdqjuiAqS79iXBX1ad0ZsucLcd9sqw667xdF+0je8kMwYhY0bRm9Zf3rqQmOCmaxHeJyxM2B/GfbSwKNxeGgq0UesseC+rJvylsIIk4r5U/6+eKbDAJ0oyraeGYs6T5TPLfzfH8d0EubYCgH+Yesv3zPyU1qr0Mwi1dVsDZPVy5Glq1wSUXYTu5f7kupoelgMIj1mgMz21AzFZ6ubzarhCTPJMJk8CD9JGcVKfQmd7fS177T7D/sZEFD1cVHiQCNPJbHvWvHapq13A+9fZi2eWZkayn3iRNT4SixeysVYHivjJV5HksRFJAzqY7bGI+O3ty4NgFT5BdtQ2q74gFUk05CNwZ+aGEy4r3NXP3ua70DGfeKAjwYF/wtLkglvhcxvWVccuH87IK3TQv7K798tAqz+yCRdNmMigzbUAHZ076IUsEhc3XRdx4IUItENy1rcY4IpMQfqbkXOe85wcykURfc8wJrYeuEvRVrW4ygewJyZtAp/uTiCvarevCkIdOUbhptP93G8eshi8jIySN95tOge4PQhk7u/2DVn/2s+gzJAYAHRPBkfS9nfVg40p+s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(2616005)(186003)(83380400001)(82960400001)(38070700005)(38100700002)(122000001)(478600001)(71200400001)(6486002)(41300700001)(91956017)(76116006)(316002)(54906003)(5660300002)(6916009)(2906002)(6512007)(53546011)(26005)(66446008)(66946007)(8936002)(64756008)(8676002)(66556008)(36756003)(4326008)(31696002)(31686004)(6506007)(66476007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmZZZmc2RkxVL1g5NVJHWndINHdOSi8xSzlaV0dYYnNQUCtPV0c4V1RSWHdX?=
 =?utf-8?B?UjRQRWJxNFcrTDVKTWprUGNnQ1ExUzdhK3VvMEZHRlRKeGMxQXJLdi9lS3d2?=
 =?utf-8?B?L1czUmVXVE1zbEVZbXRtUXc5ZS9zeDdmTzNVOExiSnk0ZmZ1ZmNOa3ZHcFpy?=
 =?utf-8?B?Rm95TmIxTzNSVU0ya1pEZ25RTXFuT0FrWGRMamNCK3NLYzNXVmUzcmlSWTNo?=
 =?utf-8?B?bzZjQUFSdmpPZlNFcmN5RVBtNDd4VTJ6K1REVzZsY2ozNjVpOVpFcTVCUnJu?=
 =?utf-8?B?dU1qVytZcUN6ck0rWG1SN2ZtYmdUb2o1RHYwMksrcTNJNWtIUWxLNTJYSGlw?=
 =?utf-8?B?QWhnNU1BQ2R0VGwwRmcxc253WUNWd2ZkZjhrNHdIN1RTNGxpWEg0azJ4bVBF?=
 =?utf-8?B?c0p5dE1FMUJGMU42Z1Fac0VWMjBIVTkyMmZmdnhYVktWZ2hoOHZlMjBPalhV?=
 =?utf-8?B?UklvZTVrMHc3M3ZwbU9TMTdta3lKbWE4QWpjQjdJUEFWYjZyTURBall2Qnlk?=
 =?utf-8?B?S1NmcE5OVVBqbWR1Zk1La3NjVzRoZTZ0Y3ZlcnJTSTlMbkZ6Qk9rMEdnR0Zr?=
 =?utf-8?B?QkphU1J5c2ZzcFFKd3FLRTdFVGNMaHNuQ05jZFg3cFhveC9adWhxSktUMDBw?=
 =?utf-8?B?Qmp2ZWtOWmZ3bkowYklYU1ZZNDkvcDArT1AwTkljTm56SnZJemMrZ2hxTXdS?=
 =?utf-8?B?dktzdmhFdUhSMVZlTWltRGVRQ3dSZnN1TkRsYXp2VVRUWUVaOXpWUkVYVnU5?=
 =?utf-8?B?RDhjWndZeEMvTUFiaCtiZUdqczMvVU9SR1RjV1BST28zTmpaZVQ0Y0pFQlND?=
 =?utf-8?B?dUtiUVJSREdjcG5BU0RXYURxY3o4dVozQ1RUdVZ5QXgvUTRyY1d2bDcrUFJ5?=
 =?utf-8?B?ME1KcXRWd1VYQkl4RGRVelh2UnF0V3dhdnlEa2RnTUgram8ySEcybjNHU1Ro?=
 =?utf-8?B?TXo3V3AxbGQxTUhHNzROT1hzRS9jUlE4ZjV0N1o3SFd4Vkl2c00yRlVIUnU2?=
 =?utf-8?B?SkpUYlBBUTNsUzZHUE56SmR5b2N0eVVaWm5jM3U3WCtDSzJNY2FyMG00eWNh?=
 =?utf-8?B?ZFZGclUwS3FIWGcxVVl0cXdXaERMZ015OHNXR0JWamtiaC83QlVWN1JSbUxK?=
 =?utf-8?B?b21DYk5QNS9kN0kxRzZKVGtDVzZPS1MzanB3Zkt2RW9VeExMSGFiWkNnMkd5?=
 =?utf-8?B?N3phc2hUbmVDcWRjTkF2aVU2QStJSllMMnIrbEorVTFEaU5QTTkwNG1ncnYx?=
 =?utf-8?B?L2VQZER5TThTUXBNNEt0bVl1QXZGTEpwSVpXeFlaM0pnV3N2YWVLcFcvYnZw?=
 =?utf-8?B?cG14ZzEwbXNNZHdtU0VxWXdUaDdZbElodlAvVzVyMlFSeHNheTZWbzJhSEhS?=
 =?utf-8?B?aVFzajRQZlFXUGhjUTlJYm5XOHhwY09CZyt6Vkd3c1UyVTdxQlJmMXM1RnE0?=
 =?utf-8?B?NjNZdTZXc3VkWlRtelE5UEIzeFJicW1ob1lOam04azNSMi9YZ0JKckxramVz?=
 =?utf-8?B?cUFneUNZWW0vZ3l6cE55VzhvYjF1N3NZSkxyYVIwSmVqOVpYbjlPZHhSSWJJ?=
 =?utf-8?B?OWdDL3gxQzNoTVRMWDFEUmZTWW5KaXJHUkRnZ3IxcXhXK0k1eWlwK0dmaGVy?=
 =?utf-8?B?RHp1aU5JTHdmZm9YQTBFd1VwaCswVDhBbXFzRFhoV1ZSc2d2cU1yZDBKSW12?=
 =?utf-8?B?VDVjSDJDTG0ydlV3ejJneDFia1dWU0NrWUdlcWdTK0w2bzNSaW5PbFp2dVNE?=
 =?utf-8?B?VEw3OXlkRnZxWVhsQkMwbm5TVk54ZEttYU5hcDVjeFhxS1VGWTFZN2Z0YWNC?=
 =?utf-8?B?TWdGczB1OXo1ejFIVU05R0NFS08yTklFdUJtdlpNZjd2TU1kQ3VMMmpLTlVm?=
 =?utf-8?B?T3B1SjZ0aGxGSTNrU0xPRjNzWTArenNXV0ZmV2lzLzM3bmdvUzZZRXkvRE9p?=
 =?utf-8?B?OHhrZXJITDhDbnFZV0lrQzVHSUtwMlpoQUQxM1NHcDZQMWtWR3JuTU1iR3Y3?=
 =?utf-8?B?bFM4eDV5ZUpHbHdFaHExdXpPODRnSE9oRm9WVmZQN0R3elVrektXaGhHK0JN?=
 =?utf-8?B?S2tFd2o4MFBDYThQSC83bTEvZWY2KzVIbXloTE5lcVFlTVZvbXB0M29NUVlt?=
 =?utf-8?B?LzdzMTJFRTVEbWhMajdNS3BqaXhBZzVkNnhOQzFrUzRhZG5BTmNIZGsrNUt4?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6815F1A3AAA2E144A65C24ED37AFB21E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3cxg4HmKaFEtXYDpKlvGYwKCPzrL3cKeYXSJC92osV/w2dGMPu2l2YAv9CEc4cz5eXgQysXTmn5zKVeIFUdGMpIYPPpumDDmEbsk2JEjPrMelxCGEEFzw5RKbVCtqnq3iHxzm2F75Ll6Hlg/sy4P7M1j4JXUCg1eO2M5xy3YqouhnkdQ2ZFUjAyH1jdQWaYlHeRQ2wK/OEGjoD72lhf7hQhctkrOaNsVyiX7dZmp97YGicR0vdmG3yglZkp2LZ49SrJO8VFDJmvYWlkLvB4INt7FUs85Ix4d5RZ4DBrQrLBk4gkvkAkwkmoEkcZSxOjh36i7L6+riO3eikuqe/22KrDd06LoHudUW/m6U9PiMoN/R4r1KKAFhh3g2+kEyhJ9dZvc4arUKFbcGOMcne+ikaR9g9nz7hTkvQbb/7Gvm8EeGA1M3Ufr/apbL+Bk8AFtqRwDxj6PvOGLt9O0tgWO3nnsPp5vyDhcXGw4qgC6MqHxcuzlx+3ss98j3bhF8AagPnJ+DIXQEoRrO+1hK2+BtPs/yjJSFTDUelI+E5To9dhVqdYMIvXochdhslvuLml7hqb1CKe8iPc9z0g9+WOtFuvDaSCEAueVSzJkuki0InUKvKzDoNpy/aghx7C3Bt4JkFd6G+ELqvzdktDreh+6bLrwz2t+2tCCSuEEI7YVREB245WvBMWARfL+LN9bDzGc2gtHPZnlI+Lly4cJNAtogZd3+CWC6sc2a+y58SNao44jqeS9WNtV9zP6e7uvC12CTK2l1sebD74ZAYm7T2yr9HEqwT9+LV+3Zy5wRX9/PNy8gkuqKdSWiIDgUPe7/s2OYBRfcVXdwDc29wqF2+XkeZj3AWfyaq/NjZT4otXlofs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae796c72-3dc1-4aea-5558-08da7bbbaa3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 17:05:17.1306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LMwxutKBulzfqK5Rtr5vCVEKXq0ljNt6ABL9mW3J+15JouG5eU9X3WoYrmYImMtW1q96H/du7+izs1ppFCvewmf0034ENGz3eqrTPSjYcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5588

T24gMDkvMDgvMjAyMiAyMToyMCwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gT24gVHVlLCBBdWcg
OSwgMjAyMiBhdCAxOjAxIFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4+IGluZGV4IDE3ZTEwMzE4OGE1My4uOGE2YTVj
ZjIwNTI1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+PiBAQCAtMzkzNCw4ICszOTM0LDI0IEBA
IHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4g
IHsNCj4+ICAgICAgdW5zaWduZWQgbG9uZyBleGl0X3F1YWxpZmljYXRpb24sIGV4aXRfcmVhc29u
LCBpZHR2X2luZm8sIGludHJfaW5mbyA9IDA7DQo+PiAgICAgIHVuc2lnbmVkIGludCB2ZWN0b3Ig
PSAwLCBtb2RlOw0KPj4gLSAgICBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7DQo+PiAtICAgIHN0
cnVjdCBkb21haW4gKmN1cnJkID0gdi0+ZG9tYWluOw0KPj4gKyAgICBzdHJ1Y3QgdmNwdSAqdjsN
Cj4+ICsgICAgc3RydWN0IGRvbWFpbiAqY3VycmQ7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAg
ICAqIFRvIG1pdGlnYXRlIFBvc3QtQmFycmllciBSU0Igc3BlY3VsYXRpb24sIHdlIG11c3QgZm9y
Y2Ugb25lIENBTEwNCj4+ICsgICAgICogaW5zdHJ1Y3Rpb24gdG8gcmV0aXJlIGJlZm9yZSBsZXR0
aW5nIGEgUkVUIGluc3RydWN0aW9uIGV4ZWN1dGUuDQo+IEkgdGhpbmsgaXQgd291bGQgYmUgY2xl
YXJlciBpZiB0aGlzIGNvbW1lbnQgbWVudGlvbmVkIExGRU5DRSBsaWtlIHRoZQ0KPiBjb21taXQg
bWVzc2FnZSBkb2VzLiAgTG9va2luZyBhdCB0aGlzIGNoYW5nZSB3aXRob3V0IHRoZSBjb21taXQN
Cj4gbWVzc2FnZSB0aGUgY29ubmVjdGlvbiBpcyBub3Qgb2J2aW91cyB0byBtZSBhdCBsZWFzdC4g
IE1heWJlICJ3ZSBtdXN0DQo+IGZvcmNlIG9uZSBDQUxMIGluc3RydWN0aW9uIHRvIHJldGlyZSAo
d2l0aCBMRkVOQ0UpIGJlZm9yZSBsZXR0aW5nIGENCj4gUkVUIGluc3RydWN0aW9uIGV4ZWN1dGUi
Pw0KDQpXaGlsZSBJJ20gc3ltcGF0aGV0aWMgdG8gdHJ5aW5nIHRvIG1ha2UgdGhpcyBlYXNpZXIg
dG8gZm9sbG93LCB0aHJvd2luZw0KZXh0cmEgTEZFTkNFJ3MgYXJvdW5kIGlzbid0IHRoZSByaWdo
dCB3YXkgZm9yd2FyZCBJTU8uDQoNCkxGRU5DRSAqaXMqIHRoZSBiYXNpcyBvZiBhIGxvdCBvZiBz
b2Z0d2FyZSBtaXRpZ2F0aW9ucywgYmVjYXVzZSBpdCBoYXMNCmJlZW4gc3BlY2lmaWVkIGJ5IElu
dGVsIGFuZCBBTUQgdG8gYWxzbyBiZSBhIGRpc3BhdGNoIGJhcnJpZXIuDQoNClRoaXMgaGFzIGJl
ZW4gY292ZXJlZCBpbiBtdWx0aXBsZSB3aGl0ZXBhcGVycyBmcm9tIGJvdGggdmVuZG9ycywgYW5k
IGhhcw0KYmVlbiB1cGRhdGVkIGluIHRoZSBtYWluIG1hbnVhbHMgZm9yIDQgeWVhcnMgb3Igbm93
IG5vdy4NCg0KfkFuZHJldw0K

