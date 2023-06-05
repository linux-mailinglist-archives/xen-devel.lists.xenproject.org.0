Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C052F722328
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543617.848740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67EP-000188-ND; Mon, 05 Jun 2023 10:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543617.848740; Mon, 05 Jun 2023 10:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67EP-00015a-K9; Mon, 05 Jun 2023 10:14:33 +0000
Received: by outflank-mailman (input) for mailman id 543617;
 Mon, 05 Jun 2023 10:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q67EO-00015U-BJ
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:14:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c13a8627-0389-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 12:14:29 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 06:14:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6968.namprd03.prod.outlook.com (2603:10b6:303:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 10:14:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 10:14:22 +0000
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
X-Inumbo-ID: c13a8627-0389-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685960069;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q1NJ08biqZOhzhKBThXmBMahwzB9++u+cX61197AkJQ=;
  b=cpQ/Afnt6pDIToLjU9/KmaLQtmxTi7ZCDKogURZQ2oEDuN2cDJCXhB86
   jl4k1kRKbFlYLhxt8ACJVvxk3PQbiCSmqjuBvEoIl3S0fdCsV75DEmLMr
   jGqBNiTJyXWWR50dSWlt4FDV5KGWQx9ns3yzrYGRkysNV/sI+ZlMyGozT
   w=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 114104051
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vL2jwa72S2sgI0EMtcezJgxRtLjGchMFZxGqfqrLsTDasY5as4F+v
 msXWG3QO62KMWSged12Ot61oBtUsJfSyodkSVA5pSs9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 t4aBj8pTDu53+euxKmrdNRDie0vM5y+VG8fkikIITDxK98DGcqGb4CRoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkotjNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtOTeXkrqMz6LGV7kk2ViAWCnS3m9ag20uRdNdPB
 0s35QN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hTGvPSkYK0cSaClCShEKi/Hdp4U0ggPKX8xUOqe/hd3oGhn92
 zmP6iM5gt07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitpaYjga4G25Fzz6fdbMJ3fXlSHp
 GIDmcWV8KYJF57lqcCWaOAEHbXs6/PeNjTZ2QRrB8N5q2jr/GO/d4dN5j04PF1uLssPZT7uZ
 gnUpB9V45hQenCtaMebfr6MNijj9oC4ffyNaxweRoMmjkRZHONfwBxTWA==
IronPort-HdrOrdr: A9a23:KPatD64p87pqjcx8rAPXwb2CI+orL9Y04lQ7vn2ZFiYlF/Bwxv
 re/sjziyWE6wr5AEtQ6uxo/ZPwN0819fZOkPIs1MSZLXvbUQqTXcBfBO7ZqEyFJ8SQzJ8j6U
 4NSdkGNDS0NykLsS+Y2nj5Lz9D+qj4zEnAv463pRoCLGEaDNAH0+pgMGmm+w9NNXh77PICZd
 ihD6F81kCdkAEsH7iG7w4+LpX+TrPw5erbiCo9dlsaAUS1/GiVAHGTKWnX4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0PD8phMn9Pl691bQOiBkNIcJDnAghuhIN0JYczegBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5Tf9xgX61z4qynn6jXuVm2Hqr8DVTC8zT+BBmYVaWB3E7FdIhqAn7I
 t7m0ai87ZHBxLJmyrwo/DOShFRj0Kx5UEvlOYC5kYvHLf3PNVqwbA3zQdwKtMtDSj64IcoHK
 1FF8fH/stbdluccjTwonRv6MbEZAVgIj62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 X/NLhynr0mdL5EUUtEPpZVfSKLMB2dffuMChPNHb3fLtBZB5sZke+m3F03jNvaMqDggqFC2+
 WUbLuf3VRCP34GQvf+qaGjySq9CFlUh1zWu4djDqhCy/rBrfLQQFm+oXAV4pKdSqYkc5Xmsw
 DaAuMYPxcVRVGeVbqhmTeOB6W7JRQlIbooU/4AKhuzi9PPLIvy8uPDNPvXPdPWYH0ZZl8=
X-Talos-CUID: 9a23:wOZqkm2ZB9wQO0oc+dbkC7xfEeInXHL57lzqe0qgDX15doC6Rnac5/Yx
X-Talos-MUID: 9a23:xUc9jQZZPm49s+BTkhqyuTE9G8tSzL3/DW8ilIUqvOqbHHkl
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="114104051"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTzQcaHYH3pHngZrpKy0O/kh/HuG2K4V3vTLcnWFSlfbM4uLciiSDwJtKanm3byxQGUtTkdMcu63lNOXMhtMVkgBqvgoflLZ+UnsxKoBuK+LvXak/ZufnTOQtOLikEBnzQ2l4i0Gx0FamRKLeIL+7oOYnewkMAklmVtrzlkHUlWgDKiJQpPluHgaHbd1jPQgAfEzPAp/ayvrgbGkmk4BBVWtUlZ0DOHxR7n8FiXBZRfxkotncuFBeVt86RrWjv+22jiw2zC59Gg9PYneCRqW7Fr2FK4zsGaLAyPFi3bHWtAuRSX3+MEY31DDB6OEww+7LMXT//82z5yEkgy2r35jkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dj10AEfkvdtDUJeiSOXu3e080Qt/twFOkcUr9+a6BM=;
 b=QoeM7UYTUEmLKjwNmxYG+m0CZGed3ns2Bdyn0sPZxEzs7oomRerhCFn5psLM1yuGbmei7W2EJ5xGw7JcmLsyoU6PmrxAG5aCD1s/DvhLf5M6WDeg6AVNWRNGe62ft3g8A4fR8g8+qYIPZ1nXroldb0Rp81bwoVnBOw8mLfSWTaqNxXhdxOuPEQw4dheWYK26FNtH3sKp5GIjjPLYUAL+PZwS5LYJs72CIc7e8906Ouc/g7oPcLhrLpJVQdjQU8fv5R5itO2HZBagIOW7EhfPg0bGLzpPJ/fTb8JtOMCtG3vzdZamWL8oOaGPCCwXAdCyeSme+Gjq1/Gzct8MXXGUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Dj10AEfkvdtDUJeiSOXu3e080Qt/twFOkcUr9+a6BM=;
 b=MjG5xNo5hJoc/64xd1iAHHYKoyti7oIWokvFS0RbxjyVFyRsx1ToD9s+e774wutN2oEqQW7lQX9iPqDJE7qoFfv9J6mvV6VFoVfiTBfO8BeuzL4UHTbKmxg+93T1W3gA/XhickYcUREIR1LbCp+XZ1uenSLqcLyqfO3YpmFiZec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <525e1b83-fcd1-1b48-3ba6-87843ffdd213@citrix.com>
Date: Mon, 5 Jun 2023 11:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Fix incorrect taint constant
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
 <6ce6c267-7e9d-d63c-c7f0-3bb7554a3f83@suse.com>
In-Reply-To: <6ce6c267-7e9d-d63c-c7f0-3bb7554a3f83@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c74fa4-5414-4323-ef99-08db65ada1a5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3qNvyvUKiSn7S5Lju2Hf9YA1dnU99dGQib6kbcBK5t2LTYR6pIYVtqrZKnnVGZvBHWBEbRgGWkqHjPXksuEVk4SDtRvcmBmWAity9mA0VjuT7Oyik4QQrCmPDJEmDy3xSgUAPIgGxBsTzNmDh2kM/pyeHBdXUnXlIrjTl9wfWk5GcEBweq5SoQKK9fDEbvW+6ius2lMdRfNj6pp4zkj47QMKKNxoGvgyz7UmuW0xqpaK4pgoih12rxR53wJJMe9iD9i4NIVwUBd5hN7jLfcvM04eQy42ffWRHan+fKmpDJyG4c0UfnqdQbrTfFZAKfRzPf+5jHO+SnsJcZCZQnFjW08DYOFt/GMbXd70Z200SbZBIG3uIcuVGepZ/M65j/R/mN6I/mIcdeCotkVQOpGEbii4E7+7pW6dwNZf9TAt14uJxcG2ZCd3VZ2E6Cp+uapcstjcBOD9ZVZLte5+T+ES6gLs7nkvpZP/Pb4ijC0RmWNYqHxeGGkDBCIcymbTvL5qNXKihUC1JcpElWmekRZoS6Elkl/hHSoClcPU+zBT5qYhcCxOnuvuPhprm2ezk/kJ4fwuiEdrkU4SM/kSdGwBJ/U1FAQaAV4xdpSrRLqWWwYebxEXhfZx6ERMPJAZrqNIyxbF3aVx1goehhbwgq5LQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(54906003)(478600001)(5660300002)(8936002)(8676002)(36756003)(2906002)(86362001)(31696002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(82960400001)(38100700002)(41300700001)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(83380400001)(6486002)(31686004)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1ibHRPdXFYQ21xeVZNUWhpeUd1d09LcW5HL1Z1dE54UjFmQVh0VTd3ekt5?=
 =?utf-8?B?bkE1VFVMc013cy96YjVmeC9xMWx2Uk1UUUdPQnQwS0pNN3dhUVJpQWl2SXZO?=
 =?utf-8?B?V05HZFREZUhHR0x3SEFUVXBqVkYwOG9Md01LZUttRm9nNDYwRHZUMUZUd1BG?=
 =?utf-8?B?U1o0MC90V0p1bVBTVWN5Wkt1NDFXYUE1bmlRQ0c2Q0FvSFZLS2M4SzVtTTNy?=
 =?utf-8?B?SjZEM1pEVm1UUUFWZ2YzY1lUaEV2aVNEOVcrVzdFWG5CZVIyclhDTWpRVk9E?=
 =?utf-8?B?WEpwbStDcVRFcDNXSFp4ckp2S1h5ekd1L2JrRW42ZjMxNWg3SGRWMGF1d21B?=
 =?utf-8?B?UzVGUmlrNzUzZThIWkZuYzVPWmRNbjJhUzh1OERnOCt1cDBMU0hxeXJSUHA2?=
 =?utf-8?B?K0t2anpwWllNMitRTDVIYStjcWprK3ZGRkk4WHNMYTZXek1ONGJzb1gveWQx?=
 =?utf-8?B?c1ZQSDJWMjNJdCtlY2l5VVlBakNPVWlycC9QZU5HUms4YjczL0xnUVVzVmZG?=
 =?utf-8?B?TVVSV1VhVHdxVXE4RkIwNSt3dGxqMW5VZFZTUDIvMEZVa05YdFZvcmoxWWo3?=
 =?utf-8?B?UE82OGY2RnhJLyt5UVdIdWZMQXBnNnpLNzFpUWxoUGxiMDRzWktsUmo5ZndK?=
 =?utf-8?B?czZhUEoxRm0yNk13VWRzRnlXQnZDcGJqUTZybTZMMzlFSkdNUk1hazRxVFA3?=
 =?utf-8?B?TXFIQ1lqaWZXMk9MUmFWY2YvMzdyblRySmtqS0NnZW9JL1pSeTMvd0FHc2dk?=
 =?utf-8?B?aENjUzZYN1pwcm1nNDVCUzNTZVVYcUR5M3cwVVBuWko1V01BNXhpelhsWlRt?=
 =?utf-8?B?UWNVaFhjQUZkcW9GV0J6aGFMNUw0ejhMeFMzVlFNZFd5d2dQR1NsWG9CdG5K?=
 =?utf-8?B?RElTZWpvYk03ejBFcXhKSWllVTZ2dEIrWDlFMkt2OS9oeVkyN3BCSWhsNkdn?=
 =?utf-8?B?NDBZVHhlSDVpSXlubkduMUQ3SnB0NW9qTGs2M2xJUzVoOHo4Z1NFaC83QlVx?=
 =?utf-8?B?R3dxSEdkc2htQUFYQTlVOXdCQWVrNzVGejFaM2ZRSGFtSzNtdDRVVUZ4YTZO?=
 =?utf-8?B?ZG0yZTFCZDlRMGpwK2RZN0JOVktra0ptRU41SzNjeFcyL3hLRDMvMTROSUkx?=
 =?utf-8?B?R1J2SGsyRytqR3g0SUhtT2hOOTlTVFpubm12ektPemRSelRCdW1hL0lKSzBv?=
 =?utf-8?B?YlZvQmtMeEwvaHVGOW95a2tPbDVNbjJmellOanl5TEZUNEF1dXZaZW1Yem12?=
 =?utf-8?B?Zmd1eCt2NGQyZlNXcjlOWmxSdnI3dmhrV216YWxNWEFNOHk3TFdBRVpjbjZx?=
 =?utf-8?B?aFlLK21uS3UwUUxuNnN3OGZ0VWxja1NxUkk2ZlF5TVdjNElNTUtRTDhyck5u?=
 =?utf-8?B?dW9YSUN1clNZNDJxUnJJS01jWUJpL2p2YWVSM1hJanhPQ0xNUWdFbmN0VzMv?=
 =?utf-8?B?TGdaOHJ1Z2NyU1dHb0FDZTNlZEY4eW9TMnd5cS9vNmNiZ1crU1NzUWg2S1Qv?=
 =?utf-8?B?ZEdVU0lsVkFlRnVHeDZ3cmtETW13TUZFRzhNNFY4WXk1K2VoSTI0QU5JU1Fn?=
 =?utf-8?B?Z3QxYkN5QXhmNGZwMDRTY2lFaGdKS1JUTU1ZNW4wcWR3b3lIYUFjMEIyVkVX?=
 =?utf-8?B?aGVkVUtvakkrbUhuMEFuZ3VKWUM4cTNjMkdVSm5RdU9TUkdJZVJ0NmJDUTNM?=
 =?utf-8?B?L3hQS0F5cUpCTUMyaGxnK0tTVHdKK3cyYjBOc1cvRUZlMGZaNWswZ1lvUVRX?=
 =?utf-8?B?NEE3cTU2Q2xnOXNnU1krY2JMUHhNSjlTQ0FZMEt6dG9oVC9HOHZtMk85SEFr?=
 =?utf-8?B?WHhoSGdhajFMd0tKSGJhd3hTb3A0UUxaa3VZa0NKNFdjcmNwbzBwcVpNeXVy?=
 =?utf-8?B?M3gxL2JlUWZoZHlBT3Z5UHRDT3JwSHNvMzdoQnI3bFp0aC93SCsxUXNMWkMz?=
 =?utf-8?B?THpGNU5OeE14QXRjSDJTZmQwcjNhNjQ4QnQyNmRaT3dOTHJtY3hlbGJMVXlh?=
 =?utf-8?B?Um9aelltT1Y5dVhhMHMyM3hZdkJrQVRjR2JrZUZvdWtNNHJQNEtEd3JSV1dm?=
 =?utf-8?B?ampXR1dXeWhTbGg1dDNLdjluU1J3L0JnaCtmOWUwNno2TXhJQnFPaWJFVFlL?=
 =?utf-8?B?WCtFcXNMMkMrMzV4TmRienFpWUhCYzdPajExWmxhaytTWkhhdStyT0t0S3dq?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xkbj6ol102Gp2mc+CVdAOemHOqWvxBH7B+ScTsq7oaNJJG7m3MsKOg2bwj1YQynGIsZd8P61/mFrOrVbaqSysrsoPOApsMnu2VK/c3LwnjOFqKOBDCe98UxjWQmWx8CZfiyV6vRBlxeXlEphRKHA8d4sRzoXtiVf3Ox8Rs1g9R79e7v1EdnbiVj1SQtILwqbR+EMHM/onKfAlhnQhUMLw2NeWkoXYjBfZ6hkY2LFJFkbHyKzuvDnzsZDkf6UlP30U0PVpeW7dYe8UI5uftpSmyyt3U6Q1miIICHBOlTyJ1AyOnsfN3fQy8lxKWCddpaPSiw0Euh/M8lXoT3Ah9NDJdHiu33xCGg/laLsIDM2AQAIa5LSpPY9PZfsS+jBfkqHDcyAT/fedOnOlnpN2FbiekreI7uGyXgc5nb44A5GDTFBmLXuEe92Jn5yNsXbXhX1JE27TyKQypeGLFLVTpR75R+WGkeIBHZ6JYJcLoWGZenNuhiaPjlIGJvewM2ZzAE6hcCm6CBENDkGY1khEgoxU8bF2655lHYdis91i3itPLT5aKLXarlZjBQEpGHg6jJHlUKd1JXKxhnbJWoMsVx1kwdoL4/UZl+tIJy1sib4wV2GCt4AbB0Rs5J1TIz06YJhKb6noAyXDBsrAKNpwAu4lcF34PDiLF1DUM+d/Zw7sxdoQHB7w97aTXcPfOVm6pOs5xbapZ0HRo/40kVAnqWBheL6n3ctD3+soOZtcRWyRAw3y9Q0d3LvN47FPwZ842NeB/S9Tqr5dCqbMdA5KmPZhPhrKBeekAzWLD/s2u/AN58gBNsa+volsTxnAagaKfMyJrjbN8bch5xVXxL2cs6zdazLQMW66zEPRWsIUdxhYfK9qMxkDQ0r7qqOgk+Jdpd5bZdCfb3GeVZVdioAXWimOQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c74fa4-5414-4323-ef99-08db65ada1a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 10:14:22.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W19TNvHb9/KQFvvVlGiyCVCGC9JhXaPXYDfyCeUniiw6oPElnKvvNl/iTbhBTVogqr9LErLcP/203EpvNf2Zlfx5rvVtPtgYxMar5/x6QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6968

On 05/06/2023 11:10 am, Jan Beulich wrote:
> On 05.06.2023 12:05, Andrew Cooper wrote:
>> Insecure the word being looked for here.  Especially given the nature of the
> Nit: Missing "is"?

Oops yes.

>
>> sole caller, and the (correct) comment next to it.
>>
>> I've left the taint constant as 'U' as it's a rather more user-visible.
>>
>> Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks, although I've got one extra hunk to add having just done the
other half of the taint work.

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 14ce6b40ce06..ff67f00e41bb 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -344,7 +344,7 @@ unsigned int tainted;
  *  'E' - An error (e.g. a machine check exceptions) has been injected.
  *  'H' - HVM forced emulation prefix is permitted.
  *  'M' - Machine had a machine check experience.
- *  'U' - Platform is unsecure (usually due to an errata on the platform).
+ *  'U' - Platform is insecure (usually due to an errata on the platform).
  *  'S' - Out of spec CPU (One core has a feature incompatible with
others).
  *
  *      The string is overwritten by the next call to print_taint().

>> I'm happy to change 'U' to 'I' if we think that no-one is going to be impacted
>> by it.  I just wasn't sure.
> I agree with what you have done, i.e. leaving it as is.

Yeah, I assumed that was going to be the preferred route.

~Andrew

