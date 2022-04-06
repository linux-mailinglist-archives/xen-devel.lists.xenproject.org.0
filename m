Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFAF4F63FE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300010.511463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7wQ-0007Wg-Pr; Wed, 06 Apr 2022 15:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300010.511463; Wed, 06 Apr 2022 15:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7wQ-0007Ur-Li; Wed, 06 Apr 2022 15:51:30 +0000
Received: by outflank-mailman (input) for mailman id 300010;
 Wed, 06 Apr 2022 15:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc7wP-0007Ra-SN
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:51:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a454667-b5c1-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 17:51:27 +0200 (CEST)
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
X-Inumbo-ID: 6a454667-b5c1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649260287;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MgPYovKrrI16mNgsH0jAjbsTQYO5lXzhPnmeplojkFU=;
  b=AsuAJON4Is7KJKp6AtpsUD8ExdIH8GbDN4ED3n3aAnBgQKCEcJ6CQ3FH
   1Nv1ZyX9vqdOZQ6jd6iJaB29jtD5rYJISL8tVnMAlw1/UPeAg1ZKHMr7/
   fHd/ybkSYDOG8sHW9tv6ER622P87naq4lsSJjD806xdt1ngMljL/q/lMi
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68170352
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jybGNqpw1UA4hru606FnX15Rx2ReBmInZRIvgKrLsJaIsI4StFCzt
 garIBmPM/+PYWDxftx0bouxoEJUv5eGzYQwTARtqCxjRC1A+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y2q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOvLAxOQ9QkJjPAIiAqMY57n2M3a5vpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZpANmI0MU6ojxtnFHpPJZFjkuKTonT2fwRU92yo+q4V/D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BCL
 00Z/AI+oK5081akJvH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy18uiY8TOSKHMuAkxeWiFaUg008dflr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM3d3XC3270k5JGQWy2yGsgTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPskoJFPXrHE+OhX4M4XRfK4Ey/9X1
 XCzK5jEMJrnIf4/kGreqxk1j9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SjnABIHkQah3hUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 pHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:4+lZD6GvaDjb3imIpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y5o2mfvVmHp6VO91xNPdfKla9CC4kY1jiaWgOKsk8SgbwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68170352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhB2AatSSJCUtEmIjYTys19jMYwfAexyHeWvQCaR1tJxuBrqvURx8uUyuRYA9DBoVMrLCtwKqqUmszs6sM7pW7puL3m869uOKgDbYbOFir8e/25D2jRdZwP31HfJeLhSnKFkjAr48EURPQobZP3S1HfR+uM9QrGffxtBSc6ezOM7H45wqNZeKcUvOYlXoFKcuYb7pkytQ5bsi7Nu4rRkHroBpN8KFjDTXGr3v2Q/T1JoS1SWNxCCfYGcxEbi26OoOf0cuUzuIQuGsjz9jOiwIKFYHUnuyMI0cSLA4TGmzeB3ofuSVc6zU2OX5cv+ww8OyVp6Q8S/BDilDDWJHRM9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKqVM0GBLPqOklK3xiEy2rbpa2st/sNad4YP4pPi1X0=;
 b=dXKvpiErpMJ9ahQN66mfE7jhr2SOzPDpQFFWs7FhOc5tTgTSZgjGVpb5jWs5DxD+sEr6AvCcX1YLygPA3GgHfnBzwB5fQCXH+G8WAdKVmbmkSReAxYjQmcEj/tS9Wad/UTgqY9bYF63b2xki6RkrRZY1uWo6jj85dC68fMKfIZSnhrnAbwmKfTtL6dmyY7YbPoj0HOrpftKoWgWkaYHe/+RtPB4mrQ7dB3Phn+zsjdWuFds+IQVeorqDlBZ06yn7uMv4X4CUwcIWMh62v1WBPGuArhsYHsUWfC8s3b/KGMrAxIRrUt9XlgnZ7kHW8YBUTFtFEC+6n+UUhaY/M4tpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKqVM0GBLPqOklK3xiEy2rbpa2st/sNad4YP4pPi1X0=;
 b=lmkJxcQMgH+Q6bVORX0/E4Wf1ZHhoT87Ho2xqps4jdkk/G74N1QV35DJGSlT332d9y8ip3O5HMkrdg3uS8mWq7wb6DB7+53QmiJRzGpwvdhC6lmuMeCr6Gi+WxfoBNLNEgmtpK0+dywfpLYFP0Zs2adLSTNGQtOLdvMg4kXp3t0=
Date: Wed, 6 Apr 2022 17:51:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Message-ID: <Yk229J2GMnoAUZsZ@Air-de-Roger>
References: <20220406151645.32827-1-roger.pau@citrix.com>
 <3ebd90da-f7f7-fb14-4809-25202f200d77@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ebd90da-f7f7-fb14-4809-25202f200d77@suse.com>
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f17427-af95-47ce-35cd-08da17e54b3f
X-MS-TrafficTypeDiagnostic: MWHPR03MB2784:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2784329017063BA977BDF1388FE79@MWHPR03MB2784.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yV3Ws2Bnxr7WKKigA9f8PKKZ9fPNpVVuwYXhI57KcSBotY9iNK4LultOU4U/kChJy/9aMnhFf7fdnOtkbwSmC5sygZuZHDgiDazPKXuSOplm2+TwhuMDUTUlOLo5gGBc3ruOGpcK6BGmExUi8bTqD3fbOg/9YrL2zrySx2YWoarI2k4tqWQbmpCx6pmneQKL9lJi1C4KGlzRvTRbtaefnZ7MvVk4mjmruDoK5rAnUEBjHg9baTb4n4N0x3Ll4KVrUiI/WMzAm35+gA6dqGcyUEzKuHm++AOkK7jcggntjRHdftmhzbgiQqs9z+cVNqHN0s7oZ83FlfDS9WLSACBgXtUIJIlPUIXB2b1U9EdejDocJ7eHwgZZTpFVJSnMnPftRJTGbOBKRWwD85N4hvlNGje3kFmmq6yZjG7sSfjuOD2CFNvWCpenBfryxilywIcoczdQNYhRLYln5OlTLoLhOlezg/J/i9MSQbkNSVQaNqdrbyocNH4F+yjT8DO/ZhinfkeaJTjzxbxZuDaIWxSS20UQ7QVTnIkcP5SX34da34l/CNSbHRC7psFGYpS1pdQXTWOslgbhorIFsDEVVYdJyfB3AEzwdSWs/+3H1bt/YMptz6yP67B26pShPEaU/9N5gi1F6cdoKMhARyNB/jqEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(2906002)(82960400001)(5660300002)(8936002)(66476007)(86362001)(66556008)(6666004)(6506007)(83380400001)(66946007)(53546011)(8676002)(4326008)(6916009)(186003)(26005)(9686003)(38100700002)(6512007)(316002)(54906003)(33716001)(6486002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdaZUl0TEF3djI2TW4zYlNleGEvdDRsTVM4YWdTcDhlU0tzY2xXU3EzYzFo?=
 =?utf-8?B?cFFJUnlMMExqQ0l3NldKaSt5RkVnWUp0TGVxVTBmN2p4MjQ0SkRIYmpTZ0NY?=
 =?utf-8?B?b0hyV0l6UHZMV1VGSVF5byswTjRXOW55ZGZWeURSQlZCSXZTTHJFQTg4WG9O?=
 =?utf-8?B?ZzNSOUNPaGdDbmw1alRXYzlkZE1DaGlsbEZOVkd6UktHT1g0ZWhqMjhMSTEz?=
 =?utf-8?B?cTRQZ3NSWmlaMS9HY1l5cXdlc2I5ZElHcXY4aVI1UURLazlRV3VEZWwxWE0w?=
 =?utf-8?B?aFJwOFVkUzBsWTU3cW8wMUF1cGxjTUpWdHY5b1ZSVmJVcDhFU3JHZ3hvVXNF?=
 =?utf-8?B?bjBReWl6SmpqYndnUEthVXBBZGhFT2pEQ1luVjNFMUFMa0p1RlY1MlJkQU5F?=
 =?utf-8?B?OTIyTzJmZGQ2UFVMSHlkSGMwMzBCbHhYQ2FZMXhyVWpEQmp5SkRnU05pZm1Z?=
 =?utf-8?B?N0F6SUpWMmFCeTlmb3VZNVRuSVNralA1bHdIK2l4UWhnWEdlTVdxeFo2N2ls?=
 =?utf-8?B?d1F2V2h0OHpCMnVkOCtHYjlRU1I0WEwrY0ZMdlZZM3dGcXBKMUpYZnMxUHRh?=
 =?utf-8?B?bWRPbXBWR0VwSXNHcnJWYUQ5aGNqTVZpdFhnalZ4NkRPbXB2S3NwUlg1QWpC?=
 =?utf-8?B?RVE0UnV1Vnl6dklhSjhRNjcxU0EzQ2p4OWJZNEVVTUdpbjZWL21SS3JuTkIz?=
 =?utf-8?B?NTlBUmpUcHJIMWdOeVErR1BLcVV0NEM5KzBNNm9rS1JVNVJFem1ZMWJRTUtM?=
 =?utf-8?B?bzF6czdMdXA0bHF1YS9oM0pIOGZyQnhlK3NmY0RSZ0ExMWp5bEdEeHh1K3NF?=
 =?utf-8?B?amJMZ3VXNWZkYU92dWZIbk5ZQjVZNUdYaSt3dWZxNXNlMVlua005bm1UWStI?=
 =?utf-8?B?TzBLbzFuTWJGcGtFK0VxM0ZHRExnTWpaN2dhcjFENXloOGJXNlZiSStrVlJZ?=
 =?utf-8?B?SmpoSElCcW5RL1pPRTU3NXdoUXZTeXZPUitBVU00WkN4dDdoeWdLa2ZGZkY4?=
 =?utf-8?B?cnNaZUQvc2gxdjBmaUlpdkZGNE1aeDRoUGlTbE5BODQ3NTlwWFNqZy95ZHMr?=
 =?utf-8?B?a3d5U2oxY2d4MCtNWS85UVpiZDRjUVM5V3RWMExWZEZCS0lKTXFUTVY1V05Q?=
 =?utf-8?B?QUpjeE9oWGtUcFZSVnhmMXMycFJPTEU2VFdWUFhtRHk3d3F2WWJ2RkRTVDhz?=
 =?utf-8?B?K1BBZUJ4L0NmZ0tjdWNJQ1pZUnlBWllwNkp6b3JEbTErUFpCbS9jTjJZNG1Y?=
 =?utf-8?B?cENFOXFYS2U4MEUwOHdjTHRwdlBGMXZkQW5XTUhYQTJ3ZTFzcEF2U09MZFJ2?=
 =?utf-8?B?K0lIMVdrVG5hSnZMdHZEbm1EMUUyaEtpOHBpVHQ0WTNTZzlETktBOFAyRk9w?=
 =?utf-8?B?VHpOTzBFdng4T0Mxc3c1MUYzY3dPZTRMNndRSDJmK0NkSTNSK01RZTVEZGFC?=
 =?utf-8?B?YUtucXp6dTYwTkpkM3dueGYyQTMrMUdtNEFuQ0loNFJkdkVvbHJPTFZWTlA5?=
 =?utf-8?B?a2FtdmJTVUlXenYwWFRmV2x4bTlUSVd2UERhUWxRZkdZalFWcUhVL2pnSHp5?=
 =?utf-8?B?UWdTSTVScXBPQmpFSDhpSkxYOUhCUjM4NnRUZXM2Unl1RnJDTmZzTk9ZbWEz?=
 =?utf-8?B?STZPNnA4MllJUlRwV0czRFNJZGJsdXVMUEhGU09XWFZXZlhyWk04QTNLQnc0?=
 =?utf-8?B?dTZ6S0pGazhhSWxJSzdIYzAwYzlIVENuKzNqL05XS1UvbVVEczlHcmJUNWtI?=
 =?utf-8?B?bHpPTXlMblNlZHhyWVJoTHVSL3BOOEwzUlo5WnE2RVFwSit4NmRHMDkxOFJB?=
 =?utf-8?B?R05ieFRFMUZITTdNN2xEYlFTaGQ4amxXdFlmbzJTM0dkMkE3NktyeFpFYitR?=
 =?utf-8?B?SGY4TFZRYXU0VDBUVWhFRmdoQkl1NFNvRXNGT1pxRGp5ODZBQ05rMFB1c0E5?=
 =?utf-8?B?RThpSG10TGE0N3ZNeVVDQ3Zsam9xTnluZnJud2ErcHVIdnNobStMTWIxc0pV?=
 =?utf-8?B?VDgwbWpUTzc1THF0ak9PbklTUW5saS8vKzlVbW5WeXY4QnlNRDNXVU1GUFIx?=
 =?utf-8?B?NW9nUUlEeVhiTDBtQTFrNFVHR1daeDFpWWpYTjRHYjQ3YzVHQUh0MmdVMWxW?=
 =?utf-8?B?czh0UnlCVEQ3V2Rqci85SUlETjdKcUt4VFZZc05ObVp3Q1BNM29zYk1sTCtL?=
 =?utf-8?B?N1F0eHQ0V2pzK1dzaitLVk1DNWhRaDVFaTdlRTlKbjBJL2Exd1h2RExTTGlY?=
 =?utf-8?B?TVNodVErZWdkNGpjVWxQSklybWJlaUx1STJnd2E5cmkrWjZDUzNzckhkdURZ?=
 =?utf-8?B?LzdFbklIWGhlVDd3ZVlPaDgwMTU2UDlkckRsaHVMQXhBTnlxNkMySFJuUS9U?=
 =?utf-8?Q?3SbAz14PvDy60IrA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f17427-af95-47ce-35cd-08da17e54b3f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:51:20.5147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIkzZwXtaL+7ZFsgHmi8EBTFzO/5sc7rX4hvXj+ibcOZbGvoKmldOu006wkN/aWYWuQSF+gphtOzTv4isqxJ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2784
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 05:31:22PM +0200, Jan Beulich wrote:
> On 06.04.2022 17:16, Roger Pau Monne wrote:
> > The values set in the shared_type field of xen_processor_performance
> > have so far relied on Xen and Linux having the same
> > CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
> > public interface.
> > 
> > Formalize by adding the defines for the allowed values in the public
> > header, while renaming them to use the XEN_PERF_SHARED_TYPE_ prefix
> > for clarity.
> > 
> > Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I wonder if we want to keep the CPUFREQ_SHARED_TYPE_ defines for
> > internal usage (and define them based on XEN_PERF_SHARED_TYPE_) in
> > case we need to pick up changes from Linux.
> 
> I think that would be desirable, also to limit code churn by this change.
> 
> > --- a/xen/include/public/platform.h
> > +++ b/xen/include/public/platform.h
> > @@ -465,7 +465,11 @@ struct xen_processor_performance {
> >      uint32_t state_count;     /* total available performance states */
> >      XEN_GUEST_HANDLE(xen_processor_px_t) states;
> >      struct xen_psd_package domain_info;
> > -    uint32_t shared_type;     /* coordination type of this processor */
> > +    /* Coordination type of this processor */
> > +#define XEN_PERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> > +#define XEN_PERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
> > +#define XEN_PERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
> 
> While the names may then become a little long, I think it would be
> relevant to have "processor" (or maybe "CPU") in the names, to have
> a better match with struct xen_processor_performance. Also I'm not
> sure you want to define these inside the struct - they're
> supposedly suitable for Px, Cx, and Tx aiui (just like the underlying
> ACPI constants are).

But those defines are specific to CPUFREQ code, the raw values from
the ACPI tables for the different 'coordination' fields found in the
Cx and Px states use different values, ie:

#define ACPI_DOMAIN_COORD_TYPE_SW_ALL 0xfc
#define ACPI_DOMAIN_COORD_TYPE_SW_ANY 0xfd
#define ACPI_DOMAIN_COORD_TYPE_HW_ALL 0xfe

And hence the values exposed here should be limited to the existing
usage by the xen_processor_performance struct.  Otherwise it would be
preferred to use the native ACPI values, which don't need exposing in
the Xen headers then because are already part of a different
specification. IOW I think it was a mistake for the shared_type field
to use the CPUFREQ defines instead of the ACPI values.

Note the coord_type field in xen_psd_package and xen_processor_csd do
expect the ACPI values instead of the CPUFREQ ones.

Thanks, Roger.

