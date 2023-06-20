Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59103736BB8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551739.861413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaGU-0005GX-BF; Tue, 20 Jun 2023 12:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551739.861413; Tue, 20 Jun 2023 12:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaGU-0005Dj-8D; Tue, 20 Jun 2023 12:15:18 +0000
Received: by outflank-mailman (input) for mailman id 551739;
 Tue, 20 Jun 2023 12:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBaGS-0005DS-6x
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:15:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ae61e99-0f64-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 14:15:13 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2023 08:15:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5525.namprd03.prod.outlook.com (2603:10b6:5:2d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 12:14:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:14:58 +0000
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
X-Inumbo-ID: 1ae61e99-0f64-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687263313;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nZFmmbD4KxEkGIrG91LS6JBsu3FsW1w62HJVulSa27g=;
  b=UwE6UprcandRTzMEKjjr88pPRaNRsLCDDTGEoAj1YyA6/q/P4OMn+xan
   ndSBssq5zTLtgpX1n9mX7f0O/XfOh23JZU2yqNGf3UdkiM3Py6LGCmivu
   /7EdxwSL5Rd2aA+guy4pfkwIoBIKxCHz26xuLQMOhcBX0OUZzWDcyvuYx
   c=;
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 113863407
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gqkMl67xNlYqYXsCObd+WgxRtBvGchMFZxGqfqrLsTDasY5as4F+v
 moeCGvUbvneMzakct1xPtmw/UMP78fTydFhG1BpqyoxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4R5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 L8VERNWTw+6uvu20rOREPVyopUtI5y+VG8fkikIITDxK98DGcyGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MkEotiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtJROPjqqY16LGV7itQDRgqRXXlneCkpXe/AfVxN
 hMz2xN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A6d+zpog21k7LVow7TPbzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGFhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:qf7Q0avRkoLrVbW4vI7FI7p37skCa4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBXhHO1OkO0s1NCZLXTbUQqTXftfBO7ZrwEIdBeOldK1uZ
 0QC5SWTeeAdmSS7vyKnjVQcexB/DDvysnB64bjJjVWPHhXgslbnnhE422gYyhLrWd9dP0E/d
 anl6h6T23KQwVqUi33PAhMYwCFzOe75q7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3di0Kov6m
 /Mli3+/+GGv+ugwhHR+mfP59AO8eGRhudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWC+Usni9
 7FpjYnJoBW52nKdm+4jBPx003L0Soo6VXl1ViE6EGT7PDRdXYfMY5slIhZehzW5w4Ju8x96r
 tC2ya8u4BMBR3NsSzh75yQPisa3HackD4Hq6o+nnZfWYwRZPt4qpEexlpcFNMlEDjh4I4qPe
 FyBIX35epQc3mdc3fF11Mfi+CEbzAWJFOrU0ICssua33x/m2149VIRwIglknIJ5PsGOu55zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIHz8fZt3e07lmtrS2vEY9euqcJsHwN8Zg5
 LaSm5VsmY0ZgbHFdCO5ptW6RrAKV/NHAgF8vsupaSRh4eMAYYCaUa4ORQTeoqb0rsi6/TgKr
 WO0Mk8OY6lEYPscbw5qzEWFaMib0X2a/dlyerTa2j+0/4jFbeaxtAzUMyjUoYFQgxUE1/XMz
 8kYAXZAvlmwwSCZkLY6SKhLk8FPHaPsq5NLA==
X-Talos-CUID: 9a23:vzgykm+n1v+TTqfC/9iVv2dXF/kGKVzC9UrJI125Izx1VpnER1DFrQ==
X-Talos-MUID: 9a23:TF8lxglbyxgjYZPLTxH0dnold8Jt37SAVnwUjLo/upOjGzEvHBak2WE=
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="113863407"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfvk8Os8IpHCA9L6WNSXtaC0Gx556d8HbFpGbESUFXkoKKA+OGqJtjzsB5hEbuF6PyyckeP48F/4q/yNesb5ommNUIydfrdRczVwxJuRLCMvMXEfxj3rkhefB57cm2aGI0eWy0AgYXMhsq6ALcaiklFOuH+6q5DJGrvPAwmVXfxVc2FzXoskgQYT5VNCchj5dx6JhhwnocfWWuSVVlUfEvIHTk2z7KrEjcsOa6QdAJ0C7XM65PV5JAjk+Pq8tD49bxWj04eFSAjaGTVHOaQft5ev+pAtFGT3Sfe6xKXwjzTVKV9A8NTqJUYumLgN8KQmCpMYzkV+5jNCvHVL07m/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utkk6jqvfjUT4R6JE1ZRyeBl5YeX/0vA5B70zk12NEk=;
 b=JJxmKyF/Zfs+D8ykAn8u9EGfPzfSTLWytUmiausPNOwqGH0Zi8Gyg9gIdZqMjfyAfPqy8FXFwoAsegqcjqamrq9vggZSJ83eBlHF+puryMJ4O6iBPlIHZxsLQlVPjWwZjD2Eu4QNRqRhh23fv0M9m65zdV8bVViyz3dKvVkjzLr8mqZ0K25v5cMCGrfUorv8yYiTjZ6u+x5eilcOaj/v/gUBxzZvprrxUGzRuOsiPc6Dw5hpE72e1sbQq/hL41bK1TohAd9EoxU8tzFc/NQ/cbGOwfpiTSPL4uvsQuuxhGJ5sEOkvpOfvffOgpehWIC83NYpM9ReMJbkEcyPlHwSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utkk6jqvfjUT4R6JE1ZRyeBl5YeX/0vA5B70zk12NEk=;
 b=jqk7vYdr6+H2aVNcMN3r+MPEYyJasO/XsQPVVmpKZZn8BsQqPegLeKk9VCc/PFlri8tkEaDyQC+5fpMsFCms+e3p68Vzs6Vp7iq77H58DpPVnR7Jp7kMlxMOsKDR5YeAPxBgc0nwo0CmRXRbXFnJ6g/ZAieWYWCx8li+5uFNhF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <05cd0d2a-3272-b73c-2c1f-cee658f39892@citrix.com>
Date: Tue, 20 Jun 2023 13:14:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/13] libxl: change the type of libxl_cpuid_policy_list
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
 <20230616131019.11476-10-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230616131019.11476-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: feb617a9-1489-48d2-0472-08db7187f712
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dqrMJogBrGdjHlNVgF0ILit7cNcsp8v2zcMnqTHaj3tvsSo+m1vDa7qkRSzkRrl4xz5aLxpeCjjv/Z1XQW/KvuX6v/N74oHluLaUzJGQFnnz5woQtfaMPxaER8ZkwzwVbP6YXhEf91aTtZiY3+lpc79F4tG2jJ2T1G4GomERDN634OgTwtCl7D4glyyGbppSy8oSJcskVmXMwWKJcvR8NjGaEtDxnMKuWofs3rn8Kal9ELBrgrpvX3lO5sKAAGNvcptBRMTlI9cE322vvUNrxfup/MTBTOKWfCU5oUJ4M8TV8Bh88eL5IALXN6y+dRrVFJ4WKNJ7Q5IasqLeLr/yn5WcymmnHAMkVttGPGEOI2ULr6KBB9Jm6EkKyuFNhkqri/vcl7BzjHRjWtgNX/hX//moIDVU4HEzNTvNwdfMqLFU65eebzkPwL8pNgt/8iJp1Rv5SZYFrKJCa5Yi1Jz7acX7YHgUskCpLI7p0j4wUBHXfScpDnej5JQfD8WtU6tzMrwLLVnO0kID0az060UY8KHR8B7UFe9eix5zdZ/w1UMpAThVfPrBkDZ1STYPGt/EnWKG32W/jviEn8XdQaiQOL1rOQhXc7A5IQKnNjhI2hzh5lHRSWn4D4OGR6vF8KnqhaFB8pTHgyDe9g/eoN8EPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(478600001)(66946007)(31686004)(36756003)(8676002)(66556008)(41300700001)(66476007)(4326008)(2616005)(83380400001)(38100700002)(6486002)(31696002)(86362001)(5660300002)(2906002)(54906003)(316002)(8936002)(6506007)(53546011)(6512007)(26005)(186003)(6666004)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDRSdy9USVl5QXRGQkFoRU1LNzVJOVVBd1dsQWd5S3dNK1ZBazhmVmZJcHFS?=
 =?utf-8?B?MklQTjR1dGE2T3psTXhXSjdib3Y1eGoxWFBSR2RBenZnK0N0UVlnMWhWRjdT?=
 =?utf-8?B?dElkdk5mMEpxVEJPVnkvN01STzFFWlNjbk1UMm1xcEJhejFxdUFmSlhldWN2?=
 =?utf-8?B?MUVlaHVzMVlGL3JDWVg2cTZsOEt3cXhGR2J6a3BGK2hMNDhwbEpZVXdLeU1p?=
 =?utf-8?B?dmJXWW5oWEd1K2lsWG11czZocjJ4RERjcWRiY3FVUXFrdTVQR1NrWUJmTW9o?=
 =?utf-8?B?ci9tRndJcVFQVzZacCs1QnA5M2lCeUpjRUw0a1JIWUt0VFZseTl2T283dVVv?=
 =?utf-8?B?ejhqRFIwWHhiQ2QxWUlQRGNKa0k3b2tod3F0WDNUT1VvclJ6Z0gwTHVnek1k?=
 =?utf-8?B?L2VuVXJSbENVc2J6dGYxdUIyM0tTSW13NnVjZjVhRXdhdjUya2ZqTXIxbjNo?=
 =?utf-8?B?cktWN0xyMVFpdzNoRENSa002VHV4RlRUWE9wZGRNbHBSZVdySTFOSWhmVmcw?=
 =?utf-8?B?L0l6b2pra3cxZUhGd3UvUndCREZHdXBMYVVWVHFWbUl4SjFLSm1xUTg1MzBI?=
 =?utf-8?B?L2VlNHRCNURtVXhvVkMrUFA1S0dVaEJ0cWhPcTlNQXVIZERlTkxXRUhUaUU1?=
 =?utf-8?B?STYvajd6b2ZSY1FKeng3UnR6YzhEdkxXZ05sZDFoV1Z6U2hvaEQ5N25WWXps?=
 =?utf-8?B?bzUwUWt2RHNUZURSOFRkOWRoR3JBTXBhSSt3TEtMZnNORWhCS3hpNUpPbFpu?=
 =?utf-8?B?bjEvVzhVQW94WFpQZGVLMnhvd2ZKMnhxTTVkWVg5ZThhQi9lM3RKWlZKWjhj?=
 =?utf-8?B?ZVhScWgwSDdlR29DZ1hQSW80NUk3YThuNXEwYnVzMmc1SFNweC9iWU56b2NV?=
 =?utf-8?B?c0NYVVhtcDRrUTFFckNlTEVnbW1KT2FzYWdzbGhmdzh1ZTlxOFJ2V1NZd0w3?=
 =?utf-8?B?UjcvZkNuY2tNNnNwaGhhSkRDcWdXTFVUaHE5MWZWV2JFTlhacHFTQmpsdEpN?=
 =?utf-8?B?bHd4Z3N3MnBWVlByb2ZLQWRacEZpVy9FNnNJSnJreTJUZHVRR2twSUtlbnBR?=
 =?utf-8?B?Tmh5YVUyS1hqRk1FTGFGak8wZ1l0ekJtUVhIYitmaW1zTFJ2d2t2Z0NtMzNm?=
 =?utf-8?B?bnBQUjJNK1BOUHgveEpwS1NFa2RmVldwTkw5aytYbWpyWHAvSHowNVdISGda?=
 =?utf-8?B?VHBQbThNOTNxZW10aHgydlRqLzlFeFdhNFd0NDZDVTJuQ2JWVFZVcTRZNVR6?=
 =?utf-8?B?ZGZoQUNOeFF5VlZxOUxZZHRZaDViRVJaWk9uaWRSeURLcHhFNXZvN3VrdEtG?=
 =?utf-8?B?djJCZFhBTFpCWXpsckhna3FNTVZjQUs5NnVocFZsY0pNQ251VmtRaWh1OXp1?=
 =?utf-8?B?WmEyVzJNWGNGMlJ5SktmR3BaQWFjTXNVakxWZjFFSFBDNnV2UHNjMTZIVTR0?=
 =?utf-8?B?emdkalJ1K2U4UU1aQi9XZ2tnUVNlSmUrQWQyNzFSN3VRN0dTeHlFaDI1YUx4?=
 =?utf-8?B?bGhwK1N6Sk4yM2pRbDlMU1g5MmkvMWxQNjlFOGJMRm5scWNBaXlOV2NSZjNX?=
 =?utf-8?B?dXdmTStxT3U1RWNFNEc0VzBRUXZHd3E4Nm5vMCt0elZBRlBaODBmOFlLT0Fj?=
 =?utf-8?B?ZzM2MVZpYnZhV09Majk2ci8zdkdGNUQrdVBJRVBJVkZRemsxS1pqQ25ZQ2xJ?=
 =?utf-8?B?UnB6RXdrNjN6WHZtZWJzWHVqVGxVTm85L241NDVYWldsU2dVZHc3ZzFQc0x4?=
 =?utf-8?B?cFgzdDl3K21iTTdXRmxZL0pnWHU1dWRDWldIWjg2YW4vRzJRRSszdHRjckIw?=
 =?utf-8?B?Yk1ySTZkaFhPTU96ZzFiN1NJc1pERXJpNUF0ekZ0ZCtrSHhZN2FBc3VOaHVP?=
 =?utf-8?B?dDNjdndLV1kyb1htL0ovSC94elJ5YlVVQkdCR3dsQTlZc3NVZWdYTHJHZDgx?=
 =?utf-8?B?RUZSWW5DNDVVTkxqciswRnJJc21WbWFiV1QxNkhuVnJMM0dKaG8vVlRWVFo0?=
 =?utf-8?B?Wm1NMzlhQlZOV2xrWVZuNzR4MWVrTUxReGpXbWwwcksrMmZPNEpILzVtRHY1?=
 =?utf-8?B?aE54c01MdVZTakRFTk4zODkvL0FYOUtSa2VuTzRoN083SGkvUWo1S3RpVXQ5?=
 =?utf-8?B?RGI4SVAwaXh3ejhIZnNrZlkyVEZvOWdlRVJRbkt5dzYrQlVhSjNqV3dYRHUx?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J3w9PP9kv/ysp0Ou8Xlvt2RU5lYEByeOskhgwspOFgCKr4DUnWn/hBgWvTCCgN4UvcXGIw3SElYtjaaw9abNd/00GautZ6nIuNf40/qq/pG0OIbuluOFoqIMGFPHpw8ikXdxfTuwt6/dzmbvSHO++en8RoqVJCneocaPUqJQZb5bmtOGDYdUSJ6P9i2RvHkVj+tl9pLbnnm2hgh4tBiyyLJX2aHbCFtDEviAYGIMyKqid8I4AnIsiR6ZXRIZ26+QQ8R71eyt1e5uAFWPaSSd89ANTIkgrOuJOSOK/lTrXi6Y7wBprlArY3RKmmhBIA7fZlXvplmS/iNW+C7VxSIpLmJ21yrM/n6noK7aOe0s5IouMyq4qHCZ03tgcCkQZqqKT9dde/piNbavbs8KY/w9/J0ghK3gGqasZ7ym6qNcSDBgrBVSA9TrXg1DsjyHVYUvUoA4K+k+Y0QWszpqBgdbCKXTGYJmZPpRiM6tMGoMvJWPvtZLLU1eFlxLGFRTobi6cFSi0N6SCQ8azlHZjv4hyAYFmQvBC0D09xQSmqn6bAuzzTGTTYKGju+jRJk324JNiaPdjAKvhcHNn55HIHboAFlZ1iAV3WxfxF052nH7mJPN8yRwFoVnetnWWcUDgqeZ1SrC22gdWWRGwHjSd0QbzFyn5kZwwsPleO9809Ny0LJjeN5xw0FidFGoT490csDo7wO67BxAQJFUA3wW105EiVajcwAt2O72IZxwdG/tfXVu8t1VZczGKeW31CGqu8jur1+52cwPgpvsxR2yeXalv3d8Jf/XFgDNYP1jy0LI35UF9we+AA02Rc8wASVYhtxtSNRsKu390i3EhJ/7SUiLMg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb617a9-1489-48d2-0472-08db7187f712
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:14:58.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7sjfhhu4LZvwiqeHhPQRRuPftYkZnCuN26f1k1hX87VAk9F0bzLLiIVTWew3DqYvxk2fYSTvzi4NoWl+0DUduBNLGkdG2KKpHvWe/cxqFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525

On 16/06/2023 2:10 pm, Roger Pau Monne wrote:
> Currently libxl_cpuid_policy_list is an opaque type to the users of
> libxl, and internally it's an array of xc_xend_cpuid objects.
>
> Change the type to instead be a structure that contains one array for
> CPUID policies, in preparation for it also holding another array for
> MSR policies.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/include/libxl.h          |  6 +++--
>  tools/libs/light/gentest.py    |  2 +-
>  tools/libs/light/libxl_cpuid.c | 49 +++++++++++++++++++---------------
>  3 files changed, 32 insertions(+), 25 deletions(-)
>
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index cac641a7eba2..41e19f2af7f5 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1459,8 +1459,10 @@ void libxl_bitmap_dispose(libxl_bitmap *map);
>   * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
>   * libxc may not make assumptions about xc_xend_cpuid.
>   */
> -typedef struct xc_xend_cpuid libxl_cpuid_policy;
> -typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
> +typedef struct libxl_cpu_policy {
> +    struct xc_xend_cpuid *cpuid;
> +} libxl_cpuid_policy;
> +typedef libxl_cpuid_policy libxl_cpuid_policy_list;

I don't think we can get away with doing this.  It makes the type
non-opaque, and you'll also break the libxl ABI in the next patch when
you change the size of this object.

For better or worse, I think

typedef libxl_cpuid_policy * libxl_cpuid_policy_list;

needs to stay here, and libxl_cpuid_policy get moved into
libxl_internal.h where it can then be altered.

~Andrew

