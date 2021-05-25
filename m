Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC1390427
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 16:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132221.246707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYDB-0005kB-NC; Tue, 25 May 2021 14:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132221.246707; Tue, 25 May 2021 14:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYDB-0005hB-JZ; Tue, 25 May 2021 14:39:13 +0000
Received: by outflank-mailman (input) for mailman id 132221;
 Tue, 25 May 2021 14:39:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR7Q=KU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1llYDA-0005gm-NX
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 14:39:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3b92a95-e061-416c-8f71-baa86da514bd;
 Tue, 25 May 2021 14:39:11 +0000 (UTC)
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
X-Inumbo-ID: d3b92a95-e061-416c-8f71-baa86da514bd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621953550;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6XyHHm7+5cjOe8O5Qb1PSdcoattIPbPoG9IU5X4MlK8=;
  b=Zy88v5kLn/V9ddBU/nVDche6fi87jcs/HXsgPgUejyBoya1JDZHC3sf3
   89F1SUYDd3HAhHbuVxeRjCvFbmKFPZ2+llQrCPJ0pZSweKA6nkr3fQV44
   4MRZ+HYp1a2bYG2qon1WDC50v8jspdrbHQUqgbExxv1Ggll9wkSDLgY/E
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iTBe/WSP/RQGdh4bJvCepQyjpG4BYTcbnzUKQwwxeKZSo1m9eIVPGur5+uptX5dYVddAFL8g/6
 YFQVPz48O351/CiKnV8+iVqa4Vx/dnMt3PF2f25EzuLFMXqezexKuw4q3hfBJwC6J+smhL21oD
 y2HK8pUhWIfi51jgd4h9+dQFyyxk2iS7JJVRqmeoWrSJXSdNGfixr9eDnqT8JjOqlSd51F4i6e
 nr+fzv2SECNer1Bx8smMuJFhDtlLTTX3kft8sbaWr5Bovmhwou0sugivwkLyNxGtc4OagWf3zv
 kpQ=
X-SBRS: 5.1
X-MesageID: 44563186
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:GRmvBqIJINukt6goFE+RzpUlxSXFcZb7ZxGr2PjKsXjdYENSg2QEn
 GRLWj3Xbq7eY2OhLtl1Po/n/UwB7cXdx4VnSQZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0zrbf65xZVF/fngqoDUUYYoAQgsA18+IMsdoUg7wbdh39Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O4W5cOQURV1BajjgchMAzhGKAJiO5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne16TsmdpXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gts254VRKaAD
 yYfQRAwZx+QUSF/BkYGAbsDg7mnjWDZIiIN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7Fxk+RVa95/6jhSaWWs1dA
 1wZ/DI0qqo//1DtScPyNzWju2KNtBMYX9tWEsU55RuLx66S5ByWbkAIQDdOZ90hsM4eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7if3JMRYMfWcMaZTBes4bDuJNvtRfgV/oyQI+rtf7pHwill
 lhmsxMCa6UvYd8jjvvhpAGd2Wz9+PAlXSZvuFyMAT7NAhdRId79PtL4tTA3+N4ddN7xc7WXg
 JQTdyFyBsggCouR3AiEXekABr2g4/vt3Nb02gU0RsBJG9hA4ReekWFsDNNWfx0B3iUsI2WBj
 KrvVeR5vsE7AZdSRfUrC79d8uxzpUQaKTgAahwzRoAeCqWdiSfeo3A0DaJu9zuFfLcQfVEXZ
 s7ALJfE4YcyIqV71jumL9rxIpdxmnhW+I8nfrimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/od9LcQ9SdSBlbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:nhfjLK/j+/iMn/seu2huk+H1d71zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqOU3IXOrwXZVoJkmsi6KdgLNhQotKOTOW31dAQ7sSkLcKrweQYBEWldQtrZ
 uIEZIOeeEYZGIS5amVkWrIcadFsb/3iZxEnd2/85+WJTsHV0gJ1XYxNu/xKDwLeOApP+tCKH
 LbjPA31QZJHh4sH7CG700+LqD+T72iruOsXfdKPW9/1OHI5gnYqYLSIly95FMzQjlPybAt/S
 zuiAri/Jy5v/W60BPHk0fV8pRNgdPkjuFIDMunjM8JJiTw4zzYMrhJavmnhnQYseuv4FElnJ
 3nuBE7Jf1p53fQZG2u5TPwxgjJyl8Vmivf4G7dpUGmjd3yRTo8BcYEr5leaAHh8EYlvMtxyu
 Ziw3+ZjZxKFhnN9R6NsuTgZlVPrA6ZsHAimekcgzh0So0FcoZLoYge5k9OVL8dASTU7ps4GP
 JiAMy03ocATXqqK1Ti+kV/yt2lWXo+Wj2cRFIZg9eY1zhNkGo87ksD2coFjh47hbkAYqgBw9
 6BHrVjlblIQMNTR7l6Hv05WseyCnbAW1brK2KdIVPuEYsDO37Ltr7PyLg5/+2xYvUzvcgPsa
 WEdGkdmX85ekroB8HL9oZM6Ar1W2m4XS7g0IVm/J5ytqfnSLeuGj3Ga1YziMyppvUZDKTgKt
 6OEaMTJ8WmAXrlGI5P0QG7cYJVM2MmS8EQusw2QRa1iOejEPzCisXrNNLoYJb9GzctXW3yRl
 EZWiLoHd5N6kCwVmW9vQPYXGn1fFfjwIl5H6fb9dUC0YRlDPwfjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quU7V8mRAIHNmfxhoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6Z9/KET
 RYu0989cuMXsOtLBgZeoOa21+h/icuTTOxPsohc5S4lJ3YktVSNOdqZEQ3fT+7TyCcmm5R2S
 N+gEJufD6UKtqhs9T0sHS4bNuvN+WUuz3bbvK8n0iv8Hl0lftfCkfzYATeH/J/oTxeAAa81W
 cBtZP2vtK76HWSAFp6pr5mbHtxVQ2scfB75a6+Fa9pcvuCQnABcY7Nv03AtzgDPlPw8UMcn2
 rgKjDRV83qLzNmywVl+5evyUhzcGqFeUJ2dzRdiq1SUUr7mlsb6575WkKUu1HhHGfqBtttRw
 34XQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613451600"; 
   d="scan'208";a="44563186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edU7RWTAZmpw0NfP2H5HAQFr6tF4DGe9vRAn16Q18Gb5RRA13bPd4k5hTHMkdSuZ2E/xBRcKQ/kN871mD0eAoUl2x8TS9S2P+EUQyhF3YtMQx/OMcjtLOSpbUO8z8e3/zTzqM9YEfII9olAMo+2ykBqkCO/0Qq+MF3YwNSiHibaTRAGQbhSEY4beyVhQcfakaQP6Ecf+TrNnwvyLJZjfCFeABKnP7JJud6tw6VyO7TxxBUmRKy0cFJgFdblEka1dz24z7Jcdj6InSPtYjIy+QNExPCMEJRqygwTEK+QH/IlihJRDGlZQ/L6tvsO6WHcrrWL3qWAFP+vEFC2FvuWFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTtDCpKb95BElI2EcWwLmQFoRxCis1zJsMHVmCRsnOA=;
 b=E8e+8jG16/ORcWQMvq+GMM35hQJNXdFzXNZmO+lgd3hhlk+roZhJ8+SyolE+o5kVPUszYwEJkSKKp1HNz6lmrAeQ6239kbE7tSjqrTD4rBtNow8fGGTkpBXXr+HSfXUA5BAO4sK41QZWUPgWQ7+nhQLdiAS3TI0xOu6Ng++4XRucRYnPFT8LGQWByEbB/v5NCeBMCfP2WXOah/3suG1FT3W5QuMtvKnIpgpp/Dd2R/EiNnFTfsFKxDIssHWBsg7YRDsPPTdsWfAE8CPqGBRn0pq3vGUIUcrFXo3ti0g5fO41GhaTFe+kwxV0E1eFqPo91Npb1tT3i2VbTES5dheh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTtDCpKb95BElI2EcWwLmQFoRxCis1zJsMHVmCRsnOA=;
 b=Ca1jMMiqY9DnsdEIvPzfilCigu3vVKV3QrCwmd1R+7YYCe0TfaY7oUNclfXmarBIqZNXcncD6L2Jgck1oh4py3E0ADDIt358JGBrt/eqsYJzdliR27WhD43gAcoF91NlBZ47gXtAAMnYzq1UDBzKHrZpOAqtd/DIk0EQP4449Ds=
Date: Tue, 25 May 2021 16:39:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/3] firmware/shim: UNSUPPORTED=n
Message-ID: <YK0MBTWXYJmihvUn@Air-de-Roger>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <dbfa9126-6809-64cf-5bd5-01b402616f11@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbfa9126-6809-64cf-5bd5-01b402616f11@suse.com>
X-ClientProxiedBy: PR3P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e12041de-4990-4e32-cb6f-08d91f8ad91d
X-MS-TrafficTypeDiagnostic: DM6PR03MB3580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3580C74981143BDA37ABFBF48F259@DM6PR03MB3580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j11J/+w0adQIuP/AUw0nDzSi5x+xHwP2qwyy/VkflpykGtMTjTC/ltXumxXG176FcP5JDaS7SeHj/xzc55IJiW6qlMMvZI167+XaMRR2EHoslyOXLKnVu4SiuUFFoZ0miYW1KbKijIC91Tuc8qCp5/id3RLY8wbZSjD/AInaBZ9a7dUvnI199DUBDbLYncRidLX39NOID2bFMXmUT3B+kJeKKZJgZgtOu47qQEdOxvYoC10rW/NOrvUKhwMBVnE/9bZXm11y7USYj/i+hpjuVjn3ylrAW9HQYArGhHMAEz1neVYubpJxpJeZAZYxTwc9Q0XQ4JvCMMj0vtrOwzxnjqFKbYmt3Lpb0tF66VtL4Ez8mhlHU2LceelvUFOccwjCLNZ6UGlfr8eFrcYgobMREiQ+48iEwjp+6IGzaqOV99yH8Qaf6BM+Ilgvb0nDU6ElO2fHFqflwiV3hCcefUcYyhsvBfllEcRJGd4ttTC76Bi/6T1Qfzdi5Jres4sIiHCP+DrhPhWUInK9AXxaE1VcUUpD/CAzso2XW9S92POLFtE8CukAouQzmm1ldOUzP965icUe5urP3Dtn0Xuhj4MGopnu9pnIwXaDQTeR6q8TGpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(376002)(366004)(39860400002)(136003)(316002)(38100700002)(33716001)(956004)(8676002)(85182001)(9686003)(6496006)(4326008)(5660300002)(54906003)(6666004)(2906002)(16526019)(86362001)(26005)(66556008)(66946007)(478600001)(186003)(6486002)(8936002)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzRmcnNnc1JzWXZ5WGpFZmlYZGh6dWNvcXNNeUV3Um5HLzhOa3VncDF5SFVE?=
 =?utf-8?B?RGI1YUQxb012VnZFTE5kYmJDWklVem16RmFoUFUyMHBiVXkwZkV1SUZxckdY?=
 =?utf-8?B?TDRVQmhtRXNDRWZOMk9GZ1ZSdFdzcjhLQ1FOV0JscytEYmdRVEhFbFc1OXhl?=
 =?utf-8?B?RTFzc0QxUUxzQWZLYmNhR010RHYwQ1NFM1lIbm9RRlpOSWUyaThKUEg1bmh0?=
 =?utf-8?B?UTBkajY5eHVSYlFTWStkbjdHdUpibmdjL3ErSUkyL29hVXBFNWhVang0MEZ0?=
 =?utf-8?B?SjVLbW9scTJxWHNsQTlzbGt5RVVRUkoxdmdWMTViUythY0xGYVZQR01oNVFT?=
 =?utf-8?B?UGdLYkRUM1NRcXhia2Z4OENGdG9yZEZFTjd3eUZkMFhQS29XQ1MvblQwdjBQ?=
 =?utf-8?B?WS9DUWZobFdKU21obE5ydnJDUWFQQzE0bWl5aTdkZy9FdEVJcWVIemNTQWtX?=
 =?utf-8?B?ZGlQU3UxMmpBeExneS9sVGFwWUJuZHRoYUYraXp0N093RTZtUjlyUnh4cXVU?=
 =?utf-8?B?MUhGbzVQcHh2bnFTRE84ay9JUGxuMDIrSEc1cUxORDlzQ2dLdktDUmxjQXRj?=
 =?utf-8?B?SFh2OURHekIrNXNYWTlzRGhOMVJpYTRWWGJsNXBoem54VEVMQjdxRFlJU1dh?=
 =?utf-8?B?TCsza055NUwvVTFFSXliLzNKajBhcjNPT0lMSEdCVG80VXd5WlNuNjU1K2sx?=
 =?utf-8?B?Rm9tVkplRnV6TFlpTFhvc20yeVpNRVQvZkNMdk00amFtVnh1aDNNS2w1V0pp?=
 =?utf-8?B?OThSWFlRWlJhTG5hUk5PdE1WUzN5YXUvbTAzVVYwemxRYWZBNUtINndGcEZV?=
 =?utf-8?B?S29CVDc3M1FlRzM1ODJCZFQ0NlRqNTFnenhWMnl4RWU4ZWFjN2ZzS3UvNld6?=
 =?utf-8?B?ZFZTY3BUTGpEcGs5N01PeGwxMitCdUxQZTBoc0YrRndheTdPcWxoMDNETEdX?=
 =?utf-8?B?U1kvNFNJUGptY3dsL2NTYkdzMldmV3VPendpd1NMRWduc2pJZG5GeUw4dmdu?=
 =?utf-8?B?Si9LWlREV1NzL053Rk5JZUYza1g4WXFUZGVjRHlKaG1NV3ZlZGRiQU9DK2tl?=
 =?utf-8?B?aUc1UStpNXk5MVhjWUJaaWczTkxjdVpaUjkySmg1TmxsS3p6enFxRHFpaXhI?=
 =?utf-8?B?S29UQTdaVEJQQ05GNTRZdmNvaHQrZ0FudE1yYWI0bHd5WUtlZ2ZIOVJBOXdi?=
 =?utf-8?B?Y2lGUHZUcnludVZCZWx3Y3M5MUFjQVVhNUR0K3lZRmFyai9JYzdOV1Q3dWZC?=
 =?utf-8?B?clNYY3pQbG5sakQ1WEVVT2gzM2dKVmZEQitZbmpHQjQ2ZnJtTm5wVG9KcU1N?=
 =?utf-8?B?Zzh6V0tuYlVlRzV5OVVzeVF6NWpoejdiVHY0MW5ISnV2d05LUHlxY2RZMTZH?=
 =?utf-8?B?L2pHRWhoQlF6ZkI1dUxVSDVQNENNM2daY1JPYTZSRXpTQkgrQ2V6eE9WSmt0?=
 =?utf-8?B?WkUwUEdwWGRSQVpQb2pZREFGemZUV3JFS3RDWENtdXh1RHdDWDRXQWFLTXk5?=
 =?utf-8?B?K1Q2c1FlTU5hK21WV1JubVk3VzhBWGVRTjRuaHNnN210UVBWcXd1RlNodzBE?=
 =?utf-8?B?ZlZKRlgwUVA3VnpYK0FlK2lURjBna2FISjVNK1dWNFVodWRGR1lxVzAyVkoy?=
 =?utf-8?B?U3ZJQUJ2UWVuZzZWU05hYno4WGZ3eGpXeld4Lyt4WnRYWWJ3VENCTkhpVkZu?=
 =?utf-8?B?aVZndmFZMW5SQkRhejY3YXhpdHN1K01FOFZoMnZYQ3NTL2VjQnU4ZEJIZFBL?=
 =?utf-8?Q?4q7e8kGQBlxmyRcBs3L/gxwbuPEfyEv4UQoJ07P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e12041de-4990-4e32-cb6f-08d91f8ad91d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 14:39:06.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBLp2r/x/QZNWgDxMymoe/hjUBL17lAs40ErYmz1HjWkPphc+C3m8uMk601aAlYY0BWMyZlpVXCLVMZGRvVFiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3580
X-OriginatorOrg: citrix.com

On Fri, Apr 30, 2021 at 04:45:03PM +0200, Jan Beulich wrote:
> We shouldn't default to include any unsupported code in the shim. Mark
> the setting as off, replacing the ARGO specification. This points out
> anomalies with the scheduler configuration: Unsupported schedulers
> better don't default to Y in release builds (like is already the case
> for ARINC653). Without these adjustments, the shim would suddenly build
> with RTDS as its default scheduler.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ----
> I'm certainly open to consider alterations on the sched/Kconfig
> adjustments, but _something_ needs to be done there. In particular I'm
> puzzled to find the NULL scheduler marked unsupported. Clearly with
> the shim defaulting to it, it must be supported at least there.

Indeed, I think we should mark NULL as supported for the shim usage
(which is very specific anyway, because it manages a single domain).

> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -15,7 +15,7 @@ CONFIG_SCHED_NULL=y
>  # CONFIG_KEXEC is not set
>  # CONFIG_XENOPROF is not set
>  # CONFIG_XSM is not set
> -# CONFIG_ARGO is not set
> +# CONFIG_UNSUPPORTED is not set
>  # CONFIG_SCHED_CREDIT is not set
>  # CONFIG_SCHED_CREDIT2 is not set
>  # CONFIG_SCHED_RTDS is not set
> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -16,7 +16,7 @@ config SCHED_CREDIT2
>  
>  config SCHED_RTDS
>  	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
> -	default y
> +	default DEBUG

I would also be fine with leaving the default as 'n' for unsupported
features.

>  	---help---
>  	  The RTDS scheduler is a soft and firm real-time scheduler for
>  	  multicore, targeted for embedded, automotive, graphics and gaming
> @@ -31,7 +31,7 @@ config SCHED_ARINC653
>  
>  config SCHED_NULL
>  	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
> -	default y
> +	default PV_SHIM || DEBUG

Do we need the pvshim_defconfig to set CONFIG_SCHED_NULL=y after this?

Thanks, Roger.

