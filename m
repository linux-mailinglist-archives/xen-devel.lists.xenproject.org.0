Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E46C219F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 20:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512102.791770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLGo-0007DW-FC; Mon, 20 Mar 2023 19:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512102.791770; Mon, 20 Mar 2023 19:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLGo-0007BC-By; Mon, 20 Mar 2023 19:34:14 +0000
Received: by outflank-mailman (input) for mailman id 512102;
 Mon, 20 Mar 2023 19:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqGy=7M=citrix.com=prvs=436e66757=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peLGm-0007B6-6E
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 19:34:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f2f5417-c756-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 20:34:10 +0100 (CET)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 15:34:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5222.namprd03.prod.outlook.com (2603:10b6:610:9b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 19:33:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 19:33:54 +0000
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
X-Inumbo-ID: 2f2f5417-c756-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679340850;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wMr/9WMDlsPA5t1KEY7ZQGsJwyaalNilTtd8N1Kuf3o=;
  b=Rf8uHH8diNYMVv+umEKcC6ylJlsGVhXTeUaHo9xSH2xh7dV9gXEW+GN9
   bQI0myzgAnXYnKkxUzWe+T85wrHVQy3JEjKx8TZVn+M6wSz5B29sLnCvJ
   FVpwC864OCPXknC7EuILClQeoNjz2Tt6PnIjKqEgjt2xk0q5yidVI6eDU
   M=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 104015811
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TYTb1K6Nttda8YYcdfC5YAxRtLPGchMFZxGqfqrLsTDasY5as4F+v
 jEYDWzQb6rcZmfyf91xOY+28ElT6JaHxoJkQFA9ri0wHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 /lAFCsQSja/rt2V7e/ndMkyoeUNFZy+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUotiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpOTOTlpqcz6LGV7jwQNkM0X1CXmvCwjX++SdUcN
 2BMojV7+MDe82TuFLERRSaQvneAuQQ0X9tLD6sg9Wml1qPR6h2xGmsAQzhOedEi8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMH6dT+pIA4jjrUU81uVqWyi7XdBjXY0
 z2M6i8kiN07j9MP1qi91UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koBIeCR1iCv
 X5Bl82f8PofJYCEkiCAUKMXAdmUC+2tNTTdhRtlGcAn/jH1oXq7J9gMuHd5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpX4GiZK4t4w1rHURrA==
IronPort-HdrOrdr: A9a23:2rT55qmwbjcN9Td+wf0My4PIES3pDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-IronPort-AV: E=Sophos;i="5.98,276,1673931600"; 
   d="scan'208";a="104015811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8zZYe/DkHhkoKp/XHJJckWxIExGKPFtD9OT6BjG7qbVJeLK/Ee/ZerCMk9y/aNp6SPQRPYEYPxmfFPF4sUVwuFcSYkXltY9GJBSGpfjsFrEPP8NWXcnQFeLQ/TTMKXH8HUsipgKTl6rAWTT9C/05HbaGxW6LmmcXvADGiTkYAM+fUlEKSKPl3CCqxbcLEi68cOnhK2v0BaNvqGtPZ5uWFtQdy5vFVgtPxcx6gGyvjgNwdwvxxbc1q+RjMNG8mYTvFc2TF9O1Xex55LdZlUFJdlSfVBet8MqwxONl3AgeMH8tHMVezR6COYUi3mPHkY5AfOZK9X5kP4QNFZ+TaavKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMr/9WMDlsPA5t1KEY7ZQGsJwyaalNilTtd8N1Kuf3o=;
 b=ZGckpRpcyX+QMytjTt881EVUYLSEeBXzcrNivpTe76LrZOnhh4QE9K2fhA1/CwBPg4/PcRO/MCLFSCwq9PbJuZmaepcNFXLyVgFYBNXYrFTraQhBk6pDHuybo6wfDqhIDlXFNWTQaGBPoW4+ydFoa6vfqfGBdwGNdBujpB0/8LniKYXvNCDtDcYkWNpYIVFQ35SrBMCZJsZ1QR7bLfg6ARegyW8HE2IpX9Z2J8JPIdHSwBrBCSLFTY3AV9FdOk9vPyFLOTMA6wf+gidCEPpagjVWKLhH96Ltr3cGJEV9EXrSUMIlqNMF1o1TaBJAlmq5n7D1nQL+yj2nXcBEeB4btA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMr/9WMDlsPA5t1KEY7ZQGsJwyaalNilTtd8N1Kuf3o=;
 b=vp0NdlHhCxy3HZGsa9Bumptqg4QngDD1FSYxv+mEEvw3KGgwdM01H+zDuiehWL9yJd3ltrTvo7JzrsSvy79k8zCFy3pH/sYHBopzTnNK3D01W3yvp/o1/KEF6F1LxEUOygT5jBMAg8Rbx1K+d9afgxc/5TNC8k9dITDfUnWVtFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <615872d7-b118-374c-a89a-3d46b5e5f2f8@citrix.com>
Date: Mon, 20 Mar 2023 19:33:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: en-GB
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
 <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
 <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru>
In-Reply-To: <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f05491-2055-448c-1f30-08db297a0a8e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JUemW1l8pmliebN+2IwpB+uD38m9zoLU9iYbuarRH9m22lPttEMD//mJy0P4PlBPe6cJ1AdPo/xjIQKu356GN2hz3pTpHzz88BobY3Wr5JeIZqwPySCq9RopYxb+Xs3i+dpdp2EOyOtHFkbot322d6CFutXKP1jLb/Ibyw5L4HEb1Vic3M0MIka3bE6XtzMX0wyZeOCJN876eg6fE4KdO+QO0zfNRV048iMutuPNOP+COIydtd4dKOO+PM+LKklcDTYOY9S9b9m2iLun9yvyjG543ERXYN4aLAkcieUWuYfwMhs8TKaNjB7IAa9Erqbm3TRhW2c8BqmIA/pblz0a8y+jwP7e3xtipZnbKBsHOLxZrprHgxi9afcI6LfTBFv+nkzAYCzlpNjOXGKuPgAjS/ZjY6TnUAhiTgXRAVMi19t9K5q4cKDiAVSITAQq2g/dsa3sN4j0TGyo9iWuqwlzkHvMy6c9gTURPBdEcSxKrwtrgULtd6fq2RbyrlGCiN1dlQFX6hnP02ZGGPLKeDRdljtXbsoKu1LCLg8YLlJdH7i+PkHiJ0Qy4BvDKEW6WF7s3WrwD71ZrfjD38/E6ML1osXWQfFMvSeoHzsgzYVImrUoYKE9cCpwWFhdnRRJiTVP+gqiMaB4yjC4HxGAo8KqBGs9b10gUFHP38SFI2v6nXcXwhlC2j69j/Dtodr0lb3I21acDwltmpWxZ6x6jx3jl6HX6On5ruhsVrjJINu0jp4fL/hbTpoMMy4TXrY/yU/2KYeA4Ihc8OjiJ4LEMCmqJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(66556008)(2616005)(6506007)(26005)(6512007)(110136005)(31686004)(6486002)(4326008)(8676002)(316002)(83380400001)(53546011)(54906003)(66476007)(478600001)(66946007)(186003)(5660300002)(7416002)(8936002)(82960400001)(2906002)(41300700001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002)(179675005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SCtLNnlQbWduSWVtTFpoTlR4SlQ0dnFRaEhCRTliekNVMkx0MFhGTWkxYVA4?=
 =?utf-8?B?OTBxazE5ZzBJREtvWEhyTElhWnlSZnk2U1Z5dTBncE9vbzBOcjdjUDlnZ2Ry?=
 =?utf-8?B?dEE5d1ZkZDZGZkI2WVAwMVZNYkFFbStKQnVIWERGdWx3M0NiSUc2dlN6YUJa?=
 =?utf-8?B?b0ZaTUtkdXFoWkJXdXczbmUwRHU3Zm4yWHpsV2VDV0U4b2lRLzFJYmpMZW5n?=
 =?utf-8?B?NjNDV0tPS3J2K2xsQnJFQU53UTFOV3V0cGN4Qmdkbk1CUEpIeUtsRk5WVk5q?=
 =?utf-8?B?OW9uZXptNmVYa2lNcnVsbTBUcVc2NkMvMkdYK2xSZjZoY1RnT1dXQWFZa212?=
 =?utf-8?B?RDNYLzRRbzBOUE1zSURLcW1YOERPZ2o3Q2t4Q3ppR3F1MjZFQXIrU0dXYXNC?=
 =?utf-8?B?dEEreEQ3OXJkTlM4OTlpdFNVSURiWFZDSjZvM0tlNnFaVkRhSXRPcldxbTZC?=
 =?utf-8?B?L0dWZ1NjMnFMektMcElOSjByMGFHemtpcGlQbWJXTXFFa0kwMW9aOU1oekEw?=
 =?utf-8?B?dFE3UCtyMnZlSkpHeUlkd0xGcDV2MGZmVkFSbitRZFVwV1dFZXRsVG9zdkI1?=
 =?utf-8?B?OE1ITzVJZ1Z3aWNKbGFhMDJoc29GbUxIWktvVmI1dTRhck9IMUIwZmlDNG15?=
 =?utf-8?B?R0d2bCt0TTlPbW4rQks5UXdldDkvbUNqYnZraG9abUNVYnRpWk03M3hPTUxS?=
 =?utf-8?B?MGY1ZXo3NFdkQlIzTkw2REM5LzZPRzJudDh1S0czQzFlQllrRzRGa1pJSEZs?=
 =?utf-8?B?dnhablA3UTRyZGZoWmREMXFqS2RuTGZYSUpoNWpjeEJOVHRKMjhqcEc4aCtI?=
 =?utf-8?B?YVN5KzRvdjY3QlhMRzNaNytwdTBSeHlhZVBUb2M3UmFxNzFkMGVwZGRMcnMy?=
 =?utf-8?B?bFU1MnY1YUNGTWR0amhlcGhPVERqY0U2SGV3b1NjMGY5RHNtc2UxNWpqUDlL?=
 =?utf-8?B?QW9TRWV1Tld5QnZvaUV1YlBueGxicGoyZGkvU0dEOUtWdDFwRlFxa2ZWSFpl?=
 =?utf-8?B?OW1LeGdPSU54cXhaRFEwTVlJRjRBWTlMTitMVGRNYXMrWEJjVG1uai82TTRl?=
 =?utf-8?B?ajNQZzlYNFJSZlpScFpFODIvRjVKaVFKVFNBU1ZKZG1Mc2RDOGorcXpvVlRR?=
 =?utf-8?B?WDgrYzVTLzFEakxuakloWGRlMk95aXFlQ0VuWUl1aXRHckVLMkFJOTJ2ekd1?=
 =?utf-8?B?TzN1b1I2eXpEOHZGb0U0QXd1NExYbEFlcVh6bUtOVTNPZzBaNElnS09TMFF6?=
 =?utf-8?B?Ylgzd2VWYXdZMXBxLzhUWEd1cTZaY1lDYUU2dFJKZCtyenpTK29wQUp2YVJX?=
 =?utf-8?B?c0l3YkRBYXNHVXN3YjVNWUl4V09ydTIrNVdNeVM4MGxqb0xFTHBJeXhQNVpG?=
 =?utf-8?B?Umx1ZGY5UDFyK09BZTkwQkFFdHdFMm04UGorRzN3T3FITGgwSTZQWVJTOFF1?=
 =?utf-8?B?aVAzMmg2SEtEK1JMaVZtdTNudkZwaCswcitwNEVkTThKYjJlWXVLNDQvVG9W?=
 =?utf-8?B?ek5TSVQvZDBBeTdVaVUzTkdtUUtPQk1Bdlk5VjBUR3BFYlhhV1cvR3pGOTNM?=
 =?utf-8?B?MkdjRFREb2FYeGhyRFZybUVUY0VqOVBzbmhYaHRJaU5Pamc5amM2SGNJUU1Z?=
 =?utf-8?B?Umo4T212a25lV3FGOU9YOXBVMEgrNFF0eXNJaDZyV1FpNzhaSU1FelBNSmZi?=
 =?utf-8?B?Nk1uRFhwaGE2Rm1zdElmdFArbnFvanptWlpIeEtKUi93Ym9yc0Y3THJtTHVr?=
 =?utf-8?B?bjF4MzlISnNWaHY1UWgwTFRiNkllTW92ckxmUDJKVHQvQXh3M3JmSjN1THVG?=
 =?utf-8?B?V05GRlEyUU5RZ1dvR1ZiZEdmV2hxcHJuYXhYRjI3dGgwU3VBc2VVUW04UVZI?=
 =?utf-8?B?NUpaUVFzejZ0VXJxMU5Qdm5hbk1CRVc1NEM3Zk4zRFZ5QmtJRGRqMTQrYXk4?=
 =?utf-8?B?NjRsYlFXLy96eHhkTEJZWFIreCtBdnVqRXlGNFJLRmoyMDhVWEZoWFQxU281?=
 =?utf-8?B?VlVpSHliL2FGTTFIMDBBb2U5a01VVFkrd2xEbzAzZDZVNUpZTEhaNmZ4TlA0?=
 =?utf-8?B?UHg3S010MG1Tcy9xbmlNam1OY2ZwUzBWM2d0UStXWngyRWVwMElIMHVwblRS?=
 =?utf-8?B?VWsyZnI0RVZYcVcvWFRvMXhQZVEvdHh1aW9UQm9ZbjRtOG9idUZJR2NKS0ZF?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Rnk4K0EvSVg4SERXRUxnWmhYTjRFY0cvZVZYRFhVSitHR3pyR0lxOFdabjRv?=
 =?utf-8?B?ZnBVUTc5dURIWE9UVjg4NllxQ1hYWUxTRlhuUjNLd3hoT1llQ1JLdFJKSlp1?=
 =?utf-8?B?NmpxYWJCN1JIa1MzaTl0RTB1TDBjZWNzN0VoNGZWVmFRMEdMUHlFVFNNeGc1?=
 =?utf-8?B?dlJKTG5LZHk1V3c5RHNjeFIrNW9FK2U4S0FWVG00UVdYZHVzWEt3OWdKLzlv?=
 =?utf-8?B?NTlDbXd1aUV4WjczcXR3TTZLV01QdGV1c29aL3lQNGlWUXdkcGUwSm9mbjly?=
 =?utf-8?B?TVdBUURBNTV5UEhvc2pOeXJEb1E0bVc4RnR5Mm9vMy9WRVFTRzYxcU5lekov?=
 =?utf-8?B?Q0ovTVMyL0o0Q3pMM0hGQm5SRDZYTllGa0lUNUJGcmEyWEZMUld3bnpIU0NW?=
 =?utf-8?B?S3gyaXU1Zk5rVGpoMWt2eU1LNndsYnMvOVE1YWU5UHlpUVRwOGZhb0h0MlFJ?=
 =?utf-8?B?RmlnVXlSdzdXUGJ3M0tycEgwZ1RKNmFoMGF0ZUY3YTFXQnQrTXNvZHYyZVVX?=
 =?utf-8?B?M0lMT1Y3d1ZId0h0dktHN1FyeXVIR0Vmc3pqRU5mcWZSTGRIT0t4QnArcDdk?=
 =?utf-8?B?L3lkUlBFRm9CTGpzOUlIUVc1eUVGbTBFOWRVRVExelRxM0ZVRzZLNU0vT2Vp?=
 =?utf-8?B?SU5RdlI1OU12RnZraEtPSENFdDNPckw5OXhJMDhUMXlSZ3dFazNVekRsMjBC?=
 =?utf-8?B?eXdCZnFDNFFGVCt6a0RtbG0xZ29ZeW4vdllyamhlbXpOQzVtNEczYzE3ZDBS?=
 =?utf-8?B?bmwxQS9nMVpLUXRGY0xOUzA5SmlxYmd4bDlWdWt6RnFkSWRPSE5qaFFyYkph?=
 =?utf-8?B?SHJaUFlka1ZGVDU2OXlwcEZlSVFjdUVMeXJuN08vQjdqQzFQdDBqVlM4ZTJZ?=
 =?utf-8?B?a1hvbTR3VXR6TnZDR3NnR09ZWmY0QjRoYk0xSzlXeUE1a240RmVvNWJkZHNH?=
 =?utf-8?B?RnlGT3VEVW5XeVZWUk5VTmJPS2tUenlVbjBSb2V1R3hlWVVEZ1YzaWVnMUhF?=
 =?utf-8?B?TEVoR0pNMTZETS9sb0dkR3dId2JlOEVCNEE5ckdySmNoS2ViSy92OGZBMFVI?=
 =?utf-8?B?eGVxSytkbXNXVkpLdVR0dEpNODMvRGxlai9lZGNvQ1ViNnpPWGtSQ09qREhI?=
 =?utf-8?B?T1hHTWhrMDNrcCtZZGFLTG51aXloVmJ0WDQ2Vk8yeEVVTmpmSXhRQzI0SEVV?=
 =?utf-8?B?ZUZqdXVFUkZSeUZVL0VVLzMyUk93ZGtlK0FBb1R4dzV2UE5RQVhLeUg5RVJq?=
 =?utf-8?Q?AZhmeLhgIadrHwi?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f05491-2055-448c-1f30-08db297a0a8e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 19:33:54.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWFhF5Y8h3QfngxlYAATJRut4dhz2nIIIMG5UNyOEJwIoljN2+QiW/jSUYIQxos+eceSbWzBVdg62EDLEJNiNPc93FYJU/U3+P8yj+9kA8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5222

On 20/03/2023 7:22 pm, Ковалёв Сергей wrote:
>
> 21.03.2023 1:51, Tamas K Lengyel wrote:
>> On Mon, Mar 20, 2023 at 12:32 PM Ковалёв Сергей <valor@list.ru
>> <mailto:valor@list.ru>> wrote:
>>  >
>>  > gva_to_gfn command used for fast address translation in LibVMI
>> project.
>>  > With such a command it is possible to perform address translation in
>>  > single call instead of series of queries to get every page table.
>>
>> You have a couple assumptions here:
>>   - Xen will always have a direct map of the entire guest memory -
>> there are already plans to move away from that. Without that this
>> approach won't have any advantage over doing the same mapping by LibVMI
>
> Thanks! I didn't know about the plan.

To be clear, "not mapping the guest by default" is for speculative
safety/hardening reasons.

Xen will always need to be capable of mapping arbitrary parts of the
guest, even if only transiently, so there's no relevant interaction with
this new proposed hypercall.


The truth is that Xen will always be able to do a single pagewalk faster
than libvmi can do it (via mappings, or otherwise), but if libvmi does
properly maintain a cache of mappings then it will be faster that
repeated hypercalls into Xen.  Where the split lies depends heavily on
the libvmi workload.

I don't see a problem in principle with a hypercall like this - it is
"just" a performance optimisation over capabilities that libvmi already
has - but the version presented here is overly simplistic.

~Andrew

