Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F109A49515E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259099.446937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIi-0002g7-Mn; Thu, 20 Jan 2022 15:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259099.446937; Thu, 20 Jan 2022 15:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZIi-0002dG-I6; Thu, 20 Jan 2022 15:24:36 +0000
Received: by outflank-mailman (input) for mailman id 259099;
 Thu, 20 Jan 2022 15:24:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZIh-0002If-5F
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:24:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 111ae513-7a05-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 16:24:33 +0100 (CET)
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
X-Inumbo-ID: 111ae513-7a05-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642692273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pdxlQzLLLdqMBmYIq21jztzs3Sm4F2L99O2dYBy1tGo=;
  b=Hns3Yv4Rk+S8beXVoUTfbmfX0jeEoerhq60k3Q6ZdfnIDFTE9JgL0JnJ
   jHJkKb32vHPfGPpEPu62cxe8IWUlwlSDsU98dzYKsPORyG9cWyI+rRBSU
   9vVXgGsKmF8aaShs3ZhHW6oANDaSOKX8urb/GC6fKdVT0ypIatzoSW/F0
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GsDhXFmZr69eVszDg7x+v1nEvaUn6bhScPyfOd/mkKJy5u543Hgp/I4Bd7PWoerUnUTMj2lMRU
 XqPg6zGjwUYFuC141pbtskOEa9SqPit+DFO0vrmPnP3jbQR7vsDEE4JV4ywcAwuUVNisPo3U5x
 NnTwDZ99Akbm6iMMrCJPMMLVyZM78LGFl+wdKmNV/6+cSaIngUsRCNA2D4hDdQhSlKfWPZeBKX
 kyjhvLBOrwynYyNpuPfdf19yt5/f6sEb9DbSg/VK3LG0+/R89MXNxc54p72ObSmXZnqtFlg7bB
 bt4HLCwkme0wO5Mqrycwr+aL
X-SBRS: 5.2
X-MesageID: 62819047
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D/CauqLVxQv7plCqFE+RTpIlxSXFcZb7ZxGr2PjKsXjdYENS3z1Sy
 zEXXWnSafyJZGPzcogkPo62phgC7MDWytBkSgdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5w7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2pmsxD5
 Pp/6aCfQD8YMb3Rw/4GDCVhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uv48BjW9s2aiiG97ne
 pFCVwZlbi7rIDRvHAcZKYwmsd6R0yyXnzpw9wvO+PtfD3Lo5A5s1LngNvLFd9rMQt9a9m6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvjUZ8WPK218LhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3peRsQGeFhpJEUALXR4LXRZe+cK8nLhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab8P9TwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8Vwn9hO0yT6FWy13N2YDB01WirjUWW4C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFXZpX4+ORDMhjCFfK0QfUcXY
 8vznSGEVi5yNEia5GDuG7d1PUEDm0jSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOcwxiBSVlVPje9pwGHsbec1EOMDxwVJfsLUYJJtYNc1J9zLmYp
 xlQmyZwlTLCuJEwAVzaMy84MOK2A88XQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN02p1gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:AAMgsawrqdq7ekTpSHQoKrPxtuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZq6z+8L3WBxB8bfYOCCggqVxe5ZnPLfKlHbakjDH6tmpN
 1dmstFea3N5DpB/L7HCWCDer5KqrT3k9HLuQ6d9QYRcegDUdAQ0+4TMHf8LqQZfngjOXJvf6
 DsmPav6gDQM0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF7d2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuBalqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw3RjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXt
 WGNPusp8q+TGnqLUww5gJUsZmRtzUIb1i7q3E5y4yoO2M8pgE886MarPZv6EvouqhNDKWs3N
 60QJiAoos+OfP+XZgNd9vpfvHHf1AlOSi8S156AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62819047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkvYEg2hSMrh/6MtfyT5eY8SZB5WXFJRosoiM3JUs0r3yvXQg1XQeUdyh3LaUAn1e0fnSxqDJQgp4Q0d/+pWDya8NqmtkxxprOC7gEcV4+xI30+lOTHKfNI2Gyg8XTbp6k8EyWDb1y46yRJcOnR4rW2Lzo5AH/5D7UyqMibMT2DBRd+6iXJYNUh7Q09R2myB8XvCcBsI1FYr+veyegZf02UwrdosfWcstUUn0xWEfmOAPtZb8qGikb3gvePhUfl+u4V+VAx2YjfzbgI3RyauSx9A1IyuyiRTgGEDZu5Fg9Dl7kTlfraaT6Aj3C+Bf11g28WC+FOEpMEpciiYWve1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoF6XYV9k/waGwdbkp6UIajlOGJSYD9wsXW9TkdA094=;
 b=Y7oKeoS8KEkC7zk9P6bz4TntTAi0jIfEfCL53HKyfgFd2Eb2byVuO9XOvMhg4oRnOMMiYxYqeEm2pKN/9mdr4U30zdKkAeSK8IJslcGp9DcNki/7GWptWSHWnRmf/MU0zLdQ1LscRCL7w0xMNsznjCs4FyMToj2z3bj/T7954nyxe//urPncgr6uSM1HNpuxm6cbqWhfRU0MDjhfOyUjLFPmGn5AkmS/JJ7UTy1G8zkrkNTX+dQReFWEYV6NRqGzPe6prb8K4aOFRtDauM6Sg8t86Y0o8UuhqM7u4+WQsH4isU0KMJXwO5uWTuo2KVsYRIWRUfbLgGaE3EGAwyMMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoF6XYV9k/waGwdbkp6UIajlOGJSYD9wsXW9TkdA094=;
 b=hoV2dqfZUa+qPHYsyzFe+4Zy31T3e2CYIvqTsIOMFS5fskA4PzAhcfTDqkYSBsxNFBmPqGGk+NkuEQ+7jj/1s7gs0AY2re+LjnwnpJZJ5pe2y+ctPXfarOW5W33XoZtmwkG1xMFD6HZuQeYP938iK56lhwiqyd00NA6RfncQKc0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH 2/3] x86/vmsi: add support for extended destination ID in address field
Date: Thu, 20 Jan 2022 16:23:18 +0100
Message-ID: <20220120152319.7448-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120152319.7448-1-roger.pau@citrix.com>
References: <20220120152319.7448-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb106a66-8c60-4d32-0ca6-08d9dc28f224
X-MS-TrafficTypeDiagnostic: BN7PR03MB3681:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3681136CAE152967F8390E298F5A9@BN7PR03MB3681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: agARpoKQ+TSIVO96JM3GsGSYuJI0xuXEsD/SlgajnJDpXOUf6Ru/VeU3Xgjh3sbWF8CHavbuo66NIIvtqtppnUdsKbwuUlHyxKsvll6AroBRCdQpm0b2/bus4FiIntXToJ7bJKpNwNy+kdGDRtteAfueC28fQc/Wf2z+7LpOm9o0f7u1ooECcLspX64E8xC2/qlZhh6ymLGYJd/7eVMi6CJGPz1ORt5zwZoi05SPdaweL76tpXQU/dorzVFQV574QMBaAxjn0P/Q/XoCwsqGMnMnVJk0jg4kkZs60iq7cKHTB6iumF6RDWAS9y8Z8WhPbpMuImtTuni14elaoJ8Ll2ApLiTSIv9Xiq90YvMBpDujeip355h+HWWwuoS4HiYXbQMuw4AVUNqsDQt69SAq6k2lFxOCHRD7G5Ut3Ze44CuTtq+AXpJe/5LWOAqB7t58MretekJAMJ6nWeGJNnIi8OWHV8Amx4Wu5GT2Oqz6vYd1+2p6ii5tHwbmvWBbfHxM1OZjxvW7UFT+/36ptJuheZCalCsEKmL4gHh+yQ58CCWXFaw79rVYrAfLAzlXqdeCJpWX/0GsR2A4Z34OcPaOV1ozP35b8qegiTc5f1KSmeTBkzBlD1jQ0jk5PDZ4yCb+KacSGhRGtSKhDDJ8EhAaGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(6666004)(1076003)(508600001)(66476007)(54906003)(66556008)(2906002)(6512007)(82960400001)(8936002)(38100700002)(83380400001)(5660300002)(36756003)(26005)(6916009)(186003)(316002)(6506007)(6486002)(86362001)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3ZmSXdmY01wWUpNbGJwUHRJb29STkZrMEFKeWNJOHlrQlAzOE9wcXVEbmh6?=
 =?utf-8?B?VmxtOERueEN6cGRFMWh0dWF5TGVsS082UzNzUlNUMURKTTVRRHNDM3JDSEpJ?=
 =?utf-8?B?NTYrQU9PdHZJTmJ6eWNYc0M5K2VoK2YvYm9yd2RNL2YyTFZJa3d0Y1lUYTRr?=
 =?utf-8?B?dHptamxHNjRVcUo1Z3ZuYWNHM3Y3c1ZDdllGSGxCb1N4ZktnWTVqTGJFcExW?=
 =?utf-8?B?RWhUT3ZCRlhSY3d4dHU2YjFqYUtuUHFVV1RvelEwaEFrNk9MOUNOK1hMVVIy?=
 =?utf-8?B?VTQ2RTlDZVNnWk5zUjRVRlAwS1BpZFQxWGsyeE01TzFVclhJaWh0MHdSSm1k?=
 =?utf-8?B?SnY0VWtsVDNzeVJoa0l6SXJqc0FST0lKUTNNYXZ0ZkV0QmFlbURITkgrTTNP?=
 =?utf-8?B?NEFsTHVhdDU3K0lNV1A1RGt3SDhrVGdPdzdlcWo1QXB0U1N0ZEpmVVR6WEJO?=
 =?utf-8?B?b0dDRTEwK3Z6N3BidGRpeG5mb1djNDlMaWVLMC8vcWlVZTdlcFBaOEtodmRC?=
 =?utf-8?B?c1ZGdlU3K29rSUxuS0lPbmRQOW1RbFBZZ240aXV3cXVJbjNyYk0xOStPa2Yz?=
 =?utf-8?B?RkJtdEUvSlpucyszMWlIU1phN1F3MzY2SGE5aWRaMFdvN3c0TDE5OFJWK2NW?=
 =?utf-8?B?Nnk4WldUa0lzeXZJSG9qdjRDb2hyNW5OdFVNOW9lUEZsYVdzZnNQUFdrVmth?=
 =?utf-8?B?TTE5bU9MS2JyOUlUaUZEWVdhVUNIRGJqNUQ5czlxNFdkQkNJbGdGZkNWWlB2?=
 =?utf-8?B?RzhYcEJJWGgxaHQxWkdKd1B0ZFVIaWN6UWp3SHBnNzh0VWpFbXpENVIvcWM2?=
 =?utf-8?B?MG00QkJ0eUh1U1ZmT1JHRHRxeXpmcmpwazNEcytGa2VYQ2c2UzlwQ0lGNk9W?=
 =?utf-8?B?VHJUVUlHTGx3Z0RmUk1UeUtteCtIR29LNEhFeVZwVytWK2xyMndqdDVsUUlH?=
 =?utf-8?B?Z1FNMUMvL1BBdEE4c0FxelczSVNUek84QkFsYjFyV0l0bVhjNXNUcURPK0Z0?=
 =?utf-8?B?SEN2UkN4bFY4aFQ3dGdiQ3RyZkU0VVBQQlFmYzYvRFhGMWFPQWJUQVFtcHF0?=
 =?utf-8?B?dlk0VGZjbTBFNTBRcmcyT1JLQlhVenRGeDV5SW1Pb01aQWZPNnQ1Vk9zZTlK?=
 =?utf-8?B?RndsdjRxS0ordmVkQS8zY3BTb0I3bm1ZNzZjZ2djckZ3eVo0K0w3MHkvRjRx?=
 =?utf-8?B?QnZ5TzJMMXgzRWR0enYwb3lLZ09lcXMyaXJPRkkzV0pYRk81WHFFajkvdmZT?=
 =?utf-8?B?aEg2aUFQT2xoMU01L0J2LzFUMlFwa1VMVS9zemVQaWZKRHBMYXlDVVhZNnJ5?=
 =?utf-8?B?a3lCSm9LeXIvWmYvb0FwSytFbUZaZHlHMThrVDFZMTQzUWlmZVJKRkthTUVZ?=
 =?utf-8?B?M1JWRUJpL0ZUOUcxd2xBaXBtKzNMUG4wRGc5d0hGNG5RK3BheDJyVkt6M0gx?=
 =?utf-8?B?N3NhdHhQM0xkT05FYzFhRTFTVW0xZzRUSzJab0p5amkyeFJBRDNNdlljalAv?=
 =?utf-8?B?N2FpTXhEaEJXZnBEb0ZMM0F1eWJPSCtvQUgwdFJPbkRaYjRmS2pTQVRxRlVp?=
 =?utf-8?B?QlREaDk3eWlOTW5KTDUyNDFNN24yYnN0clAzN1kwY0orSE00bmI3N0pPSStE?=
 =?utf-8?B?TXFNclJ1VGpONDhjUCtsRkp3bDRLWFMzaGtLR3RIRkEvTVNNenhQalNCejJh?=
 =?utf-8?B?cE1pc1M2YnVWL1dOSWVtV1YrR3BFV0UyVC91ZE9yb3JEM1Q4cHVtTkROM0hK?=
 =?utf-8?B?VmlNdUlGemd1Qk1pZENlL0k3QjFuWmpPRThZWjVtZlAvem9jMlE3Zm9KQ3Vo?=
 =?utf-8?B?SjNLSW5LLzhQcEFQZTFyUy9yNGFsRmtLRVBnM1dJcVZpY2d2U3gydXd6UW11?=
 =?utf-8?B?MmxvYmRGWUZtOTh2T0t5TkNidWtjS0hrcUxKenlUOFRFSW1pZCtDZGF3WHVt?=
 =?utf-8?B?MTB3RURyM2dhYUl4VnRiMHh0VHBGaUVnYkdYaUc0M0kvOW5Bejd0V2ZSSUxo?=
 =?utf-8?B?bzM3WnZjQmtiOFdiLzRHd015U3lhTkEzell2Rm9QVHJxUWMwZ0ttWFBPL0JI?=
 =?utf-8?B?WngzcURzRVpVS0tJNFNTalpWUHdpNE85OXRaNkJEQ3dFQTlKQkEvZG92azBV?=
 =?utf-8?B?NE9sakNYQXZhWmdockJDYmxMcEN1Q011cXZ0RGpPQ2ZRb0J5a3k2S3pOdkVN?=
 =?utf-8?Q?i6nIbeAEg3sY1sn12ayTiE4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb106a66-8c60-4d32-0ca6-08d9dc28f224
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:24:27.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0axAw5kI8i6o96GL9ahRrB7vVBrRJNDcm5rjbWDuM4kc5sL8URALLKAfY5p0Rb2eXW/uRnh0RU4CnVB4R7RRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3681
X-OriginatorOrg: citrix.com

Both QEMU/KVM and HyperV support using bits 11:5 from the MSI address
field in order to store the high part of the target APIC ID. This
allows expanding the maximum APID ID usable without interrupt
remapping support from 255 to 32768.

Note the interface used by QEMU for emulated devices (via the
XEN_DMOP_inject_msi hypercall) already passes both the address and
data fields into Xen for processing, so there's no need for any change
to QEMU there.

However for PCI passthrough devices QEMU uses the
XEN_DOMCTL_bind_pt_irq hypercall which does need an addition to the
gflags field in order to pass the high bits of the APIC destination
ID.

Introduce a new CPUID flag to signal the support for the feature. The
introduced flag covers both the support for extended ID for the
IO-APIC RTE and the MSI address registers. Such flag is currently only
exposed when the domain is using vPCI (ie: a PVH dom0).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/irq.c              |  3 ++-
 xen/arch/x86/hvm/vmsi.c             | 13 ++++++++++---
 xen/arch/x86/include/asm/hvm/hvm.h  |  5 +++--
 xen/arch/x86/include/asm/msi.h      |  1 +
 xen/arch/x86/traps.c                |  3 +++
 xen/drivers/passthrough/x86/hvm.c   | 10 +++++++---
 xen/include/public/arch-x86/cpuid.h |  6 ++++++
 xen/include/public/domctl.h         |  1 +
 8 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 52aae4565f..b9b5182369 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -383,7 +383,8 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 {
     uint32_t tmp = (uint32_t) addr;
-    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
+    unsigned int dest = (MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK) << 8) |
+                        MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK);
     uint8_t  dest_mode = !!(tmp & MSI_ADDR_DESTMODE_MASK);
     uint8_t  delivery_mode = (data & MSI_DATA_DELIVERY_MODE_MASK)
         >> MSI_DATA_DELIVERY_MODE_SHIFT;
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b4..ec0f3bc13f 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -66,7 +66,7 @@ static void vmsi_inj_irq(
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    unsigned int dest, unsigned int dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode)
 {
     struct vlapic *target;
@@ -107,7 +107,9 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
     int vector = pirq_dpci->gmsi.gvec;
-    uint8_t dest = (uint8_t)flags;
+    unsigned int dest = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+                        (MASK_EXTR(flags,
+                                   XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) << 8);
     bool dest_mode = flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
     uint8_t delivery_mode = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_MASK);
     bool trig_mode = flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
@@ -123,7 +125,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode)
+int hvm_girq_dest_2_vcpu_id(struct domain *d, unsigned int dest,
+                            unsigned int dest_mode)
 {
     int dest_vcpu_id = -1, w = 0;
     struct vcpu *v;
@@ -645,6 +648,8 @@ static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
      */
     return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_EXT_DEST_ID_MASK),
+                     XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
                      XEN_DOMCTL_VMSI_X86_RH_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
@@ -835,6 +840,7 @@ void vpci_msi_arch_print(const struct vpci_msi *msi)
            msi->data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
            msi->address & MSI_ADDR_DESTMODE_LOGIC ? "log" : "phys",
            msi->address & MSI_ADDR_REDIRECTION_LOWPRI ? "lowest" : "fixed",
+           (MASK_EXTR(msi->address, MSI_ADDR_EXT_DEST_ID_MASK) << 8) |
            MASK_EXTR(msi->address, MSI_ADDR_DEST_ID_MASK),
            msi->arch.pirq);
 }
@@ -904,6 +910,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
                entry->data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
                entry->addr & MSI_ADDR_DESTMODE_LOGIC ? "log" : "phys",
                entry->addr & MSI_ADDR_REDIRECTION_LOWPRI ? "lowest" : "fixed",
+               (MASK_EXTR(entry->addr, MSI_ADDR_EXT_DEST_ID_MASK) << 8) |
                MASK_EXTR(entry->addr, MSI_ADDR_DEST_ID_MASK),
                entry->masked, entry->arch.pirq);
         if ( i && !(i % 64) )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index b26302d9e7..f001b43a21 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -270,11 +270,12 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu *v, uint64_t at_tsc);
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    unsigned int dest, unsigned int dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
+int hvm_girq_dest_2_vcpu_id(struct domain *d, unsigned int dest,
+                            unsigned int dest_mode);
 
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index e228b0f3f3..531b860e42 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -54,6 +54,7 @@
 #define MSI_ADDR_DEST_ID_SHIFT		12
 #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
 #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
+#define	 MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
 
 /* MAX fixed pages reserved for mapping MSIX tables. */
 #define FIX_MSIX_MAX_PAGES              512
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 485bd66971..3d2d75978c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1150,6 +1150,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        if ( has_vpci(d) )
+            res->a |= XEN_HVM_CPUID_EXT_DEST_ID;
+
         break;
 
     case 5: /* PV-specific parameters */
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 351daafdc9..666c4b7757 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -269,7 +269,7 @@ int pt_irq_create_bind(
     {
     case PT_IRQ_TYPE_MSI:
     {
-        uint8_t dest, delivery_mode;
+        unsigned int dest, delivery_mode;
         bool dest_mode;
         int dest_vcpu_id;
         const struct vcpu *vcpu;
@@ -345,7 +345,9 @@ int pt_irq_create_bind(
         }
         /* Calculate dest_vcpu_id for MSI-type pirq migration. */
         dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+               (MASK_EXTR(pirq_dpci->gmsi.gflags,
+                         XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) << 8);
         dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
         delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
                                   XEN_DOMCTL_VMSI_X86_DELIV_MASK);
@@ -782,7 +784,9 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
          (pirq_dpci->gmsi.gvec == vector) )
     {
         unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+                            (MASK_EXTR(pirq_dpci->gmsi.gflags,
+                                XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) << 8);
         bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
 
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index ce46305bee..49bcc93b6b 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -102,6 +102,12 @@
 #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
 #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
 #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
+/*
+ * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI address can be
+ * used to store high bits for the Destination ID. This expands the Destination
+ * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
+ */
+#define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
 
 /*
  * Leaf 6 (0x40000x05)
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0..17ac7ef82b 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
 #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
 #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
 #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
+#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000
 
             uint64_aligned_t gtable;
         } msi;
-- 
2.34.1


