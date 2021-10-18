Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A478431D39
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212309.370142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSyj-0000bC-D1; Mon, 18 Oct 2021 13:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212309.370142; Mon, 18 Oct 2021 13:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSyj-0000Z8-9l; Mon, 18 Oct 2021 13:47:01 +0000
Received: by outflank-mailman (input) for mailman id 212309;
 Mon, 18 Oct 2021 13:47:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcSyi-0000Z2-An
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:47:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd20be71-3019-11ec-82d7-12813bfff9fa;
 Mon, 18 Oct 2021 13:46:59 +0000 (UTC)
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
X-Inumbo-ID: dd20be71-3019-11ec-82d7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634564819;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9FPI6tqe0nO6M5yueo5xv7PAAE7It6ntZ2uEUqNTy94=;
  b=RPfvhEWuUERviWhlcPQef6rlnTS6sH2UJ/OTbO8QoQ3bje9uCtPJdMVz
   Kbmt8aWMCftQzohwMlXzcyMIgW/z7Z8CoU7bXnPafgH3+utNBaYBiLg1r
   HXOk16tHn6ERPLdm3ZdBbDKaBvevdbwPQKNMQYBE4tcIqkoFcPwlgCR4R
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HgTPruBcWSkqA4o1ezVYNJNPUjaYaxGE3VuL/szeL3gCfG5PEyUkesteQa0CPLlxpceUUMBkze
 bkAsGlbZWTtw9wj5dEM8JMTdCqWKx5pLwkLTRQVrmEVz53eFyAudxYz/txm34bLtMQ8zF9eivy
 HJ0a0fPB9biLd8xYY0Wi7WWECUCr4rFPZZJCXUyiKWQClMRVsBxoCm5gyo6T4Mu6NtAl5isv+e
 WnUAkWisNT7c4Tnk9DBqfNkSUb0mcRUfPdTgM2wEfH00nXkqeEpzCEGkADROJoWftXHrPTPist
 GHvBoDhOabO4r4Z0IucXXBgg
X-SBRS: 5.1
X-MesageID: 55835775
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xbJQgaOdNLWhTpfvrR1+kMFynXyQoLVcMsEvi/4bfWQNrUpx1zABy
 mVMXWuPO6qCZ2L3eox0YY+0/R8PuZXdnNFkHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Uszw7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxzRotx/0
 oxHibixRCV4Z6rywt4MfDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iXtYQFg2ht7ixINcyBQ
 8kybzpxVTqeZSdPJFNUS84nk+j90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVdkWFrHCe5xQgf9tdMbxj7z/X8Lv7ylPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1rejM82vjUcQBBSpbP3VcFFpaizX2iNhr1kqnczp1LEKiYjQZ8xnLy
 DeWsDN2ubwXicMav0lQ1QGa22zyznQlowhc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzIJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtwMsWwvfhs1aJdsldrVj
 Kn741I5CHh7ZyPCUEOKS9jpV5RCIVbIRLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEkGD7CiP3CKqOb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwlDITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:e8i9xqNph4piJMBcT1L155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55as854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nIviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sv1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfp2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DDeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeTP003MwmNG9yUkqp+lWGmLeXLzMO91a9Mwk/U/WuonprdCsT9Tpf+CQd9k1wvK7VBaM0vt
 gtn8xT5cZzp/QtHNdA7dE6MIKK41z2MGDx2V2pUCDa/YE8SjjwQs3MkfgIDN/DQu1/8HJ1ou
 WYbG9l
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55835775"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWrYqM7RdU7q3Ftbt0/2E2XX5mPbEgdCNb9jbLxg8rIFOV3MenfOk8l91CwsOoCXo1cTfsK36PpXFUfWFI8o1+QiVhsmarkhpGrPwF/Mdzljy6uVIP/IbMHrZBKf9k3PWMok/uviHeduVA7JJ9E5VBPPybgPECAs4qTDkZ+SdlbEVWoQc8zY9xvfPPziUPV8lrZ0BRyJ2zFOXDcHNI24jZ+q2oGM7mcaihRLCDzp1HAz0v06CbNbXImd19y82DHEw+o1YMGv/5Qcg6ZKAqhUhWbE79Dqql+iH7rDWZOqagsCgCeeVrfSd/0fgiHVREsjKM/viDo2iKmNOl0U/dMIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65CP0iUPtqia21TkFqKG7ZpQXC5syU2d8xVafPqoddg=;
 b=EahfrzCbOzj1vdEv5Lu+V4rreHly9xruxyqTO1tPALWIIyc94K25IGiCSN4WxBVjBpkZ5pBafSB2Pm99/pdMXyxU02Vqv7/H/bBwuyBj6yf+fO1kUEsUyq3+0lHdW9H4B54RBa+wn5ZQU9EAjpAOE7M/JzZr2AURZmd2iIY2Q3TgQmC9MjM6l+qD3LuA9OG/7n0HFsZ5iCYQmqP9S3LcFFgeIooTIxKrzzCDgkv+XQjn9cyjdhp0Kt4BPWyFMMcNq/+AFkZa29ySmhiw9nrgr5wJwZ8qi3kVp5eur1EUqxWvhLuLWvU2AS4SdNq00SfNMqAUuWAE5IpyFm7ABizyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65CP0iUPtqia21TkFqKG7ZpQXC5syU2d8xVafPqoddg=;
 b=tilhcXq/cQft98pqDeOpQJMIfOF6JREmV5xb767sKzdNJGTIlruFRPzeNRGUhbVbPPbXOxuGaBYUprM/Sv3EVQk35TD7k6YcM8YqEjdaSvyXA9IBG/HDn6PY9pjwTjs/ESKd8+SwVcB7COY0kKZlYnKvGvY5pkBLw5wPJIqwCOY=
Date: Mon, 18 Oct 2021 15:46:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/paging: restrict physical address width reported to
 guests
Message-ID: <YW16sQI1WmegDkwN@MacBook-Air-de-Roger.local>
References: <e0acfa40-0901-2fc9-31b6-c2609625de22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0acfa40-0901-2fc9-31b6-c2609625de22@suse.com>
X-ClientProxiedBy: LO4P123CA0282.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b7aea6a-ae2b-4260-d798-08d9923db097
X-MS-TrafficTypeDiagnostic: DM5PR03MB2843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB28431F40B996F46AA06EA7F28FBC9@DM5PR03MB2843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02gpsG7U5YcmDMNU2cWhmz7D09qrlzBoLZd/+N9R/93a/rf2wgCHavpAGxAMQvQeH+EuUK/90AZdBDJ5V93QvtR1xkqEo6Pa/gs5r1GEfFH93g7Zz3Ki5GhKW16tI1gSPHbCZsbiuxk+JrUvfQmt+tOQsTw2KL4zG3IUvJlDGERvDFTc7/6m9HE4OAQLZKb8CaGNAAH6kM05wfjjC7IKhNh7XZ5a4lvIFQTqlehwqcwTeAmCHDb5sk2GJAHVWa+0hOatf4N2iXCZuP/CtJFWLn9PainAjgBwlY22F2GagZyYpMbbtL/CMsIZD7ZyzhwB5/xzNCNaTjgVkAxlyAn9ucpEgLyP//2wLXcrgtJ36l/ZQcYQvsY/8xIc6749Me2tB2buJd4nv/xc/zVbRFq94beou3R9+ZO5cH6fX/ZOq0XisDnSLZ7Q5uG08H+WON72wrML+ljDzrStVHRKMonUEns48GUgigjEmDd2agiZbO2ksV0Rv7Qz6Ew13MCEND1ee6bbaUBpJjZDwoV3oy9Vjla8t6FFdddx2LcQCBzldvTBEUNRlZNv643O6L1PSwjZbPBw4IvbhBZXve6MF/s5/Sk2gZ/ZYAMdWw20DOghdFxU2FMuKB1QUbEMaeUBhc1EMn9mlAbwiZ32QRMtsklSlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(26005)(85182001)(6666004)(956004)(8676002)(5660300002)(4326008)(6496006)(6916009)(8936002)(508600001)(38100700002)(54906003)(66476007)(82960400001)(186003)(66556008)(9686003)(66946007)(86362001)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhQSXVUY0V4dXBpNkt1WTQxVkdpTGtUMVphVUF1b0lSdXppanMrU0pLblVH?=
 =?utf-8?B?SEUzVmZqclhtN1FZVVQwVjZQemdJN0VET2dVNUN3ZkNOdDBaL0ttMlJkSmcv?=
 =?utf-8?B?c1h1ZzNZY05XajVxUzZLcm1NTk5IQmt1Ynp4Um9pWmxialROaUc5UzZENlFr?=
 =?utf-8?B?dUE2Sjg2S1MyT0RGei9laFE2dTU1eEhWSjdmNXY3NFE5ZDRPM3dNUUdPamty?=
 =?utf-8?B?R3ZZUkhEcEhwU0VZaGowMC9pOG9GMEI0ZlF5L29pemlTd3Y2c1ZXWGt4N3kx?=
 =?utf-8?B?RUtIMFNxUWJkK0lSdTFiRDNzNEY2amhRMVhJcEh5L1lBT0F1TE1peE85S2t0?=
 =?utf-8?B?LzFDbjJNelhaaElCcmVzU3haZ2s3a3B1eVV5TlArYS9Qc3o5a01nVmMrbmpK?=
 =?utf-8?B?Wkg2UWxxSy9QaDk2c0xtYnk3dUNKN3htaTRzU2ZRaTZxZ0UzR1dKVjIrOTlK?=
 =?utf-8?B?OVpwWHZnc2N6MGZLeE5Hek82MHU0YUhxMmlkY3kyOWRsTkVSNGNqbWc0bjVW?=
 =?utf-8?B?OVJFS00xazVUblJlTzRoVzAvVWdRcGl0SE1NbldaVkZPdW1XODRwSndBcm14?=
 =?utf-8?B?d0RlRXlvOTRydHdDSU1vajJJOEZsaVQ2ZmttcExKS09YdzZFVitOai9ZVmVu?=
 =?utf-8?B?d1dCWVp5b2dNZDI1eHVxK2VOQTRIMHQvY09GWEdDWGNnUldMT3drWFhvU21o?=
 =?utf-8?B?cmpuVit5N1MxZmo0RzBYWngyN1M5L2JPeCsrMXRYT1dUdUo3L3Y0NGE3NFZQ?=
 =?utf-8?B?SjdBVXluNWprbjQ5V0ZXdnl1NUJWSGZMY2w5SUxOamJtc3dSY0NRZ1J5d3NW?=
 =?utf-8?B?MkxQQS9EUnBGbFYvV1A0ZWdJQmpCUUlmMm5MYUVtSXZwR2EwTDZrS1VoN21y?=
 =?utf-8?B?K01kcTcvcVJQcTlTNXZZbCszSGRDeTB3dVFua1lqQUFKaTBXbzRjZVlHZWRW?=
 =?utf-8?B?RytXWjRxTVhWbHVXT1FhaWoyUHJtamJLR2JkNW5KS3RQeUUrVURtakY3N3J5?=
 =?utf-8?B?S0dDRWI2OWdyR2JUMnRUTXYrVmRoUTdYTU8vZDV3VndBKzZtcStVMXhVcm1q?=
 =?utf-8?B?bnBKOVVvdHFKL2trcDVyNW94ZmlmbUlpUk1ZK1NGUHNLM0N1ZUVITXFNVmFP?=
 =?utf-8?B?QnR1dFR0QWVwT0xEYUJKTjROaldUc3UraVJtOXVHWW1UVEU3OEE1aVM1RzVr?=
 =?utf-8?B?ck5Vd1ZZbGMxbkpWQTk4VWlsNSs1RGJqdllaYUpGMjhyMVJQVG9abWxBaGZz?=
 =?utf-8?B?bnMwWkFFQ1daS2Rjcy9XNStIMmMzV3JnTEczWDV2UlRDYTQ1WmRtN3Z5aE9m?=
 =?utf-8?B?RG9FbUEwMXd1RUtITkRPVGtlSDViSGYxVEFFZjJpZnJrelFqbkN2bzBHNVVa?=
 =?utf-8?B?VXc2UHhOUWNWR2RMdTNxelY1K2puMElHWDdpOU5qRE9sd2pKWitYSVdwU3kv?=
 =?utf-8?B?SGxKSHlEdFhvWmUwN0VneFNFM0RCMFNPVm5HVmNub2Q2SWVlMlZXbFoydXJo?=
 =?utf-8?B?M2p2cUgyTFBtZ1Ryek5LSTAzamhOZDNKVDRNYzVqd2FVblVmZnM2MlRXY3ph?=
 =?utf-8?B?bjBKR1Izc293ZHZrTlN2d2ZNUXExTFdWNlpqbm5YV1FaZEtSNEhYWDdFRWJN?=
 =?utf-8?B?Y2VveS93ZTFsc0ZkOEgwOEd6cFdBbVg0Z2NhSVhoanlndDl1bWNjNUFpQXZ3?=
 =?utf-8?B?Q0xOZVJrRVQ3dkQvRE9KczJEbTY1Zk4zZkRxOTJYanBYaWJHQjRUeVc0Qm4x?=
 =?utf-8?Q?tcy/+608f+glaD2vpoSMHcdzuqMRx/30vlGgjNv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7aea6a-ae2b-4260-d798-08d9923db097
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:46:30.5347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bY42zZh6JjjYjdUg5FJOeMI6Nl7NIJ0/pDCVCjXHLmawdcZIVCkoICniXrNWn/bBSiC5VaLXIpfdASTfn5oSTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2843
X-OriginatorOrg: citrix.com

On Wed, Sep 29, 2021 at 02:47:49PM +0200, Jan Beulich wrote:
> Modern hardware may report more than 48 bits of physical address width.
> For paging-external guests our P2M implementation does not cope with
> larger values. Telling the guest of more available bits means misleading
> it into perhaps trying to actually put some page there (like was e.g.
> intermediately done in OVMF for the shared info page).
> 
> While there also convert the PV check to a paging-external one (which in
> our current code base are synonyms of one another anyway).
> 
> Fixes: 5dbd60e16a1f ("x86/shadow: Correct guest behaviour when creating PTEs above maxphysaddr")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/include/asm-x86/paging.h
> +++ b/xen/include/asm-x86/paging.h
> @@ -401,11 +401,18 @@ static always_inline unsigned int paging
>  {
>      unsigned int bits = paging_mode_hap(d) ? hap_paddr_bits : paddr_bits;
>  
> -    if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) &&
> -         !is_pv_domain(d) )
> +    if ( paging_mode_external(d) )
>      {
> -        /* Shadowed superpages store GFNs in 32-bit page_info fields. */
> -        bits = min(bits, 32U + PAGE_SHIFT);
> +        if ( !IS_ENABLED(CONFIG_BIGMEM) && paging_mode_shadow(d) )
> +        {
> +            /* Shadowed superpages store GFNs in 32-bit page_info fields. */
> +            bits = min(bits, 32U + PAGE_SHIFT);
> +        }
> +        else
> +        {
> +            /* Both p2m-ept and p2m-pt only support 4-level page tables. */
> +            bits = min(bits, 48U);

It would be nice if there was a way to not have to manually change the
values here if we ever support 5-level page tables for example, but I
don't know of any way.

Thanks, Roger.

