Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A553D6F5874
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529197.823320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC6q-0002jX-5c; Wed, 03 May 2023 13:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529197.823320; Wed, 03 May 2023 13:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC6q-0002gX-2c; Wed, 03 May 2023 13:01:28 +0000
Received: by outflank-mailman (input) for mailman id 529197;
 Wed, 03 May 2023 13:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puC6o-0002g5-MT
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:01:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a23f189-e9b2-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 15:01:23 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 09:01:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6455.namprd03.prod.outlook.com (2603:10b6:a03:38d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 13:01:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 13:01:06 +0000
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
X-Inumbo-ID: 9a23f189-e9b2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683118884;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GJeHLp374TLZGI7k5umNOKZxgQ00DxIGQ5macyftYIk=;
  b=EuylkQDB8unKNJXhf6FGTPqKevuhQE4hyhELKpOpzJu2DHns5Ysas5Ny
   6JycFiPh9ubnLEm7CRua6HvCYF1xNaGVSCmVYnsaj47KxL7AeYvBbKJr5
   CHtc7QQGoV+BCFVD+XqdugRgJk5Kay/o1uS3GB46qUs8f5Xqgm4+AqSoh
   M=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 107038349
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E3EDQ6jzElGaSw/snzeqlWYZX161eREKZh0ujC45NGQN5FlHY01je
 htvXGiBb6uKN2r3f95xPoW2p01V7ZWEnYJiHAplpCw0E3gb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQFdABUZSCjjdi974meestUgeFyCcLCadZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1YLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXnrqU62wHCroAVIC8tc0S9jejgtnCvBM1vd
 Q8e+XF/lpFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoHenUCRA5cu937+thr3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslROOZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:9PNNKK9A0U1MmP7kRIluk+Fcdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQodcLC7UpVoMkmsj6KdgLNhdYtKOTOGhILGFvAa0WKP+UyDJ8SczJ8X6U
 4DSdkHNDSYNzET5qaKgzVQeOxQpOVvhZrY49s2uE0dKj2CBZsQijuRDDz3LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFM7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiPuBtVt6ZTcI+l4dY2xY/suW3XRY8GTFcdcsoi5zX4ISSeUmRQXeZ
 f30lId1o9Img7slymO0GfQMk/boXwTA7uI8y7evZMlyvaJAA4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NkOQhx3lR5zWJSFcZ4JsuZkZkIP8jQa4UqZZa8FJeEZ8GEi6/4Ic7EP
 N2BMWZ4PpNa1uVY33Qo2EqmbWXLz0ONwbDRlJHtt2e0jBQknw8x0wExNYHlnNF8J4mUZFL6+
 nNL6wtnrBTSc0da757GY46ML2KI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw/+2ucIxg9upBpH
 0AaiIqiYcfQTOfNSTV5uw0zvnkehTNYQjQ
X-Talos-CUID: 9a23:lTQ/fGONbGpgn+5DRXVXrUUkOsofeVLm6UfyG0idWENiYejA
X-Talos-MUID: 9a23:kr82ogkFfIc3tjdZ4hgsdnpQD+F35Yi/UXwzgMoZi5fHPy8ragyk2WE=
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="107038349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdRdI2MYENYPMvkUlGRUrojLTp1a9nINojpWGkebCTIVzq5yPXblNqdzrW0cMBavHCM3LUHFBEgbSi57QcEyRhtIPL+B/YUdvno380OsB5/u2Djun0yLcuxW1GrZrpHs2tDMkDIUd/NKI6eQuuwK7656YmDHd2cjqUszqOlyIVx8rUPA3xvGHFt/CCwbh2absd9Zlb8jAJtiqXdKZhDLmPv02Ql6OteyOaB8oRTXBT6SIoiaeZiuzX7b5SZXyl2XmVrNOLBaxY33VQ46H9YdAltLCFQq+vGiU8Udmq6ZbUz2F8uZrVtP8++GgY3Y7XxEsyPz8SMioGryo4bYlsaFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJeHLp374TLZGI7k5umNOKZxgQ00DxIGQ5macyftYIk=;
 b=Q6GWLFamqfwaRhklE/1Kzyx9+GMD/SZ5FjTiFuL4nruMKheqKzKdEcu4JUDJCXcgKBoYphtYjMkFV9vJVaEdsK3TnKPTwDBxj02HYzBJdSL+7/D7An2w/B46DfQN3JOB8Ium4JKuY9iy2YWbz6REqT51zLiaHUhZPdQSuzK4Rhhpzte7kpbrLDsTcTJ5d2Xfr6Q2zNhf3Scws8NaUJNecXhxi4AM1EEyCXXZ7/L/IguILxflt0X4nurdRAVUqpOfgY/NGzP51MRUDHKHK8Lm1g9OpogsVXwOFaW6b2ziUjay/oFIka69DkO7U5HRxgHwUH23sbOsdRWJ9j9Pjun9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJeHLp374TLZGI7k5umNOKZxgQ00DxIGQ5macyftYIk=;
 b=bZFKgATTh7lyuBDXnvYYZ0ZMmB81eKMrr3GhI79Smm6NRU8xZkO4jZRJsCQ6quHiA3z/VE6FZpAcTplRSKsmXqb3gRNZf4HbDnZKyHIiyauPYUn3WpGC+jBdXOEkwfni2XK4zQ4Oy0OhDWqP/dgKfG5+7ds1PATqL4yNVeju/CQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <836de116-bfac-3bf7-ef36-9f83d7f7dcc1@citrix.com>
Date: Wed, 3 May 2023 14:01:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: xen | Failed pipeline for staging | 0956aa22
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6452557e7028b_2a54f38959a5@gitlab-sidekiq-catchall-v2-bdc885877-cd8zv.mail>
 <7e21773f-7178-5c8c-f7bc-941308d0297a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7e21773f-7178-5c8c-f7bc-941308d0297a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f273861-27f2-4e3a-015f-08db4bd67540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ehDi5b9lYW0T4FgBnZJNFEiKnjJwHHNzamW8VeU+W+ppsNO/PhejbPknKuvXx+H0AqFmt/k6FIvPmSlMZeD+R/XrtYo1u72Cz/WsH9EDMFjV2mnbK9Fl8oHKYtyL1437SRqxIr9J2eOihXY0sa72fiQ0jTE607YklNvF73CNr5CeBs55049a/pyeiqAZxVsl8NC9hBmACDyYjhA9/jrbypiZ1HGM9slRAyqpskfu2Wqc374Qkaie1JEct/V18zBsGnePIOobLwW6OP86hL0w+WAMAoSPywxcW+m6V7lzMekWlT1xtJ3CQc1sDlBc3sCFv9urdTPFVNcXTPHHoZaCLr2bq5+nIsI33fZifhssF0ir0v052gqdBqUPMzYRFoyMhez5O9r+69RMue+Ny91U+emiwtFiSJnbuyydoDeublNnQ9UbKIHZZl9YZfnpstarG2u6Ci5VIKh4b9uEgrewe8k3APQPmndYeSMAtNtd+ShuWKy4qJOkCU+Xf3+nNWX5108j4B7klkkSNxFLHHujutZwqkIxmlKnSNvd3lugINFpzL9wCiOvSWI8+vtARVfXiFrr6nrA0pKBFTXxko0kL7iQmfIAEut++hHQABfVl53e5e7xbb8ydOQrOgZb3DEmc1Z3h3lxsMqbeoAa5S6lu+1UZV4P7cyTPQYmDH/eMdCkMg8nDMXQUr6C4QnedFRt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(5660300002)(6506007)(966005)(8936002)(8676002)(83380400001)(2616005)(2906002)(186003)(36756003)(82960400001)(38100700002)(86362001)(31696002)(6512007)(26005)(53546011)(41300700001)(66946007)(66556008)(66476007)(478600001)(316002)(31686004)(6486002)(110136005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTNkalJ6SDNvbUphQ3ZieVMvL1JqY2l3LzU1S2ZjZWlkQnE3em11cmtiQVFN?=
 =?utf-8?B?aGRBZXVVdGFLZDlDL2Z3NWUrU1V4SVpQNGxvVDAzbjRxZzI4Ti9kdDhUTzFI?=
 =?utf-8?B?STlEK01XbnJabFlOWEtLU2IrTkdpUU9lb0g4UjhMbFpYOGI3Yy84UDhTTUFT?=
 =?utf-8?B?aTR3bDhHU3VXeVBUWm5wb0s4REZ2NWovV1RQREdQMGlXajRpU2FrZm9iQ3Q1?=
 =?utf-8?B?RGliSFhmVmFrcjB0c1p6N0JyKytpa0tEU1RTMERyb1RjOFZTN2pRM1pYTnpM?=
 =?utf-8?B?bHhNSjRTMFRRRlF1YWtBUERrU1pyNk1QNkpzOGRpdGY0VHBoMTk4R25XSHhP?=
 =?utf-8?B?TXZWZGpWOVU1c1hRVGlZdjgyWGh0YXlXOSs0QXU4d3JPUU1kYm5iclc0WmNl?=
 =?utf-8?B?Qk95ckdma0hyUFYzV2ZkbFZnUFRiVHA3TjFQZ0JFWWtQUEVTN242L2MzZ04v?=
 =?utf-8?B?aWV3Ym96Y2QrUm5NOWlOWWpyUWtwVEsraGdqVURFR1FwTU1CUkdlWUlFVmdW?=
 =?utf-8?B?Z1RGdkRCdVFiUmZYOGdTQS9jZXVsckFtTlREclcvL3JXaUpBNy9qQ1NYS0Zo?=
 =?utf-8?B?c1hPVFVMZUJMdWozdFVoOW5ZSE5vQmFCNDYvZ3RXWFZKR2dLZDdLdVV1Z1Fa?=
 =?utf-8?B?RzlwUmZTNUNJSFVXWFJTcmxzbW9neS82cHBjRE1Dak45LzZkUUNUSjM2eTdE?=
 =?utf-8?B?QVp0UXJrWTI5bldsNU03N0ZNSU5rZ2dsenBvdGF5Nm1ubUplWHN0SHVFWkx5?=
 =?utf-8?B?T1pQRkF2TGJVbUwrcXdFeW1ESTRuOFA2bzNmWWZEd2Y3VFAzS0NicG9RN0Nw?=
 =?utf-8?B?T1kvbnRGd0lVZXN0NVorbVN1ZmlmUlFqcXE4dlNYUFRGTlBLdEVkZVB6aWEz?=
 =?utf-8?B?L2tUZ1RlQnhNM3ZFV29YVnZZcHc3U01uekVyUUJEU3Bpb1k5amhacjZFQ0xi?=
 =?utf-8?B?OU5SZnd5dHZZMjJXUDRENUZ1Q1ZwWnZ1eEVPTUZxb1FReERrV2dKQ1NxWGdX?=
 =?utf-8?B?dVcraUlTS2tkVXMwSER0cEFHWEpJZTFuOFQ0d2p0M3k4cEkvc3FKQ2srSmxI?=
 =?utf-8?B?OHBCSE5TaTh3dWxGRDhyOUJwU1N6MlpWYmZFWDRadDNkSi82U3JRcnZjck53?=
 =?utf-8?B?QjhSSFRqUndmTldESi9zaVNGZ2ZucG1oZXlScDZWS1ZwMmZ4eXd1RXRaTFhN?=
 =?utf-8?B?Tm5EN1VFdVV1M1JEcXVOYlIwdUJTQnlGM0tPU0tjLzNJbnc2a0NKdWxmT2d6?=
 =?utf-8?B?VHJUUHlDOGNaM0dRTDRwdCtXdDJoS1ErQ1VvemE3QnFtOWdYcXU0QWdlZVN4?=
 =?utf-8?B?Rkc5TStIbTMxK1R3d0ZHckhZeHZibVhzV0srdGhTdkx1M1VjZXRoQ3hCemJ4?=
 =?utf-8?B?OU9CYXZtQVlLd3Y4ZjF1Rlg0Tk96T3pXL0h2bjdoWllRUUVwdXBleGRobGhx?=
 =?utf-8?B?ZG5VelArVUJXY2hUOWt4eDZ2Wm5ZeHBKSDg1OHBsQjIzL1hZaEMySnFNckpp?=
 =?utf-8?B?UHZKenZQOGZvRmMxNHpScWhwalkweTI5bUl2YkVCNXBsSk96cEVFbnRSOFFx?=
 =?utf-8?B?Zzh5WWdTeSt4TE41OGdhMjZ2MHFib3Q5NVNqcTNwb2xaNUROQXAvM3FnYkV1?=
 =?utf-8?B?MnNNT3cxUHRCUmVETVJ1Ty84bGFEQzgxNlZZWGIxcjdCaHcvOTJrSzFNWnhY?=
 =?utf-8?B?YUlQU2QzMGN3UGlVZ0pHMCt3OGtBYmM1ZVJLOEdUQ0tZR3pzOGVzUnUrZ25o?=
 =?utf-8?B?VTlwM3JOWk9QWFJxckNNaGExYzd1ZTFzREQvaDMwb1RacXVHQW9DalBHT1lH?=
 =?utf-8?B?bU91a0NyRmk4d1RwU3M1RHU2SFIyeWp6em9TUytIWnIzTDU0eUx1RHhWRzdZ?=
 =?utf-8?B?Z1R4dE1QWFNEcytJN3BQNEUrcXhQMDkrdyt2N2hPeWxPbUpWdVBMT0Z1bWxT?=
 =?utf-8?B?dTl4WjhReFdLUEFyQ2dCdTdwelIzekhkYnBaNW1QSGhXbC81MG5RNnViTE1t?=
 =?utf-8?B?MjdERzBLMHY3enpvSkdFTmJzOVVYS3Rkb1hlTEV5MnYvM0lmTk5sN1gzcldn?=
 =?utf-8?B?QkF1UnE5NjNKdGxTYko0RERDcWt0N05iZkdOMG5OT2ZESmZYb053NVZ3U01k?=
 =?utf-8?B?UEF4aGY2UVhpZk5UVDcrbjYvSWxhdWhENWZXMXZ4ZG1xTjlkZnVUV2VnVVgw?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xJrZd+XJIx6oQil3B6AGjOLY9Zqx52+ET4H7bB384ui439eVrMEmWEpRzbcwQB5rQ+B9qVugG0291cVPmaWLMk5rihcDKLIh3Avo3Y4FpWjQrzmoaB7mBxU+SPfqq4F3yjoopHs2mTduoV6I9uvzlUSPnq4J7nX3hOEc6IOz/mG/tUVLF5N5OdL0OWoaomuGtqxBoCKUYRa7vlxuFPFpZddTgnJw/J9QA0q9NhbZAQEsbog4nUGSlZ9ja1rVjlmYpYyF+nBQdHtfnGRHZDNWFpJi/zmVd6NLwfJoHkflJSut8242lByuiOzs9zwhYmt3dZr2wRr97Nwdw9mOvFuYwAduWqJId0u0SUFel075WzPsyuZvNKPg/y42SqYAelYOcgAYxZX9uftzMkC+inqiDQ545exvnMCBnbAAneGmb7aRoTnIf8VP/gP3DsKyPHkDYoWay3kF/gA74qXv/dhgi9NuQTpqWJXz2SC0kYiEsnOvqKyLh9t3frEEvwhRG1hY9G3tT9idc+qzGF4gkOq35eEwN5NCN61JQaq2OPaOFXDItipFYnjOhSkZ0M/Nc3AiX++tDGm1TLtze3PU2DSWAAfjDINtSyJXz0+PfpRs29kFDBjLzSlU9hJoh2QGK1MFxLkWMgi+MH3YS2OMIm2dhC+rD/xGos0AV9EiFaI9sxCkOk8tdlaZEHFROmd3hopHngFNHUqNik9fMJPpspegkMAZxTxqBLwQVAhgB7OfKpmbDmBJMVyOHerWu8VcCTKXdV2yU4oFKKNEwfxz64zczr3LvqsQaCXIchV9NCV1JOw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f273861-27f2-4e3a-015f-08db4bd67540
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 13:01:06.8357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX9hDx2/qkMUM+b6snqtBuXKh5C2Uc6EabiL+4KnJpxLz4qhQILX5TgBeSpnZK3cYgrhIk3WPU88vrvF+N2xVztoyWfKR++r18EEi7ckBrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6455

On 03/05/2023 1:59 pm, Jan Beulich wrote:
> On 03.05.2023 14:37, GitLab wrote:
>>
>> Pipeline #855820014 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
>>
>> Commit: 0956aa22 ( https://gitlab.com/xen-project/xen/-/commit/0956aa2219745a198bb6a0a99e2108a3c09b280e )
>> Commit Message: x86/mm: replace bogus assertion in paging_log_d...
>> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>> Pipeline #855820014 ( https://gitlab.com/xen-project/xen/-/pipelines/855820014 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 6 failed jobs.
>>
>> Job #4218447934 ( https://gitlab.com/xen-project/xen/-/jobs/4218447934/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-clang
>> Job #4218447943 ( https://gitlab.com/xen-project/xen/-/jobs/4218447943/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc-debug
>> Job #4218447940 ( https://gitlab.com/xen-project/xen/-/jobs/4218447940/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc
>> Job #4218447966 ( https://gitlab.com/xen-project/xen/-/jobs/4218447966/raw )
>>
>> Stage: test
>> Name: adl-pci-hvm-x86-64-gcc-debug
>> Job #4218447937 ( https://gitlab.com/xen-project/xen/-/jobs/4218447937/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-clang-debug
> Two of the build failures look to be addressed by Olaf's still pending
> "tools/libs/guest: assist gcc13's realloc analyzer". I guess I'm going
> to commit this with (just) the two R-b that there are.
>
> The other two are less clear, at least to me:
>
> checking for openpty et al... configure: error: in `/builds/xen-project/xen/tools':
> configure: error: Unable to find library for openpty and login_tty
> See `config.log' for more details
> configure: error: ./configure failed for tools

Olaf has a patch for these too.  "[PATCH v1] tools: drop bogus and
obsolete ptyfuncs.m4"

I haven't got to looking at it yet, while I'm still chasing the ARM bug.

~Andrew

