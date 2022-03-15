Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D24D9D38
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290823.493362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80T-0002Hb-H4; Tue, 15 Mar 2022 14:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290823.493362; Tue, 15 Mar 2022 14:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80T-0002ES-DU; Tue, 15 Mar 2022 14:18:37 +0000
Received: by outflank-mailman (input) for mailman id 290823;
 Tue, 15 Mar 2022 14:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU80R-0001tV-AD
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:18:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cab58265-a46a-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 15:18:33 +0100 (CET)
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
X-Inumbo-ID: cab58265-a46a-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647353913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VQdgUnCUfYFDHd3pkVOFKBaIkP7wrJBtsUs922WQFKA=;
  b=PELV7RZPIyQCYY+BJr0gVPQGUDCWg2XiMhrVssOpA9ERqUnPznsZwyAh
   MpvHr6Hobdc39fEuXROB8vgd/rGEAjRWevTxmSxVeCWg1fPgm+Jk+S5cb
   A68lSzY8sArvJ59nbdHXyTnCtJSNQ7jRRuDYM90G06uvG2Zac+RemmTsQ
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66284748
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Uxi1jaq6DaR0DJdP2XMXPYO5dcBeBmIPZRIvgKrLsJaIsI4StFCzt
 garIBmOOquPZ2ahfd4kPduz9hkO78TTydAyTgpo/HwxQSsX95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 I6q+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBHLWVmsMhWQthOH98FqxJ6r3sfT+lmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZRDOWYwMESojxtnZkcqN7YUoc2Shlr+YzBjjFy4j5hr7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUY8FiP7Zbe8T+yWGovTzFTavd689UfEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swJD2AAcmV83lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bZxVI2azM
 BaJ42u9AaO/2lPxNMebhKrrV6wXIVXIT4y5Bpg4kPITCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqN9Ndw9WdSZnbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3RApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:8dgbNq52eMBdMSlSLwPXwXyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJE3Jmbi7Sc29qADnhOFICOgqTPuftWzd2VdAQ7sSlbcKrweQeREWs9QtqJ
 uIEJIOR+EYb2IK9voSiTPQe71Lrbn3k5xAx92utUuFJjsaDJ2Imj0JczpzZXcGIjWua6BJca
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Ln1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoDOCXMsLlUFtzfsHfrWG1TYczGgNnzmpDq1L8eqq
 iOn/7nBbU115qeRBDynfKn4Xif7N9n0Q6S9bbfuwq7nSQ8LwhKUPaoQuliA0PkAgMbzaFB+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jdiuKYlGfZsRLYkjQto+VY7bVbHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7T1E5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZes6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z54HSKyGG7fIyQZ0We9igF3ekLhlTVfsufDRG+
X-IronPort-AV: E=Sophos;i="5.90,183,1643691600"; 
   d="scan'208";a="66284748"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpVTgfNYFoFWCNMi63RuJLAmsrt98MyVZRLAKe5WIbuYY0bTBKhUsPaeStjfnemyVeCbZnZKmBHbvref11LHmrmiAwhp9ib1mYw4zKL+8MB2b325gJhC4IuPzyFe0mmi8Rpdqe2Ed5ymjF0bXZKeS3qL6b9jWyY4U00ARUXa/Dr+rpq3H09Qf8Nqoy2wkJp6rpQRJtkRXax0LEQGUYePWbj5txTNkzvptdY5HD7fN0ZjwxaghVxu1pTe8QKDBtY8zTTlYTvnRMUnvLyzlb1UXERD3/kB+L5/lGoFOwo+IhiLfvjJGqbX+9ChgLhdZqOVQO5k6eM63PeJDJSfoPcDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCY9jrv6ZyMmWIRCjtWORu39xudmg3JPkZR3mtNiFVY=;
 b=Tyib4wNdrqFe2ITTiikBG/KRCjXh1gffLgGQkzULf3oQT2MqqBO+9qy7GLG7RxKabdEz4R7b/7SWoGF5N1AugN1CoJJ4S4/ZNc7riz/N77+ybPY0I3WLeXv4d8ces/8jdfFDAjTFZWb4OqgKlGeZBzHsy3cVEXbT8bD0GrkBIcQSf/82DFgAtL16OXFSVOdqyy36fnY/Dbb2NyVvlBsIqZrrj1QkOmaliv+kfJEybnTK/TMAw75WqB1+7g4VQUqMDa0cqNgrxSZmfWjjZiyBDXe1i8njXhp4MKRw4EQfEFPonu38Akvcwh3iOtui/G6+BD1oPeWFG6+ipJzitAW4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCY9jrv6ZyMmWIRCjtWORu39xudmg3JPkZR3mtNiFVY=;
 b=cG9WPBV5NaE3Qmv+j1FVz6XGk2VmJIMNleOWEmknZhyWfNzQ58b8XiV5ZMAGhOa+FFlvh6JYiKA+/VqxJWAlVpcZncynYYS0udCWR0/ynDDFPigvGAWCqSIVP3+lpZcO9xlhxwRTevYUoY+LoRENJ2BLcflO7m3UIo7LVOo6dWE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
Date: Tue, 15 Mar 2022 15:18:06 +0100
Message-ID: <20220315141807.22770-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315141807.22770-1-roger.pau@citrix.com>
References: <20220315141807.22770-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23229218-56cd-4b62-12bf-08da068eac70
X-MS-TrafficTypeDiagnostic: CY4PR03MB2902:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB29022F5BDB8CC3F5841D39898F109@CY4PR03MB2902.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6piQCZOuT7KF19pABovwyKUtlBzZBOdVkRAc+sQgmlbiIGw1z8gJ5Hi7dv0aIXKB0gOaKaRTLbnDE3Fs9sfItULkYVafU7uMMw7JpT49f/pe5n0/hrRLT6m2Kd4EoblmFxRdU0vXD7PkjpWYT5JhNPqfc9+FZk9mMK6qShvMTodqWBRnrRhEPyLFdmSERSi46Iq/KaYQ4CvkMIysIGbkN7xYcUxFReH3PsJBjZRTdHgyVmkZ8dcCmLIdRHi7XaLuGeMFAG9JVRPPyH5YgkFwYdiJeCyKcgOgQJtdse5aZtWwHippBLq+Q3HsJwmKPaRFYG7+pwlord13Vk75T3ve2VSndw4UZDwZ3NYVyySamd4sR4jBlaTAEP5Ss6t3zmTXSnQT94kunuy2jbP0amVgnNE+rP9K0/WE/q5anaTW99ImEsYxgeRvqVk3oj7a+h4tskX6nBtm/VS/n9OUkuQjQpjNYtmrmQRs3onu1w7HHYGvi9b7f3dRyhBs7CMK9+iJRMTx8L34hKuCX9WjvxqFsr4Z8Ns8Ce2ponLQYsp7Sw6A6FhS7cV/2ckejEtbIdasg7gHwiOQiUKWyhMH4bW+rAAznX8Al00hDPVeqXcPcOaUBLLrUwa7mJ1vh5/kainTing4Cr/WurrRduZp+VrLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(6506007)(38100700002)(8936002)(6486002)(6916009)(8676002)(36756003)(508600001)(82960400001)(186003)(26005)(1076003)(83380400001)(66556008)(66476007)(66946007)(86362001)(6666004)(2906002)(316002)(2616005)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjNGbXY4UnRmTWQ1N3BCazdRcW1FZVRxS2JJeUxBaElSNS9raEQ5UVY3aStJ?=
 =?utf-8?B?YUs1Tk9tWkpxaFBTNjJPamc3Y1lzV3NXOFZVcEZsaWVlZ2VCVDNPUENQNHV6?=
 =?utf-8?B?bzJKVmt1UWZrOGZZYXhTTkt5WUd0bjlOM2tWeStGbkxNTERlQjFtdGx2bXNI?=
 =?utf-8?B?TzZLYlVNU1hKVEltVDJJSHJJMG5ESzYrOVpCdkgwNFpGamk4Zm5XODJNc2M5?=
 =?utf-8?B?VjBTNXBHMlJwR2tNeHJNL1MvMkYyeHhVN0swNE5tbWZsb3NuV2dNeTlpRDVD?=
 =?utf-8?B?VUkvT2RIMzgzUnl0aWdiTTEzQkR1S0c5YlBVTzJvb1dGMWZmN0hMN3pDT0Ev?=
 =?utf-8?B?RStZUG5uZDJhTUY2anJJM2pPcER0VXFPbS9uT20wQ0FQenBmNGM1UmZ6YlF5?=
 =?utf-8?B?N1ByZzE5ODBodlg0eTZSWEFkZCtZWDVpTmtnUGJHYlRrcWVZMUV6NTE5dTli?=
 =?utf-8?B?b3lISGJxb0x1NkJEajVmZmk2K1dXWTlFamJjaHhGSGRSbW1aWXQ3d0ZmeFJ5?=
 =?utf-8?B?VXA1US84b1ZNZkZjQ1RRdzdCbUlSSit5MmpPUXFmcDh3OTE2VVBRMG8wRlhy?=
 =?utf-8?B?anNlQkJkcmJ4d0piM25vaDlEZHp3T1pnZHFEU1ZUZTVPT1g5eHg5OWo2b3Z6?=
 =?utf-8?B?Y09rSEx5cFg0OUdNQzNoa2N3TkdQcnJXTk42RXVVWHBRUHY0cytzK1ZhcmY5?=
 =?utf-8?B?aTFpdjA2UkdLTjBxS2pvT1lMa1hqZXVHNUhDQ3JKekgwbVQ4dDZXYlBueHlu?=
 =?utf-8?B?SVc5bDhCOTJYUWNqc2xUSS9Pd0xhaXd1TDh6TUhXdjJDVE00SlcwaDRydzQ1?=
 =?utf-8?B?ZE9rdjAyK3F6VG9UT015YUFYTDlzUWRTZ0dSbEdOTis5MFdWbk1NK2pXMy9M?=
 =?utf-8?B?Y0l5ejdPRXRBS2Y2ZzNOK2JORSsxNUJDWnorSmVBNWxnQWNUWTd2cXJvMG5B?=
 =?utf-8?B?eHJxRUNWNjZ2QUpCYVAyUG0wMW04b0Frbk1pT1RDdVlKUG1NMitXUEZHWW9J?=
 =?utf-8?B?ai94eHZZeUhFc2g2b2U2aXdpUmxvbGdHL1k5OHd0VjhEaHgyVG5DakxxNVFp?=
 =?utf-8?B?b1hvMlF6T3ZXK0ZhdzY5U1J0TG4rSUJuNXE1S3VsY244bXFYTzkxc1JzNzRS?=
 =?utf-8?B?Sk4yODg3VHdRenZGZDJROU02M0JIVlExV1E1cTVpQ0NqZ3FZZnMyVFFEZUlY?=
 =?utf-8?B?cHV6WENBZlNtQTBDRnc2cCtIRnk2dTRZbFhCN3VicVcxUHJQaG42RkdRdk1I?=
 =?utf-8?B?VTNPK1RFVGpkTGdFRXZVU3ZaYTNHQmpicS84dldSR0o4N1A2SWw3clB3NGVJ?=
 =?utf-8?B?c2RxZ0RUWWYwYnYvTnJXMUJMTVUyNGZuV3V0ZG5KZ21lYjRlS1J1TXlKdlAx?=
 =?utf-8?B?Z2ZTSE01V3N2ZS9DdkttcmdXcjBrK3YrZzZjTVpWb2ZEVm5tUzV0S0hBeUJ0?=
 =?utf-8?B?K1VFUGRxQVFjd1lsMVFMbWgvLy8xQVdwWjdTRU5DTkxpWWloU2pvZjAvOXFT?=
 =?utf-8?B?Y0tjaU1qYkU3NlFLeFo0aWc2SWlmaER2OWx0MEpZeVhJNTdXREV6ejArTHdG?=
 =?utf-8?B?TGJLVzduWVpkTFltQ3U0WjRMWU5DdU1iN3ZtQkpBNWdiSE9EU0xOSWxIT0RQ?=
 =?utf-8?B?eVg4WUVYVGZFd3R0djh2a2RGVm5QemNRb0l2YnBzSzFaMkZiUnNMNGhERnI1?=
 =?utf-8?B?c2hwcExJeVY1R1ZJS3ArRjdDMFNTdFlscExCVS9LdnVmT1VFaGlOOCtLbmtL?=
 =?utf-8?B?TXVMSXhtbVB5bWdNTlhNaHZpclh3M3pWVE9wOUtNVVdjMEhJTmVGYTI3TlRK?=
 =?utf-8?B?bGFpMUhuemkxbGZ6MXhBQ3dvWWx3NHRKQ1dyUXY4MDNFSzlOTnY4NTZZOFBv?=
 =?utf-8?B?ZzlvU0tXZFBzb0x4Q01icmphKzNTbHZnTGI3ZjN4WlIyUkkxWHd2alFuamUw?=
 =?utf-8?B?VUw1d1cwalA2cGlTTjI4NkpjbU50c25mMW5Xc0hhT1B2T1oyT1lnbklTTnB5?=
 =?utf-8?B?Q0U5Vmk1RmRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23229218-56cd-4b62-12bf-08da068eac70
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:18:27.6131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAQKJjFNmLb1kwLVt+EawgWDoGwWmOugLy21dUr5/jDl9rHP9VrW9rsuj8yl2nYvJIUKGvabPBuvVP2OPzG1dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2902
X-OriginatorOrg: citrix.com

Allow HVM guests untrapped access to MSR_VIRT_SPEC_CTRL if the
hardware has support for it. This requires adding logic in the
vm{entry,exit} paths for SVM in order to context switch between the
hypervisor value and the guest one. The added handlers for context
switch will also be used for the legacy SSBD support.

Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
to signal whether VIRT_SPEC_CTRL needs to be handled on guest
vm{entry,exit}.

Note the change in the handling of VIRT_SSBD in the featureset
description. The change from 's' to 'S' is due to the fact that now if
VIRT_SSBD is exposed by the hardware it can be passed through to HVM
guests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce virt_spec_ctrl vCPU field.
 - Context switch VIRT_SPEC_CTRL on vmentry/vmexit separately from
   SPEC_CTRL.
---
 xen/arch/x86/cpuid.c                        | 11 ++++++
 xen/arch/x86/hvm/svm/entry.S                |  6 ++++
 xen/arch/x86/hvm/svm/svm.c                  | 39 +++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeatures.h      |  1 +
 xen/arch/x86/include/asm/msr.h              | 10 ++++++
 xen/arch/x86/spec_ctrl.c                    |  9 ++++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 7 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 4ca77ea870..91e53284fc 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -534,6 +534,10 @@ static void __init calculate_hvm_max_policy(void)
          raw_cpuid_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
+    if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
+        __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
      * availability, or admin choice), hide the feature.
@@ -590,6 +594,13 @@ static void __init calculate_hvm_def_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
+    /*
+     * AMD_SSBD if preferred over VIRT_SSBD, so don't expose the later by
+     * default if the former is available.
+     */
+    if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 4ae55a2ef6..e2c104bb1e 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -57,6 +57,9 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -114,6 +117,9 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         stgi
 GLOBAL(svm_stgi_label)
         mov  %rsp,%rdi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 64a45045da..73a0af599b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -52,6 +52,7 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/spec_ctrl.h>
 #include <asm/x86_emulate.h>
 #include <public/sched.h>
 #include <asm/hvm/vpt.h>
@@ -610,6 +611,14 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     svm_intercept_msr(v, MSR_SPEC_CTRL,
                       cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
 
+    /*
+     * Give access to MSR_VIRT_SPEC_CTRL if the guest has been told about it
+     * and the hardware implements it.
+     */
+    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
+                      cp->extd.virt_ssbd && cpu_has_virt_ssbd ?
+                      MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
@@ -3105,6 +3114,36 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( cpu_has_virt_ssbd )
+    {
+        unsigned int lo, hi;
+
+        /*
+         * Need to read from the hardware because VIRT_SPEC_CTRL is not context
+         * switched by the hardware, and we allow the guest untrapped access to
+         * the register.
+         */
+        rdmsr(MSR_VIRT_SPEC_CTRL, lo, hi);
+        if ( val != lo )
+            wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        current->arch.msrs->virt_spec_ctrl.raw = lo;
+    }
+}
+
+/* Called with GIF=0. */
+void vmentry_virt_spec_ctrl(void)
+{
+    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
+
+    if ( val != (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 7413febd7a..2240547b64 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -40,6 +40,7 @@ XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
+XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(28)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ab6fbb5051..460aabe84f 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -375,6 +375,16 @@ struct vcpu_msrs
      */
     uint32_t tsc_aux;
 
+    /*
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
+     *
+     * AMD only. Guest selected value, saved and restored on guest VM
+     * entry/exit.
+     */
+    struct {
+        uint32_t raw;
+    } virt_spec_ctrl;
+
     /*
      * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
      *
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f338bfe292..0d5ec877d1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -406,9 +406,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
+           (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
+                                                       : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
@@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
+    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index b797c6bea1..0639b9faf2 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!S MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.34.1


