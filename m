Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E44CBB6A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282992.481898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPik9-0003ap-6s; Thu, 03 Mar 2022 10:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282992.481898; Thu, 03 Mar 2022 10:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPik8-0003Y2-Vd; Thu, 03 Mar 2022 10:31:32 +0000
Received: by outflank-mailman (input) for mailman id 282992;
 Thu, 03 Mar 2022 10:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPik7-0003Bk-5v
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:31:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 165bcf86-9add-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:31:29 +0100 (CET)
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
X-Inumbo-ID: 165bcf86-9add-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646303489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mRratOgkzBnDfVL65Q/q6CME3fnvGL4txg0FZdaWXe4=;
  b=F013AGF+gmXTifXtJbcegSLMmQe4ikfN1Kjs/v90XjG/hgNKoFIT+j31
   kQ10u2VXcwtHY0+iusOzvLzGhZNNJ3DOAF41XDsDndb7K8MSZcTf6Zotj
   j0FrrgXv7kgUbawAeX9ht2Cq8vSgJ0e/WU0TxkKLaiViZ2WA6eLn1PrmK
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65783144
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NE4+zq8zV1J7QPWF+NyrDrUDqH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WpJXT3TbK3YNzamc950bYzl8EkCuZCHndQxGlBrpHg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZCiTBwnFfz1o/Q6cSUBHgthfp9q5rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4TQqaFP
 pZFAdZpRDrKWDESAWsqMqgdkOiugXr6XTQBj13A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru42T4GVcbL5qWkT6e9XSEierGnCe9U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhao4+VGvT9L9dwalu3PCtRkZM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKquc6Vzkx2
 HTYpuj5Ih5T6bC/VjGv2qmb+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuR2iun
 mniQDwWwuxK0JVVj/nTEUXv3mr0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJczV/MBuaL9UdF1M2xpjGGeG6bKIN8N8nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpP9zrV5p2nPO/SI2NuhXogjxmOMIZmOivpnwGWKJt9zq1zBhEfV8XY
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQzlwW6eMmup6I+SIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILO+5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:Z1FbtK8iIdkrfKz020luk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VfN1xOfdfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65783144"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvwK6wCgl47O4ZB2XLNxdx9JFPlHy1IFkjp9jwBm0+U3+DWfhhr6VB39Q47S3klwd3mPn0E6FB20oz53JuUsSH0eD2yWqU4dS/JhsnxZ+pT5SlP+CgcCcwUJSOnAPc7kT6SuUrtyaPt1sJKKYK1MrhB14r6d4NxXUvQQaXqF+sHw79vL3y87hsKsPMQYuLHUhbiQi1OIVdmO7VZz9hmYFH3a3GPOGJ8oG4FjtaYl9I7DzOUXT6QTX70ORO5vgSYEUcKQQobBT/hPxE8lId92rsm4ybmgU8ZvHeojuPsH2jHqAAaznONp3HsG9zRVR3GwZrBpuCrqA0O1lY8lLiucBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrDS53nrLLQmuLsxvZpPkLlor7GHN4Niyf5R3N6D0us=;
 b=ZAOSsL3/k3l1ERY4U5oB/bXhQEHzdIpxYZSdk7ULwgH7LGnQh5uOGM9nt+XcLXHHIuGK6MJUvbbQTCoOZ8Jpho96qpWMsMvxahA3c9YQkp8tUATIXvXtY3epBguvWi7h9kbCOsgkW5+wJbQNEBELV74VsEIf47gW2NjLUa8dKBaO0k95SwocCeVz6LZ3Rvi3T4WqTVkY9ItMuf1Of/DDMY5GizGHLujsm6G3nAuGRi/AdEOO/ydrwzI4Py/GqjZ7VQElA+NNC0jNH67C6WNOGBEWsC+kBHFas+UjrkwVOlNnNnrgj8LYg2XgrilT3ShZ9Rc+5iJT3EJDy+z8vNw4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrDS53nrLLQmuLsxvZpPkLlor7GHN4Niyf5R3N6D0us=;
 b=vAQqLyZ1ToV1Po65twx8+oUOEBeidXc9YlejWb+JzWt1vUZmgDah3Y7qfHLy76O5I/tn6u6ci/XJ3/SnHsJoo5LassHXsuNU9H3w6yKv1vNP8xZAXNrBb7C1d+8AVLbcVg3AwqRaS4WVzVk/wBK0EnO5SEm3T48Fmw5R1y9qrEw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Alex Olson
	<this.is.a0lson@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [PATCH 3/3] hvm/pirq: allow control domains usage of PHYSDEVOP_{un,}map_pirq
Date: Thu,  3 Mar 2022 11:30:57 +0100
Message-ID: <20220303103057.49181-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303103057.49181-1-roger.pau@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dadd1f2-682e-4a83-83df-08d9fd00f842
X-MS-TrafficTypeDiagnostic: SN6PR03MB4464:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4464496034337EB59AADE1C98F049@SN6PR03MB4464.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1lzmrsbplqXhBYRiOG9gmuhpcG2y6dd2KTsqWMnnCvkEaavJ7PkR6XGkRLFytaEj7MUEWB3Us1WCDhqBu/5h0qk+CeJfqywGzL0XaN6F4JfPdvitCYXo/HJluCo0nm0wCzORkslH3Tvf/Bto5lSRtKmhRACqpOBqKZNU1g9dRrR6teJRMud0BUTqDGGKmkwJstSYnO6gy88Ym1FcnNC9YzswMoCkNES41K7mq6RFfpbZwG6pQMsICnKEzpoKF4A7aTmGCq5qgfL22qQxp1xV2gLcJqWsgsIdJ/DFI/DvgomGE3oGuDQDDQehbaBzHUic76zWXVH7qye/aNdkwyRuTsbsuQ+f1WpqJHM3OhLzJ6PMUJrZisoGhQXlGhuRdjtaWriAwbWoPE5sR6ZLEzF+uPtywbj9w6kG2jBNdv/lRWJa9bY8CR7CXjdnZernyg1sdjC8T8bbNdBOIYsSkuiw1SvZ/nwL5LAjJpKOmplqN6v0rHIAp2fSFZh/JDvH93x5t47n3QZYwJzqqztxH3BDoa5IvJM6lL1jh59KWMGcQF/vBjeKPNQErahJsGmRpxloD3VUo3BxOj4qFWOBh23u6KSpK35icEIx1pJRtDxd2rk+uqYSHaW6Nfu4fZ77h7zD2bYYlXeR7jySpK6tKsI4Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66476007)(8676002)(4326008)(86362001)(8936002)(5660300002)(82960400001)(38100700002)(2906002)(26005)(186003)(1076003)(2616005)(6486002)(6506007)(6512007)(6666004)(508600001)(6916009)(54906003)(107886003)(316002)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVhacjU2UmprSmZWTitzUEFoNDV6TitIdlByNnphbnRjL1FxRzRHZlByOXRB?=
 =?utf-8?B?dzRNdDdpblJWaEtYancwUVF4YjNLdXlzL1EzaXhSZlBPQko4eFZxT3NMc3E3?=
 =?utf-8?B?T3lIWUhpNWVyalRBR0RrUHJyVXNuSnFiU2piQThhc2VuVmEwbUFNMDR5cFZi?=
 =?utf-8?B?RTF0MjRPRDYycURDdGliZ0x4aXZGc0R1dDdHeVFnZ0h5VmNmU3pXSnNCRzVU?=
 =?utf-8?B?V3kyNXJIOHJCNXBDL3pKVEFBUkNSQWxKUHVuL2l1SEVhNUJjamgxZzRoajl4?=
 =?utf-8?B?R2dQNTA5TXhZZTNUOWF1cmY3YnBUMmhHWFRHeitXNG1neHF2SW8zRjlNZDYw?=
 =?utf-8?B?UGFBZ2xrdXJyVDVydGtHM3NEdXdMa1hqMUg3N2FNSCtnMERMYTVTa2YwWGlV?=
 =?utf-8?B?OGRQdkF2MmluanVKdXJSc2FFM3NrVnp5c1ovNHZGQWo2Ny9DdEhWNUkvbFNT?=
 =?utf-8?B?RTdhSEltNTJuRlFSejlvWUtMdTU3Q1dLNEdqUHJ4eHowNUpXdWowYzBsd1Na?=
 =?utf-8?B?Y1FRUWdMWUo0b0FQTGRpajdTMGZQajVXV21JUmxrbitodER0TXZsNjZlb09z?=
 =?utf-8?B?QWMxUmR0Z1QzdzlCOWYrQTRsdWpuN3M2anB6V1duMmszSVZnWWlpS1dhUURP?=
 =?utf-8?B?Zmt2ak52VHhwWmZpbzZkZjBuTzNFZXRpeFFESVJOR0tENEQ4WlVpYk5rdTJD?=
 =?utf-8?B?MEEzbldZdUFOdVpOQ3FpOERpQmh6a0Q1Uy9JTjVqU2NIZCt6MDVsMWFYZmt0?=
 =?utf-8?B?STBkUHlVNko2UEROUmZiTzFGME94MDZTSStaL2tHTkY3aXRHQStjWEkxNWVW?=
 =?utf-8?B?UkU0UnJCN05aNCtzcUo2SWVqMk1GV3kya1I4eVlqWDV3ZE1FT0FrY0FMSlE5?=
 =?utf-8?B?T21SL01mdXcxenYwNzg0aUZKdWFmYlVaTVRheWUvNE5lWVpqSTY3UUcxbGJX?=
 =?utf-8?B?VmpINFFjVzJVNEYwSHl4MnlmTmNJb0JjOGd1a2c4THozSk9odld4b3ROMUVq?=
 =?utf-8?B?OTJwZWIrRnVCYXNWNkRYK2d6UFdwS0FFR2tJYnRTNHBxRnhMWVVpeXFadzU2?=
 =?utf-8?B?ZU1OTDVFU1dUU2dZTHhzTjFZNmtFR1dMTkVYZmF5N2thNnlyQ1cyc3BLRk43?=
 =?utf-8?B?Q05rWFVCVUxycCtwRHJ4alIwMjk4OGhDQkJ2M1JrSWZuS3htN3NKV29CYUNz?=
 =?utf-8?B?aFlRT2dRa2VZM0xpajhFQ3hTbmYreldVK0Y1MTloZEd3c3dpeVVSNXdDdlZj?=
 =?utf-8?B?U3lxWHd2VHE5M0NKNFVJNXkyK0U0cWRlT0V0MWV2RlBJc0s0Z1g5ajJKRks0?=
 =?utf-8?B?cnVJL25JWEtlV2FFT2d3K3FjcHpkdmlwNTBvQlY3MDMzYlRrbEc5eFp3NzlK?=
 =?utf-8?B?bHRZL1lNVlVtZ2h3bEd2VkExSVduQnZvVlhUb0xwd3I2NVpSS043dUMvK1hq?=
 =?utf-8?B?Rk4wY215a29MazhYRnpuYU0rb1hvY2V3QU5mTWlTYjd0LzBYUHBZOXRZUHI2?=
 =?utf-8?B?bjhXcktHTG1UNUE3SGdKN0U2cGloRFRNaUkxejNkS2UyaFZuK0s5KzZJSU1n?=
 =?utf-8?B?MFQ2blhmb1BvcHpqYXpqQjNlMFpsNy9Db1lZc29scTgwN3NYa28rTXlUZFNu?=
 =?utf-8?B?NU9MQ0NRbUZ4Zjl0V1lKQXRFQ0RKemRhVHd4MlR2NWptRlVMZ0MxcDNEY3o2?=
 =?utf-8?B?Sy9weWJRRjBwYmlpMEU2TU1EV3VGcWJrTGFBRVpDMS96U1MxT1FWdUJFaUd4?=
 =?utf-8?B?V2N4b0Z2NDNvTTFnS0JWM3RVZXJNQWZhc0FPWkRXSEFrV2xkeW1GZ2ZTeUd6?=
 =?utf-8?B?Y1NzWXJQNXFoeFFjMldOWVFkK2tXZnBhWHk0WDF6aGY5QTRWdUxPNnNvQWZR?=
 =?utf-8?B?TWJ3aTVwVU9wRzd3aEFUL2Eyb2x5YUFLZXJFeFNkUjl3ZS9RSTliMFlhQWpC?=
 =?utf-8?B?M1lsV1hFUDByM2pYbkF3cUhhN01sTlJYS1BXaC9FNC8wRlhYajNSTXc4aEla?=
 =?utf-8?B?UzBuN0h4VzhvMlhhZS9sNWMrVVRlWjFNSFdjM1VZOHBPVnNWSGNqb1QvcElw?=
 =?utf-8?B?OEJHaE84ajQvZG5PUVZveVVzTVFpYjZyaFhER09HY04wbkt2c0o1eHRFbTdw?=
 =?utf-8?B?Um1JeVhaSE9kODZtekNOY0Fna2FqRlR5Nk9ES1p5cENzdEFmU093UEcyd2Mz?=
 =?utf-8?Q?hMT1h4+8E965sHhw4FEypow=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dadd1f2-682e-4a83-83df-08d9fd00f842
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:31:25.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2dEKg2fXNMKVhXtDje0QZds7NB37jiiL9Vqt4ay/qKOXzC0v0hlmW06/VLnjlc7fSwqsb56EZtAFi5S924ZEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4464
X-OriginatorOrg: citrix.com

Control domains (including domains having control over a single other
guest) need access to PHYSDEVOP_{un,}map_pirq in order to setup
bindings of interrupts from devices assigned to the controlled guest.

As such relax the check for HVM based guests and allow the usage of
the hypercalls for any control domains. Note that further safety
checks will be performed in order to assert that the current domain
has the right permissions against the target of the hypercall.

Reported-by: Alex Olson <this.is.a0lson@gmail.com>
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hypercall.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 030243810e..9128e4d025 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -87,6 +87,13 @@ static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        /*
+         * Control domain (and domains controlling others) need to use
+         * PHYSDEVOP_{un,}map_pirq in order to setup interrupts for passthrough
+         * devices on behalf of other guests.
+         */
+        if ( is_control_domain(currd) || currd->target )
+            break;
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


