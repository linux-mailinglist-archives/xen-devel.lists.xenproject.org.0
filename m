Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291B49C9A4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260864.451037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChOZ-00040q-BS; Wed, 26 Jan 2022 12:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260864.451037; Wed, 26 Jan 2022 12:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChOZ-0003ys-7V; Wed, 26 Jan 2022 12:27:27 +0000
Received: by outflank-mailman (input) for mailman id 260864;
 Wed, 26 Jan 2022 12:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nChOX-0003ym-F1
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:27:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f70377d-7ea3-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:27:23 +0100 (CET)
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
X-Inumbo-ID: 4f70377d-7ea3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643200043;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=xbcVBswz+C+IeJtPbHEvBIbkQS4MGyU5aXrK5yg0i9E=;
  b=cEzsUl8/HcF/xT6B/EUgyB4qe07ugexqiGXwA2W/ZnVblrQS+rZNKxZy
   9/KznuXASZYs77qYkXkFX8xC5EKHo8XO+4mME82bCscv+Fyda9TfAxCl9
   BWiu/hPMHLFBbIXzXQTJ8RjfBEYiMMsd7sAFboyhQUC7OeTOnlut4yS7l
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OJCFHdIi+NS5MSxqD/Ja+6G9HDrbUPzeSViqJEvbd6zRArVFAolZJAWcP2LuC3gKjhHH7fSAbY
 I12pe07F0IKlygrYwYbTamBcZB1puK/3st+tIAnqomtWspUJbayFnpdk9QOsu+ghPZ9Hnjpc47
 Ov5e1sPOZ0MkmVnx18Q5v/Gl6/hOpoOUsWYGGhd6XargEpE3Oln0BeoJ8Kx0k7H5//EDB47TRj
 gVUBOohP+bvzAYmTuNxdPCBiGMDEbp5oc/l54faqeachTaMIZFxExg2lVruTvnIYIUa+ErDQ7x
 OokPDJOi7WEyQNfxXX3jkh1u
X-SBRS: 5.2
X-MesageID: 62793405
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4RWOqqroFuqhcAKYxzkJwzrecBVeBmJSYxIvgKrLsJaIsI4StFCzt
 garIBmCb/uLNmP9KIhwaI7gphwO6pTSztJrS1A5pC81F3sUopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbDhSC1qAIDLo/0YDSN6LHBeFL0c2KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UQqeFO
 5JEAdZpRB3kJDJAZAoQNKgRxO2i3nvEfyAJ8XvA8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHNaS0yaf+3SgwOrGhzrmWZk6Hae9sPVthTW73mUODDUGWF39puO24mahX/pPJ
 kpS/TAhxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmIOSTXWR57KFtwSYMCIeLXIBTSIcRA5D6N7myKkxkxbOQ9BLAKOzyNrvFlnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhYl80zEbpc2We9wYnXqyaNqyB+QL78qMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDBoxaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifbrUmChmbKhggBdXTAd4lla
 P93lu73VR4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgfVN7tksv/Y/VWKm
 zq6Cyds408OOAEZSnKPmbP/0HhQdSRrbXwIg5E/mhG/zvpORzh6Vq65LUIJcI15haVF/tokD
 VnmMnK0PGHX3CWdQS3TMygLQOq2Af5X8CxnVQRxYwfA8yVzMO6HsfZEH7NqLOZPyQCW5aMuJ
 xXzU5/eUq0np/Wu02l1UKQRW6Q7JE303lrfZnT8CNX9FrY5LzH0FhbfVlKH3AEFDzattNt4p
 Lul1wjBRoEESRgkB8HTAM9DBXvr1ZTEsO4tDUbOPPdJf0DgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6oK39b9XxwhpBlvRaFGvBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSLtKY7OkT34iNz7YGra0QKMknekjFZIZt0LJghn
 bUrtvkJ5lHtkREtKNuH0HxZrjzeMnwaXqw7nZgGG4u32BEzw1RPbJGAWC/75JaDN4dFPkUwe
 2LGgaPDg/JXx1bYcmp1Hn/IhLIPiZMLsRFM7VkDO1XWxYaV2q5phEVcoWYtUwBY7hRbyOYia
 GFkOnp8KbiK4zo11tNIWHqhGl0ZCRCUkqArJ4DlSIENo5GUa1Hw
IronPort-HdrOrdr: A9a23:x6vjG6j7SsoU7Dh4yUIw//TGYnBQXzZ13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbq6GciT9JvjJhxWPGZXgs9bnmJE4lHxKDwKeOAKP+txKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+wLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfhWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrzXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkioJk29Tpb+CUlpAZwyHsKceg32w
 31CNUXqFhwdL5nUUsEPpZ4fSKWMB27ffueChPlHbzYfJt3SE4l7aSHpYkI2A==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62793405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epXZWpLE+vdnmwmW37vw/947o+lKz9/5HO4jqDqeE/q4m9eYaiLUXKWu6cVeISmpwx+2c6eqWcnu2Z0Bht/d7K00vR58wGZvDRGHBl8oOfvFifbk3LIUPh/f8sbx7GPLb1+eAk/YTc/4lLBijvEpXLGXwl2xE1b0Zw4mOEn+BI+WulhJeDZdXCcxVeq93Tbuy60BpaGXaeaEu5w25aHNJ9JtZmxrUxUkPzVWhYmzWuJ5EEC+AAh8XHo3O8qOAeRr1bSftt9w+5e16+YeE9RtxiGIl0cH4SGgyRSJwd63v6qf/UPSpaVkw7g5fPArvNMkxio9GAj3mqAeCf5cR2CagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNg0t/iqnwe5xcQUDMVyki8mesYjjduVX3ijL7UpRvQ=;
 b=e2aztB84l8vmtWzmj/VO45N7AujyoWdQM4UHO5fio/+cwphI/tLlLdfuOkudCyPah4mcxHK+STVw6VDUBnryiDPIyNaUkAUXxlCRGYew8sMcJAQ9/a/nwknohIQo7eOPck4qZvBno0HaMLwajXfDMMSmARamiveKa0fHzOSiPaGkdUPjLBKmp3KN1yqIXyjGfgFkG4UPc0ySUoTPSMdgO8f3z2IIL5phN/QMvxiHiabRDAQ+Pe9SWwmiNckaXW8vqLDEULqFKjLWsh4t2VdVbnG8JYI+dt/L6OHT0n5xQ+3tZhieR+hYqe2UhfOz8Lct37c40E+ErCvEdu8WiBnLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNg0t/iqnwe5xcQUDMVyki8mesYjjduVX3ijL7UpRvQ=;
 b=JujnWy171Ztm4vBzDnXZnmq14rapcIhJm7aTlysicxunv/+ci6Z/ZQUusXKVajFyFcGboXvFxCorHxK26hnz8S5JOGoxrKzD4b9Kiny2QbZLuppjB7NDBu40AKDUq2IDKOv1rDrQnaxl8umNg5W+aUZ7EyXvQqsFfVWk5nQTm5Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Date: Wed, 26 Jan 2022 13:26:48 +0100
Message-ID: <20220126122648.52275-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0005.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11816e1e-6822-4819-00a9-08d9e0c7234e
X-MS-TrafficTypeDiagnostic: SA0PR03MB5547:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB5547D247C75F9FB8180C5E768F209@SA0PR03MB5547.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fXQ3Elk1YXzXpVoDxGb90Mc4yOxHF3B1Ieh1c3ZAMPI+T33XBYd5Qh7+30zJ7B554AYcEgrxwugxKxl5BGB804ZaCrvPuE/IiFkEb7Ms5VLolsvyzIu4M3TPzitvvwFpusLST6D0z0QCchgk+gKX2scGAoaSRjuz+k8RY/3ecvZOo+uPrwIsvrbuOfB5NHlV2l04YkbLbu3ylMGFL6MUDqjYIZlYQBr64E8rs7+aGjBLxblsa2XreXN8ZEKZAA14tYQZ8OgnKAzyk91R4PqWZfioqTMnYkuNGAhqZ6tvLoI2zL4nqraxYZkUFWQD159BUv3iImDkFADwDMsbt3TwLqujEJgshbqI7a6/0zUtFHRp2SRZ7R3M+tMSM1C+yWXXiMh2zJh/CRKcgCkj9vtn2ATZCjMVA086s6/ez7tnJoOkn7lqUAsco6NSBeC9s56zPsr86VJyrlPNaxRHj1dC2slV8y/9ONGH39mybotR4+7A6CBwVXdP90g8SIPw2A1V1aV/WHC90QHYzxds45i+LGHw8DoidPeedWP2XfZbmeXqS/0m4Crcv5R2vWumzkLhEFnABt/1bke8gGqv+0/YAzjy5Nv/yw6H8xnOJlK0sA6Y8tVqMaboccwjIUFSoDt9Q6RYgT5hi68KVJ3FzLxbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(36756003)(86362001)(4326008)(66946007)(66556008)(66476007)(316002)(54906003)(6486002)(508600001)(8676002)(8936002)(6506007)(6666004)(6916009)(82960400001)(2616005)(38100700002)(6512007)(5660300002)(26005)(1076003)(83380400001)(186003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ovTnhqTlNUZGF2dG93cU40MzAzY0JmcjFkTnNqcHNHbm5KVGpWaGxuT0tG?=
 =?utf-8?B?aWxlejQycDVBRlBTendib1pUTmJBaXh5N1o0WkVpUnRFLzRDYlM2bzhkdWZE?=
 =?utf-8?B?Qi9HUkl0WjRJK1ZkMXdoNStjMVJETmpFdnpqdnpTQzVaS1RGUERmcjNGbXdH?=
 =?utf-8?B?dytGcGhXRUF5Uk9Yd0VHZ24wTjRBby90ZS9rRFp6eWhoQW1mMWIyUU1XbXBT?=
 =?utf-8?B?dXZaalFkazUyalp5Tm5rYkQ3U3VlaHZuaG81R3doMUpMa1FiSEVVb1lldCtL?=
 =?utf-8?B?NnJyWkJaU1VtVnhCWXdRbjkxOTBnWHJZeFoyWldFQVltaExMRHVhdTd5ZnlB?=
 =?utf-8?B?VXR0V01kdzltOXAwMjBrTElBU25HQk12UmFBWGhmZnFQUWhXbDRHR21JNkpT?=
 =?utf-8?B?Y0NVUUFqYWp5K0ZJdnVGQThEVmZabzFTZ0V2T29kLzltblRnM3VGUGU5SDdB?=
 =?utf-8?B?aEJxRXVOQ3MzbHh4UFd6ZHBLL2JNdVpzRXJ5MkJVSlVyMWV6Ymhnam9kcTNs?=
 =?utf-8?B?bWkyMjdkMi9Cb1hyVXZibjNyZ1BOTWJRbDVHekdpbWhJcTl5d1dEVmErUS9O?=
 =?utf-8?B?U1BCU1Nsb2x1YmpzNVptaUphOWpTSXROTzA0OHdGcEcyOEFFWElqTG9wMmMv?=
 =?utf-8?B?UE1PWlhzdklsaENRMXVRVEZVN2pCam5yTmNuWGpVNWwxS2FoK0cvUWpheXVX?=
 =?utf-8?B?MXdlQUFPMzJhYUlPVXN3TGJFK3hqSDcveHJuaURuRTArTCtycGh1dW5xdGdH?=
 =?utf-8?B?MzU2bTQ5eGxha0sxaHlqVHRuVG5nV3BLaWxlSmdCUGxzS2RRRWluM25rKytD?=
 =?utf-8?B?ZFBwNk90aDdnUEUwSm4zVFdPeDlQazV2N2d1a09yR1pvbkY5OG9UenZRd1Y0?=
 =?utf-8?B?YXdTMVlRVllvK0xEb2lEUEF3N3RpTjJDcVhDaytNMTdlSXJYeHB4NWMyQUxY?=
 =?utf-8?B?cWZuTnVYWS9IdzUwWnZEUE5tMlRWWWtUbjltZGRMSEtDZDg1a1FQMlR4UkpQ?=
 =?utf-8?B?N0RGaVoyNEZwR292Nk1reldEa1Z6eDRya2hOeXJJdXZyV2wwdUZ0NkNBOHRZ?=
 =?utf-8?B?bVRveGtVWUEzTlFlUnZ3emo4Y0pGTjhJa2F1aGNURWxmdjFlSTNqQmRXTzM3?=
 =?utf-8?B?dnFaamN2eHlYYkhJZDFmMmlHdGFhUU0zUEprcEpCU2ZweWVsZ2VtYWxyNS9n?=
 =?utf-8?B?UmI2L0w0NmNrZEg0amwrc1hPUGM3eWxTdmx0a21zRlpsZEdiWkU4bWp0VGI3?=
 =?utf-8?B?aU13U3B4QVpXNkNIYkRZQ3ZGamtaQTVUTEdwWlFHK3RLeGdSZEl2Z1dLSU1W?=
 =?utf-8?B?dU00azhZYWo2M3VpK0pocytlOXZFUVVEcDZpM2cySjJ6TTUwOGF5V0JyTHJs?=
 =?utf-8?B?WnlIZTRnKzUzdXhaZmJwNm92NC9qN0hDeDY1Nm5uRDRDdFR6aXQ5bWgxbU9L?=
 =?utf-8?B?cEo5Vk55OGxuN2FySXZZVDN3L1l2K2lNME9YNTR6TEVOUm5tNUNwTHZ0Vncv?=
 =?utf-8?B?dGFBanhVTW9WeHFIZ2ZVSURoMnZ2MFk1VE1JU2E2L2g0eU42eDZVM05WZGp0?=
 =?utf-8?B?bHM3Y2FpdEVoNU5XUFkxWHE2Uk1QNlZsOXZJS2ZOeTJsNzhGc1BrV2tUcGx4?=
 =?utf-8?B?bElueWp6ZE5hZDR6NHV6M2FuQ0RuU1AvODAyTlBJdkpvUk40dkNnVG9COTRY?=
 =?utf-8?B?Mm9qRVRwN2ovRjVOQ1BKZ0I0azk5b09wSXNMOW1Db3dPcS9qL0ZDYW4xUmUv?=
 =?utf-8?B?a2JsWGowSDBnYmNDM1ZwenY5eCs1YXZiYXQvUk5RYmI4MTQrdHZMdklLcGVO?=
 =?utf-8?B?RC80QWFCeUFHemhVT3Z4WmhueUNZY2lTS1U3QVFTdmhlSlZXdGJCUFljcVA2?=
 =?utf-8?B?UkFIdGRpR3hzclpZR2NxT1ZzcDFETFFBaXNYODgvMHduK21SSlpuWGYzeGtD?=
 =?utf-8?B?bU5Tanh3RXkyYXlZUWRUQ0JBUWJPUGFqTXB3Q216S2ZiUERwWTJLaHpNQkZ6?=
 =?utf-8?B?dXRvcW95NmZQcEFLM0dKTWN5VmJvWTV0OU5lZ1J6ME56OVJQQ0hVNUtCeDlh?=
 =?utf-8?B?WGllN29IWXhWUmFRTW1SMHMreUNPUVFRMjFjeUZLTlVNMTF3bXl1MmpjR2ZZ?=
 =?utf-8?B?WXVaalhjbFJkWGdIY21IbVU5RjhOU0tpZE8rcm5Xd0pKYkVqRVZrenVVbkpk?=
 =?utf-8?Q?kNe+z5ZYF6lF0uVibTEo27M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11816e1e-6822-4819-00a9-08d9e0c7234e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:26:54.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAagtm6TRxUOzJOPOUJEHGnDMf8ol3IJRouMVlw2cqgM++eFxHw1ZeYp3+yuObwmUQdrlf6rqpmCMZlTN1flcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5547
X-OriginatorOrg: citrix.com

One of the boxes where I was attempting to boot Xen in PVH dom0 mode
has quirky firmware, as it will handover with a device with memory
decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
with a RAM range on the e820.

This interacts badly with the dom0 PVH build, as BARs will be setup on
the p2m before RAM, so if there's a BAR positioned over a RAM region
it will trigger a domain crash when the dom0 builder attempts to
populate that region with a regular RAM page.

It's in general a very bad idea to have a BAR overlapping with a RAM
region, so add some sanity checks for devices that are added with
memory decoding enabled in order to assure that BARs are not placed on
top of memory regions. If overlaps are detected just disable the
memory decoding bit for the device and expect the hardware domain to
properly position the BAR.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
RFC because:
 - Not sure the best way to implement is_iomem_range on Arm. BARs can
   be quite big, so iterating over every possible page is not ideal.
 - is_iomem_page cannot be used for this purpose on x86, because all
   the low 1MB will return true due to belonging to dom_io.
 - VF BARs are not checked. Should we also check them and disable VF
   if overlaps in a followup patch?
---
 xen/arch/arm/mm.c             | 11 ++++++
 xen/arch/x86/mm.c             | 20 +++++++++++
 xen/drivers/passthrough/pci.c | 68 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h          |  2 ++
 4 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eea926d823..fa4cee64c7 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1625,6 +1625,17 @@ bool is_iomem_page(mfn_t mfn)
     return !mfn_valid(mfn);
 }
 
+bool is_iomem_range(uint64_t start, uint64_t size)
+{
+    unsigned int i;
+
+    for ( i = 0; i < PFN_UP(size); i++ )
+        if ( !is_iomem_page(_mfn(PFN_DOWN(start) + i)) )
+            return false;
+
+    return true;
+}
+
 void clear_and_clean_page(struct page_info *page)
 {
     void *p = __map_domain_page(page);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1397f83e41..03699b2227 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
     return type ?: RAM_TYPE_UNKNOWN;
 }
 
+bool is_iomem_range(uint64_t start, uint64_t size)
+{
+    unsigned int i;
+
+    for ( i = 0; i < e820.nr_map; i++ )
+    {
+        struct e820entry *entry = &e820.map[i];
+
+        if ( entry->type != E820_RAM && entry->type != E820_ACPI &&
+             entry->type != E820_NVS )
+            continue;
+
+        if ( start < entry->addr + entry->size &&
+             entry->addr < start + size )
+            return false;
+    }
+
+    return true;
+}
+
 unsigned long domain_get_maximum_gpfn(struct domain *d)
 {
     if ( is_hvm_domain(d) )
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 0d8ab2e716..032df71393 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,6 +233,7 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
+    unsigned int nbars = 0, rom_pos = 0, i;
 
     if ( command_mask )
     {
@@ -251,6 +252,8 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
+        nbars = PCI_HEADER_BRIDGE_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -267,11 +270,74 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
+    case PCI_HEADER_TYPE_NORMAL:
+        nbars = PCI_HEADER_NORMAL_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS;
+        break;
+
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
+
+    /* Check if BARs overlap with RAM regions. */
+    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
+        return;
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
+    for ( i = 0; i < nbars; )
+    {
+        uint64_t addr, size;
+        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
+        int rc = 1;
+
+        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
+             PCI_BASE_ADDRESS_SPACE_MEMORY )
+            goto next;
+
+        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
+        if ( rc < 0 )
+            return;
+        if ( size && !is_iomem_range(addr, size) )
+        {
+            /*
+             * Return without enabling memory decoding if BAR overlaps with
+             * RAM region.
+             */
+            printk(XENLOG_WARNING
+                   "%pp: disabled: BAR%u [%" PRIx64 ", %" PRIx64
+                   ") overlaps with RAM\n",
+                   &pdev->sbdf, i, addr, addr + size);
+            return;
+        }
+
+ next:
+        ASSERT(rc > 0);
+        i += rc;
+    }
+
+    if ( pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE )
+    {
+        uint64_t addr, size;
+        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
+                                  PCI_BAR_ROM);
+
+        if ( rc < 0 )
+            return;
+        if ( size && !is_iomem_range(addr, size) )
+        {
+            printk(XENLOG_WARNING
+                   "%pp: disabled: ROM BAR [%" PRIx64 ", %" PRIx64
+                   ") overlaps with RAM\n",
+                   &pdev->sbdf, addr, addr + size);
+            return;
+        }
+    }
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
@@ -399,8 +465,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
     }
 
-    check_pdev(pdev);
     apply_quirks(pdev);
+    check_pdev(pdev);
 
     return pdev;
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5db26ed477..764dcad5b3 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
 int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
 /* Returns the page type(s). */
 unsigned int page_get_ram_type(mfn_t mfn);
+/* Check if a range is in IO suitable memory. */
+bool is_iomem_range(uint64_t start, uint64_t size);
 
 /* Prepare/destroy a ring for a dom0 helper. Helper with talk
  * with Xen on behalf of this domain. */
-- 
2.34.1


