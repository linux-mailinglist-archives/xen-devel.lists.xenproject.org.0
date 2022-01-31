Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974A4A4442
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263024.455564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUu2-00055z-1G; Mon, 31 Jan 2022 11:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263024.455564; Mon, 31 Jan 2022 11:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUu1-00053v-UP; Mon, 31 Jan 2022 11:31:21 +0000
Received: by outflank-mailman (input) for mailman id 263024;
 Mon, 31 Jan 2022 11:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEUu0-0004yF-RT
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:31:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e7fa6b2-8289-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:31:19 +0100 (CET)
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
X-Inumbo-ID: 4e7fa6b2-8289-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643628680;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GoTQcpsGRsKiFXEU1Yecf1fuzgyF+4aP9EZIV+15LO0=;
  b=KYDr9z7pm7w9Vic2tWBBkDvI8jqpwHn64OW83xbLanp85ExfJv8yILCe
   okO/83Beqt1+TNrMzktY8Vr663zgTYFFzQjM8c28M5kghjXr0uZM2Yq0U
   GrB28NNV9C5HrZAHHjgt0LpAARN4b1LI3/73cQpuxHg5bvZQ5ZgtEp/sM
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kK98v7jlpyV1F3jYwiv55V/y7JgORlaxh2fpKF5Szz9RJ9FoA0Gip9leTB5Jj9DC5jYvMNgaiF
 +SHNkyHNNWgFxVzLqjdGu/WCHfpzxvbwBpeBUrL+7nq1yNRUKLePD/xsFxh2nwtCSgEpHK3vMR
 4EKYRh3SJ0MwPV4JnKmD6IgvrqtlMWjuaPttX47c5m7WhevibjCGT2l9YIFtyPPLamHQ9p7iiW
 RwlUlELAL4S65TiZznu5VVsrgQcYPiQuQNSTLORl194+PpJCQQo6gJjIocjudf9cf0oDl73zXf
 4WPIqws/CfyHjBTWrETLEsIk
X-SBRS: 5.2
X-MesageID: 65297643
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Li1zEqMsQ32wH+XvrR2RkcFynXyQoLVcMsEvi/4bfWQNrUolg2NUy
 mAcWTvSM/qLZWb1KowlPou290hX6MXWx4A1Gwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Ek6w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyutlv5Ww
 v9RjLafSVcrD4fHodoGAyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uXv44Hgmtr7ixINdHfS
 JI+WytdVwjJchRzEQg7Np19k/j90xETdBUH8QnI9MLb+VP7zgZ8zbzsO9r9YcGRSINemUPwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcJobCbmQ5vNsxlqJyQQ7EhQWSF/9uvi/hU6WUshab
 UcT/0IGp6Uo6FaiSNW7WhSiuWOFpTYVQd8WGOo/gCmzza7T7xecF3IzZDdLY9w7t+c7XTUvk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkUih/MVd9lHLSCp9v5Ayzrw
 zuKoS49gJ0elccOka68+DjvgS+op5XPZh444EPQRG3NxiR9aY2+boqk82/n/O1AJ4aUSFqGl
 HUcks3Y5+cLZbmWjzCESugJGLCv5t6GPSfajFopGIMunwlB4Fb6I9oWumsnYh40bIBUIlcFf
 XM/pytPwJZ9G3GAcZZdTILhCfUAxpHeDoTcA6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7GMijpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLxBQ1QRZTYLcqvwyCySgJlClA8cI3GI6SJqY7Ng6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8h8SlmbXN0bQj5hylLjWOTAEE3LcFfkV4Pr7QL8BKJZ
 6NdJ5Xo7gpnF1wrBAjxnbGi9dc/JXxHdCqFPja/YShXQnKTb1ehxzMQRSO2rHNmJnPu7aMW+
 uT8viuGH8Zrb1k8Xa7+NaL+p3vs7CN1sL8jACP1zix7JR+EHH5CcXKh15fa4qgkdH3++9dt/
 1/IWU9G/bWc/N5dHRugrfnskrpF2tBWRyJyN2La8ay3JW/d+G+iypVHS+GGYXbWU2acxUloT
 b89IyjUPKJVkVBUnZB7Fro3n6sy68G2/+1Rzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw55PO6N4u4Zx2vJ5vMvLUSkuCIupOibUV9fNgWngTBGKOcnK5ssx
 Oos4ZZE6wG2hhcwHMyBiyRYqzaFInAaCv11vZAGGo77zAEszwgaM5DbDyb35rCJaslNbRZ2c
 mPF2vKaiu0FlETYcnc1GXzc5sZnhMwD6EJQ0VsPB1WVgd6Z1PU56wJcrGYsRQNPwxQZj+8qY
 jp3N1d4LLml9itzgJQRRHilHgxMCUHL+kH1zFdVxmTVQ1PxCz7IJWw5f+2M4FoY4yRXeT0Cp
 OOUz2PsUDDLesDt33RtBR45+qK7FdEhpBffnM2HHtieG8hoaDXotaaieG4Upka1Gsg2nkDG+
 bFn8esYhXcX7sLMT3nX07Wn6Ik=
IronPort-HdrOrdr: A9a23:JaNC9ajjcnF4nR1tYjIbfnYbDXBQX0J13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5kUUtKPpZ0fSKGMB28ffvyChPhHb3GLtBPB5ufke++3F0KjNvaDaDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="65297643"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsPG/axfux62HgdOa2wciFN4tiDMWmBE08oOpqKxYkBuryDCN6SzZtdMmER5wTnwakiEHXD0sNrpW2ksHTxSdChewQ2SWwfrMVlYgvVldqLi8tk//Y1LDlSrC6HQpnzk4PYXz46ZLlNaCkh4w1kihj1zHzI1tOxcLWlo94sD5qg4Y2J9/tMSunP5DLTe64lYDuva38w1gErINC6d4GQQXQcjE94kRHxe2/bilhboOmqSJmVadgoPuEdiwO3z22PiL8iqFuSWQe3T6idrZIaBp2moPDJ1PwQDXjalbA0qgEXY75x6yClqrmWK94XoXWFR2MqcNtFHPAiWOdm+VcJQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cQ35Usc9F4DMZwK91qhIhJ9HeCZc8KQtbGtfm9nJJs=;
 b=Acrowe3Ep6InMCIODBDelsw0Xuy/X7S1SC7Y+77yYQZQ+XuI3bDnRIvNLeE7wQDMyGqDNWfDwBP639LeoaPoOAukLVj/T2eA372JtwXGoPbp8DP4dz6ljdz807cu88UrTezz0u8wMiRRZYKKBKZzJMKWk1IjD2iaLlrHNUr6Z0pj4n5phAfxCeI8AkR3syHawLzkQdl5CaBeSLTCsieW2UhNMdLhPRfcvoZ5ynSKBj7K48ikkZCGCVwN0EGi8Ma/YXTlMFO1/ipCB7fdAep1Ye8U/Q+NMc/lRkIvFixdt8KuCOoi3ibKPcp/y7Um9/ZKmZAKNva8Taa/2fjZiLNSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cQ35Usc9F4DMZwK91qhIhJ9HeCZc8KQtbGtfm9nJJs=;
 b=Te/bBAFwskQwftJdgXi22VMysgimRmTt2vontdjH9yjnbYCkJyndPh28PUnR36eX1yDuB2vlYZfIH3ylbEp/wz1GxIQE3LSLk+GWp2ZepfOVItd8EGhFtjtxRj4pjbEHOx4bcx+vStdpMueBdRa89v62NI2/K6sbH+u62QU3Xdw=
Date: Mon, 31 Jan 2022 12:31:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YffIfj2HcxM6x7Mm@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
X-ClientProxiedBy: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5e8722-10c4-45d3-3450-08d9e4ad30d6
X-MS-TrafficTypeDiagnostic: CH0PR03MB6049:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6049F47BBC5BCE115583FBD88F259@CH0PR03MB6049.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqpmH3ZH0aeL8XMA/LU4daUW3v5j5DkRW+BrO3jjoiylz7+mLqLqSNQbXvbWLKmPjqrTIgEmqIjaAi0MwRd6DNp+KVJNYar/fyevSAa9cElZCezcqlF6Z1oDYKkiumqnkXl3g5zKhE3ZYm3/diCDAubvzNN0vxux3cf0ZMZFgj7mtTKFTWkifYLr1Ng0bUCuDYkNhNOivhxAo4iCt/tqaJdkhRx2I++pwKOMTM5BscGl0JgH/1+c32qcjuo5JoSevg3kbcu2DEVfDfhD9rZOPjSUlg74j418qJnS/1DKWxhUIBh0zPevruKGmKrdHIoS7h7BNrZlKwlhL7URTk8yzqY/RN7BsqMr8MXbRvtrfdhE1gILAfVlAZuQBhxhOIcNOrrhwyKUeRt8vwS611gCAuEDOEqHYRtV9qyLaczmEfOu/zM9fpuQuPTVcwgwN75i3HGgqEbosVGbt4RebdufYkwsmcv4InjH8Xm/LrNmie8tCXNg/cM3mMyov+ECVaxJ49XnTxcXgeDtAdnh1jvOWxlB4kxNpX6p/DTr1HGZXcdOqdnaOc4KUS2cvuqBhEv2vMdH2AA+d8hoFznUW34fzjJ7jPi1qrogWmvSqnnXzxIW264qnqUEFcWKFlEtuknEqNB8ogyHWvMnTtmUaVbiEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(85182001)(38100700002)(186003)(54906003)(6916009)(26005)(66476007)(66556008)(83380400001)(66946007)(82960400001)(6506007)(6512007)(6666004)(508600001)(86362001)(7416002)(8676002)(53546011)(8936002)(2906002)(9686003)(4326008)(33716001)(6486002)(5660300002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGRMd205cjVhL0t1bWZSZC9JV2l6c1ZtMDlNNkV4cThJRVBMbnE4OHFBMGlp?=
 =?utf-8?B?SW1BTEJLdEtxUEV1OVhwSXEwdzhIVFcvUngvRUZhODdReDE3VGNxMmtjRy9O?=
 =?utf-8?B?bUF3anFIYWg0TjRFVXN6djVpVFVJLzRYYkVGN3FpUjh0anpUY2grZFpQNHEr?=
 =?utf-8?B?KzBMbkordUoyMGp2NEkvMlVsRytGSjBHL1p1OUVoVTRuL1d0eTZ5RHhjLzh4?=
 =?utf-8?B?MitmcjBqcGNxeG5ndk9sdy9zby8razNTS0RXaXlNNk8yRmR0dTlhYW9zZitV?=
 =?utf-8?B?MUNHeENRendKdDNlVFhOUEwxNmo0Wlk4WjdRRHhvM2U5Tkh5TzZlWVF3UVNp?=
 =?utf-8?B?MjBFVzdWdytzeElZOVRRVXRBTno1ckQxTFMzdzFaTzFpbXByVDc5MUxwWndJ?=
 =?utf-8?B?UUp1dEoxYmRxODRyWDd2MDhFRGtyUVZmOSs1VmxpcysvMFAyZHd2cFpKN2RX?=
 =?utf-8?B?QS9wL1RhSVA3MmRwRHQ0YW5xVlhaTVAybjdPRlF5N3NFTlV1M3VROG9VWVI2?=
 =?utf-8?B?OERxOFJ5U0VnMzRvSkhXcXFSNHhWNFBYdlFWbkl5YWFUOEs2U0o4amdnQnJx?=
 =?utf-8?B?SVJ1amlNd1l0U3hPSWVjUlg1TEtTMmU5THZ0MUM1Tk1sZXB0cFJlK2d3YnJa?=
 =?utf-8?B?UnZCeFFiWnptYlJHL3huaWtNMzV0OHBKTUwvVEgxTlhhUlFUTXRBVmRkRDZ3?=
 =?utf-8?B?L1dEMzZ1aVNRb3c5MUZqK1F1WmpNTVAxdmZkK29lcVpuNCtVek9FbUV6Mkd6?=
 =?utf-8?B?OHBUREQwM3hhUHJaYXNtSzlLTW5kSkEycWVlN3BLZ0RkZ01UaWRuaTZVODdB?=
 =?utf-8?B?NzIwOTZPSnhGZnZHYkk5VDRjNU95bUJpNm11WE1NV2Jub1JOcG1yK3JodWJz?=
 =?utf-8?B?ay9oZGpVWWZKMlcybTRnNmtnbmxjN0RzTFhQWXN0c2dKc2RxWHJndGtYcVc1?=
 =?utf-8?B?UFRLOEpaZ3RheVZJM3NuZS91cFRDTCs3UlBPbTFzZk1yQWJLQW1rdms5ZGZO?=
 =?utf-8?B?S2J6d3RPRzdaZ1hVYWVnTWhaQXphUkdHcGUzVXdYRWh2LzNJZ013T3RCcVJU?=
 =?utf-8?B?OUlxaWFWM1lVcUNjZk5nc0x5VjdBNXJhd3BuNnhzeWNwdzhSSEhTaEZyRDlX?=
 =?utf-8?B?OFRreExydno0S3FPN0JaTXFrNVdDUWNlRFB5bFRNY1UwWWlqVmUvMmdLYlRW?=
 =?utf-8?B?WGMwK2s5ODlNTzI5empReEVQZFl3aG9aMDBTb3o0bWVnanhUamxWTGsrZ0FW?=
 =?utf-8?B?blZLSFhvTStVTjBYOUVqenhkS2Vlb0N1UmtXZFgyQkxwbDQ5NkhOWnJ4SUFU?=
 =?utf-8?B?bmtROU11WU1YWHVmMThkL0MyQnNCaXZBUzdBRkVZdjFKdy9XTjJCS3lzVm9a?=
 =?utf-8?B?S3ZHc3J1WHhqZzUybW91WXJKZkEwK0daaXhrZHRnUHpkRGQ1c2lKWllrNXlv?=
 =?utf-8?B?Ky8zOS9qZ0grczNtZG04bjZUWHJpZW41eEFaYlFtZE85RWYrL0VpM2hFUHJz?=
 =?utf-8?B?TDVOTzlKMEF1ZkNDVVBnLzZpUGpld2xQZGcxYTlYczFzYi9xVURlTGpJckIz?=
 =?utf-8?B?TkNPKzNGVDJMdHQrNWViUVZSdFBnWGVMc3k5N3ZBYWM3VVZYWmxab1c0UDdR?=
 =?utf-8?B?eHFXeCtKVEdXY29HZUJYS1lwMjgzYXFsakZJVlQzRzdxNlc2OThVV2w5VFRN?=
 =?utf-8?B?MXZkcGpyTDF4eUFxVXprTGU5QTlFK3U4ak5PL1ZkdnZGTDgyYXVvZ3hMcUFv?=
 =?utf-8?B?aVJ1OEdkcndVSDUyMEROcXNtRFlTWXN0TmJpTWRXdndTbWQwUUVsMnRqVWdZ?=
 =?utf-8?B?WE1Wa2tkdnNmbE9BbmRTdzdMYm83b096WEg1L1RhazNZNGdxcnh5dkEzRDQ5?=
 =?utf-8?B?d0tmY1lHQzZhSnhEZERydlk1K0c3YkV0VU9jUEJCeVcwVHN1U2orYkd0RFN4?=
 =?utf-8?B?djR0WG9HaEJDdzhWVlVKV0lkand5T1N3YzByem1kU2xud3hoSy9nQ3ZSclFZ?=
 =?utf-8?B?TVVTbjEvQkxoQ1F4eUxPVThvakhmV1kzdVJ1NUl6cTBLQkJpVzZCSVU4c3B1?=
 =?utf-8?B?eEJ6c3VPSUd3TXBNRVBiREFVWUtXeVhjd094aGZTUDVZNEZQV2RLTGxBWXg0?=
 =?utf-8?B?NktXL0lHU1EwRU5uREFmdUJtMlNOcTJLelRXdE9VcWxrVDNoMmRIU0JTN2N1?=
 =?utf-8?Q?JH4HTOJMInuQcytam9+Yu5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af5e8722-10c4-45d3-3450-08d9e4ad30d6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:31:15.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCllVjp2dy/l/jAXP4N41keU0Ubsyhs+uawzLJpP17gXBpvvNqI5anq/Im1awvqoMG98qy1GCRdgvKSNP7E4uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6049
X-OriginatorOrg: citrix.com

On Mon, Jan 31, 2022 at 11:23:48AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 31.01.22 13:10, Roger Pau Monné wrote:
> > On Mon, Jan 31, 2022 at 10:40:47AM +0000, Oleksandr Andrushchenko wrote:
> >> On 31.01.22 11:47, Oleksandr Andrushchenko wrote:
> >>> Hi, Roger!
> >>>
> >>> On 12.01.22 14:35, Roger Pau Monné wrote:
> >>>>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>>>> +                            uint32_t val, void *data)
> >>>>> +{
> >>>>> +}
> >>>>> +
> >>>>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> >>>>> +                               void *data)
> >>>>> +{
> >>>>> +    return 0xffffffff;
> >>>>> +}
> >>>> There should be no need for those handlers. As said elsewhere: for
> >>>> guests registers not explicitly handled should return ~0 for reads and
> >>>> drop writes, which is what you are proposing here.
> >>> Yes, you are right: I can see in vpci_read that we end up reading ~0 if no
> >>> handler exists (which is what I do here with guest_rom_read). But I am not that
> >>> sure about the dropped writes:
> >>>
> >>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>>                    uint32_t data)
> >>> {
> >>>        unsigned int data_offset = 0;
> >>>
> >>> [snip]
> >>>
> >>>        if ( data_offset < size )
> >>>            /* Tailing gap, write the remaining. */
> >>>            vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
> >>>                          data >> (data_offset * 8));
> >>>
> >>> so it looks like for the un-handled writes we still reach the HW register.
> >>> Could you please tell if the code above needs improvement (like checking
> >>> if the write was handled) or I still need to provide a write handler, e.g.
> >>> guest_rom_write here?
> >> Hm, but the same applies to the reads as well... And this is no surprise,
> >> as for the guests I can see that it accesses all the configuration space
> >> registers that I don't handle. Without that I would have guests unable
> >> to properly setup a PCI device being passed through... And this is why
> >> I have a big TODO in this series describing unhandled registers.
> >> So, it seems that I do need to provide those handlers which I need to
> >> drop writes and return ~0 on reads.
> > Right (see my previous reply to this comment). I think it would be
> > easier (and cleaner) if you switched the default behavior regarding
> > unhandled register access for domUs at the start of the series (drop
> > writes, reads returns ~0), and then you won't need to add all those
> > dummy handler to drop writes and return ~0 for reads.
> >
> > It's going to be more work initially as you would need to support
> > passthrough of more registers, but it's the right approach that we
> > need implementation wise.
> While I agree in general, this effectively means that I'll need to provide
> handling for all PCIe registers and capabilities from the very start.

Well, we can only offer handling of the header and the MSI and MSI-X
capabilities right now, because that's all vPCI currently knows about.

> Otherwise no guest be able to properly initialize a PCI device without that.
> Of course, we may want starting from stubs instead of proper emulation,
> which will direct the access to real HW and later on we add proper emulation.
> But, again, this is going to be a rather big piece of code where we need
> to explicitly handle every possible capability.
> 
> At the moment we are not going to claim that vPCI provides all means to
> pass through a PCI device safely with this respect and this is why the feature
> itself won't even be a tech preview yet. For that reason I think we can still
> have implemented only crucial set of handlers and still allow the rest to
> be read/write directly without emulation.

See my other reply, you can probably move the special handlers into a
separate patch at the end of the series in order to test the
functionality without adding code that will need to be removed when
the defaults for domUs are changed.

> Another question is what needs to be done for vendor specific capabilities?
> How these are going to be emulated?

I think you will need some kind of permissive mode in order to allow a
guest to access those, as they shouldn't be exposed by default.

Thanks, Roger.

