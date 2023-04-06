Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18B6D9A5E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 16:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518911.805921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkQdu-0002eB-UY; Thu, 06 Apr 2023 14:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518911.805921; Thu, 06 Apr 2023 14:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkQdu-0002b3-RI; Thu, 06 Apr 2023 14:31:14 +0000
Received: by outflank-mailman (input) for mailman id 518911;
 Thu, 06 Apr 2023 14:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkQdt-0002ax-Tl
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 14:31:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9381bbf-d487-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 16:31:06 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 10:31:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6098.namprd03.prod.outlook.com (2603:10b6:610:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 14:31:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 14:31:01 +0000
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
X-Inumbo-ID: a9381bbf-d487-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680791466;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ogUa40awd4m5Ri/1ZLuwSC2FpKaHSx3ZJ1giQPYxjhs=;
  b=QqGDjkqo71QIM42GzUfB9MODpPxsSutjxb0luFM8gdDs64jYNp2RsXk3
   NzM5PcN3Ip0dcnVUKZ4u4CL9WBbbEQhQw8wiIiICbFI8AkO1HKpZpwdU5
   +maFT/BARSJT+HG4gppDxLdnu8WrKNeodMPqewVK4E7eUS3OoaU2x1Fvy
   k=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 104604306
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Vo+/aq7/EO37lRdSyBXNUwxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 mIaWWuBO/jeM2fzKIh+Od+zpkJV6peHn95iTVBkrnw0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawT4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 eM4JmgCUhu6jcXr35GkTvRxufkDM5y+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOOF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKSOPgqqUy3jV/wEQvCxYPbHq1psOX1BO8fckAJ
 E4f/wYX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mpZ5piBvKF45nCPTs1oazHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxaoowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:evAMiaClFaAQe2zlHelc55DYdb4zR+YMi2TDt3oddfU1SL39qy
 nKpp4mPHDP5wr5NEtPpTniAtjkfZq/z+8X3WB5B97LMDUO3lHIEGgL1+DfKlbbak/DH4BmtZ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104604306"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUI/wd0uTYaYDhzqC4rWnh5Zm2HCNWOzTXZhYNM9ZfPYqhdYv9YhH2nS0YvJbL6kqxSuzgU1+NbqhqlOKvr7tjsRUwlafo53RClSqeAZUMaYmWM2PohthRsVEqE/8JTmK5LqUX+S9/Po6k/1IqBxP4wdaEfGtTsiXRJIa1vkCwgCzAhQmp2nXJp2D0ib8v1XvYTHp7lWbv20zqKVYsP2NQwxWTYan0ioAWQc0Xp4A6Mgcfwv3LMRkYdZTH1MMvcDuNNhcgn8nYXxq8hbY+NMSf7DvQiT85xNxeetphh9vgO/GMJy+ha7EuekfzoMuN1RzPsXuwIFk3GmAPWhDlUCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbKvxOKsESnEm+UoB7N2Ts/1VLqyZuSkZzZthBYVx30=;
 b=ddqTz98C+ZtTqdRpjVfm0PQbhwmlBxBiDjZkb2DZwuuX3khzrmt5bXkF3ngKKebfujMZWMnRaEhhBJrTTWh3W/tGaGgKyqird4BIdfNM2n0THmEiAb2SekNz20xmAsiMt5+gsPOkGGBBtQm3zJxKlj4N45W52JJOgycMSRdfOh9OSDgt3JcJTsQrLNeAp8nO/Rm1J3Eo0rkfZESYOj9JXEBEcnAxSoXnkXVTy5ahoctS6XAjbDAMmFmTsKlYziFljf0Vi1Rqm/Uio7YS1LuDezn9TGtQaTRXcnzbgGUCDqQklTk+MMM8KRIshW1fT3wTrDIr0vQCALbTBejdhOit4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbKvxOKsESnEm+UoB7N2Ts/1VLqyZuSkZzZthBYVx30=;
 b=nQOYLUrgEEm94YjOfO/6jGvC8Ju/Buj3aDHG8bBCjEB2u++RrFjNHR7WmJw33smpbkJ7TXIiuGx7fvxerss/b9mC/umOkDQ387kc0TzapGrROMv+KvDaMyz70DRkY6dCH8wMk5X3JAG387VsqMKmPpfqxpdf8ZScWMdJMvprrsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cbaac839-f884-2aee-473f-2f68a68ccaaa@citrix.com>
Date: Thu, 6 Apr 2023 15:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for Exceptions/NPT
 intercepts
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230406132708.2251000-1-andrew.cooper3@citrix.com>
 <9edbf4a4-978e-e1bb-43b7-971bdab8f41c@suse.com>
In-Reply-To: <9edbf4a4-978e-e1bb-43b7-971bdab8f41c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6bbdcb-f2be-4f3d-324e-08db36ab8b26
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bn2Z+P0229x8a4hu/dXHb53WjAZ/3UdYNLbNOP3e/pj8q2VkbYlT0126pZuIOT60ssNJ/YJVjKQkYAX+q7VVZ88TgmHzTl4QleY2ZqBDmBlKleZrc8fhpx6jHy/ACD2WWEsACFkuhd3Mu+2/84MlLoEW2ivjLeF6G6GhWCsjte+ZAApwWIUxBMe7vImQRQwkPdeXuUAKeXvAZpmujlazutsQcq9GK+d0s6w8Ea2XoYloCrGrowmDR1tafTmRyxjRBNU72sV9LZpAydNUdGQ+sbPoPYpAlbCp0Q4pa3OroZfKYUF52vDLcsn7C14JZqRCAOKyYJcthvOlWYBFq5y5FNqQ4uL7ngUSr4Y02iLa/Gul/ePC/+U+mK76+mUIF7/L5AIZfkjf2mnVs5BgafX28fU+CG/rp73Lw4/2TBb7zHkJ3YKjztSeV/4g09vT3GljvOHP+lWYjPUi8hd5/5r/4N+ZlkFKOhWa/d1RCuWk5ZaSUkfyMKjxeyUSPLDdLfxYlAHs4X3TxNRd4Q197U2HKVbGP8UbQjgT/lPDw/IDd9q2SalXFD8P+iBvzt06ufLAy2EKL1uYrFrI0NeU0DEPPzNKZTiPj6tLv+ZF0uhI/n1j999oY6ArSpz2Rx6uK7BcJLDA6WEtlU7RZGpfAU2DFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(478600001)(31686004)(6506007)(53546011)(26005)(6512007)(6486002)(2616005)(186003)(6666004)(5660300002)(66476007)(38100700002)(41300700001)(54906003)(2906002)(8936002)(82960400001)(6916009)(66556008)(8676002)(4326008)(31696002)(66946007)(86362001)(36756003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXJvaTg1V2s4N1BuWUZES29GNkN4U3lUUUdoSHBqN0lBZ3EydHFaNThUY2lt?=
 =?utf-8?B?MjJiQk5LaHMySE80cVhjdXR5emFLV2FXTWVLd0JGQnc2QUZ1bU8zLzFmREFK?=
 =?utf-8?B?dEZ1dU9PQitEVXZVMXV1b0VmRWtlUUpVTzRLeFREMzBhS2FRczlMSHVBamtN?=
 =?utf-8?B?dm5sMkhDTDFNTW5reXY0dllTMXFNS0dROE01c080WFlaY2NQbW5PQitubmpz?=
 =?utf-8?B?TGNuWFZoRWlPQUdNVFovL3NMOU4wRmswbzRhK0gvRHpUKzdHYU1BN251WkZ1?=
 =?utf-8?B?eEwyWHBwWnRQRGcvOHJWWnhmaXVuSGhlTmM2czE4WEdzcHhjVGlWT05GU0pK?=
 =?utf-8?B?T1UyMkRWMU1RQlRmT3M1NEdBVFhGSmNZdFZxR0xhOFNQVmw3bnVaUWptak14?=
 =?utf-8?B?UmNwZmE3R0VoSTRzaEh0dTNjemxKSlFGSmxvdmZHREtEcFBrYzJUZldLdllp?=
 =?utf-8?B?V2JwbDJZNWFsc3RjY3hnN2xYYjJWK1NoUEluUWYwdmtnWmhXQnJBVkZvc3Vt?=
 =?utf-8?B?aUdrZzJwY29hS05sWVNiQmN6NlFLUzVjVzVFaVRrQmpyRm9ON2JxOE5vREZZ?=
 =?utf-8?B?RDRvQzZlS3hMdnJoRXNPUUVHKzVqRlUxZFhtNy9nK2V4MWJPUHl3cXBEd2g4?=
 =?utf-8?B?N25KdnhXbHBSTU9uK2pPeVEwc21UREZZbkxKRG1HbUEyZjNBcTFOdlA2a2ZE?=
 =?utf-8?B?YmV4ZjBZemd3SFNtazRWTGRFVS80YWR2WFFwODJ5TkE3VmE0VWpMam8rV2VI?=
 =?utf-8?B?d1pmbU1XbC9tMUdFUkFTN3RVUkR3b0pqQ3BuM2I3RC8yd3QydERqTHh2aTlV?=
 =?utf-8?B?Z0pPcWhheHJWMjNtTWM2RTlKbGVZTytqMExVN1NpcFlYZFFQc3gwM3Fib0pN?=
 =?utf-8?B?b3pxRDhLajNDbWp2Skp5MjNrOU9VKzBYSHE5VUdIQXBkS21BaG9qdDhtWDZo?=
 =?utf-8?B?YzgzbjJaRmJaSHJrWWJmRXhqeTUxcjREWkV3L3IyWGF4d2FxUmw0aVRVWSs1?=
 =?utf-8?B?OEE4S2Y0OWZLT3ltN09qNU81c2hUZk9hTWx0NHdESU12QWxSTFBhaDhGVFZL?=
 =?utf-8?B?MkhzYjVXby9VTmVIRVYyakF3N3E2ZDR2UXMxeEZvaVhMVlYzUWJVTnZTcUJm?=
 =?utf-8?B?dlc4UC9Qa3hQNWdDanpqdTRGcCt2a3NVSXBZVnpQMlhoVUQ0UENLbHdtVFFO?=
 =?utf-8?B?SUc5M2plVnZxbVpGZW0zSFphdXpoRlMzRXBmNW9WamVkekFNZ2tWOE5vNDZN?=
 =?utf-8?B?NjZwYnpPbEhKMXRGa09mVVFDb2kwK3lLbDF0cnV1VHJubkR2VllwejdOVytt?=
 =?utf-8?B?L0cvejdvdjN4NWFsNmtLbGJ6bmhWdldkZTB6M00zajNOOTVtMi9OaUxIdVd3?=
 =?utf-8?B?d2JsR01sd3d1N29Ocjg2SnpJUi90N3N2QjQvd2dGTVlaYnlUSGdMNmZKcmJj?=
 =?utf-8?B?OVNmZVNLNi9mVWNEQWVvMDhiNnNKOTViend0M0ErT1cvSWRqeEovTzB3aGc1?=
 =?utf-8?B?Z2MwZENoWXRCNkdPYVN6VkEzWEl4SVd6cTZaWnBDdUZYTllDVS9BZnJTeS8y?=
 =?utf-8?B?aVFOVlp6bkVQb3ZlRmxQQWoxOHN2WlMzKzQ1WjhTU2RDdG04Y3J1YUQ3MVVG?=
 =?utf-8?B?bC9rRms5TnpOYytMM3hBNnU5OUtoajZmVStMMGxOeit4Yk9RZXI2QVZtbzRD?=
 =?utf-8?B?ekV3N0liWld4MnpOU1F1eURld1NpWXFZQmEvV2JDSFhyZG15M29XZ1lGblRI?=
 =?utf-8?B?MGFCMnJQd3EzcUo3bXNFaERtYWw5MkdPNUVzMkkwMjNDYURoZmoxWlpCdTVa?=
 =?utf-8?B?NHFPbkFHVVd4UUR3S3NhQlVOcllhOWJhNnk0TzUxMW95S0NHUEdjUDJoRDZD?=
 =?utf-8?B?ZUh4UkNhNGxaNXVBRGhNSklWZXUxcXJRc2hiMHROeFF3Q1gzaFQ5R1ZaU2Y2?=
 =?utf-8?B?OFMyS01QV2JuRHdUS0swTytpaGlBeElNN3VvdHJjazJtdFFxRVRkSlgyUlBO?=
 =?utf-8?B?UGI5cUdyYnR6eGkxL1FaZnlCNERQTHNxMHpuRm0xR0Z1Q1oyVWVDNzlmU1Nw?=
 =?utf-8?B?Vkx4ZkpPdXBCaE50b2ZGKy8vMktqS2lKZXp0ZzBTRG5aVzJKdG5ZTW1QWHVj?=
 =?utf-8?B?M0h3c21zRzgyU3RZdGZNS2g3S1M2enRvNU1nbkUwY1dCZGVtTm4rTERaL1lM?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cDDOEHv//Dru/2jUqwkFqBwSe41OytLYViqjnOSDqFjjP8HpkS09ptpdeQP+jgFUePxXtBuyJ/cY4zioBOflSEFCsPbnOM/mGGubHw6x+1UPAz5LS1b2keZ+4VVCv8+B0UN0juORgE+MIuctrrPPpE5SuuF7TN8jJk7JwdNGnJovX5W5GWy5wSaPazECQKDhTAOs9hed92eLHaKzrzOEPQJP/CC0SxGJ8wjnsSU9zQPz6LCegAVBJfuXwJvlDGq09bY9juFpJL6xAYLt0Z9KZ+U8QpaUTMwslLa5ZSu0tk54+Quntj4aYHjheAqRJbJe0lU3/Vp69lKMNP0l1SCq4NGwc88osHqMQkvbNmMkVOrDEZ+F2Ab3U3LyOTXgZAwgGugaCUGcv79SPu9BqXaLP+uvnc6JzHfFSHZIFYvyVP6vJcHWU+kiue7Mjo2JER/33Uqn7EMBFw1yTD999h6X/RSvTioor3a5AYI27bkEHs+ssFIUGRRTCw8M/E30J9MjCcr1crKLibbmobZ+uygo2vgTyS1hIRiU5mnUfWzMz01xGJIXW2FEsivLCMv5r7K01PNpVuIfUlQDPyDMENsKZwXPXYdcKrd6Uu3ut2+MTdNyfJp9+gsJQjR4AhaAYVturaqo3nYGM1neetVVblXRwT/DLhcmnebf/xcKochPFp5jF8FCTBIXpubjyPiR9iOiQde32wzgi+JcdzWf6n8dlo256ghSYKqO/QYZZEjJa4fhJuQNbQkOP63bYqQ506OjKtOc9ILGt/2XWpS2fRe45nehlNNrGVH5HpqzOXhDH/weMriZsnA1jgsrmWjCjmC1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6bbdcb-f2be-4f3d-324e-08db36ab8b26
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 14:31:01.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThLXgCfdekdOAR1A9BHd/npWORY43QrLvPtkQmim0EON22jQmuv30Qhn0kdQMKMScRgg4umC/SocPzWFPKMtRpPxcLML7qKYOHgk5SXdEk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6098

On 06/04/2023 3:28 pm, Jan Beulich wrote:
> On 06.04.2023 15:27, Andrew Cooper wrote:
>> Exceptions and NPT intercepts almost have the same layout, but NPT has bits
>> above 31 in the error code, and the name for exitinfo2 really does want
>> distinguishing between cr2 and gpa.
>>
>> In nsvm_vcpu_vmexit_inject() rearrange VMEXIT_NPF to fall through instead of
>> repeating the exitinfo1 write.  Use the fallthrough pseudo keyword instead of
>> a comment.
>>
>> In VMEXIT_NPF, as we're editing the printk() anyway, switch to using the newer
>> domain_crash() form.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> with one remark / suggestion:
>
>> @@ -455,6 +461,10 @@ struct vmcb_struct {
>>                  uint64_t :59;
>>                  bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
>>              } mov_cr;
>> +            struct {
>> +                uint64_t ec;
>> +                uint64_t gpa;
>> +            } npt;
> Maybe better "npf" than "npt", as it's describing the exit/fault?

Oh yes, of course.  That is what I'd intended to put here.

Thanks.

~Andrew

