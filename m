Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79B4D2F0E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287792.487995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvSe-0003DO-Dc; Wed, 09 Mar 2022 12:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287792.487995; Wed, 09 Mar 2022 12:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvSe-00039s-9O; Wed, 09 Mar 2022 12:30:36 +0000
Received: by outflank-mailman (input) for mailman id 287792;
 Wed, 09 Mar 2022 12:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRvSd-00039g-7Z
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:30:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5f59ecf-9fa4-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:30:33 +0100 (CET)
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
X-Inumbo-ID: b5f59ecf-9fa4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646829033;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jn996H0UodBbzF0NdWN/tz8IvosBKCSnpUrq0gK8r6U=;
  b=JC0ZdQwzSRG29m/xNPmO/j9+uFrEHIy5PuFu5dtvAcB0UMjdMY6sQkw9
   flq64A6JMgUYmDERaHjOF+QoepCE2WH9TCEEkJ+0Mb86AznrZ367EgH4G
   C1flRCgxcMbLjltd6UvzwgaJwArLC63hm7PS35Ru75oiNYT6K1TGr0v5f
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65815390
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N6ARpaxp+ECnHgqGVIt6t+fDxirEfRIJ4+MujC+fZmUNrF6WrkVVm
 jdOUGyAOfyINmX0Ld8kb4iwpkMPv5TTnYJnHVRprCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YnhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplvNvsYxkkI6f2u7osU0l3MyV3DL9H0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0eRKuFN
 pJxhTxHNkqfZkQeG3IsKsgaveyTolSgYwZgkQfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRokSzQc5FI
 koYvC8nt7Ev9VeDR8P4GRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAXMGsDaCksXQYDpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7hIlX/bu24Fr9oGydpsjmbgo81xfWdzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C9TbwJtdiON7Kih6SdkifdokmCgmbKgwjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ylkEr7i+rCOCLLIVvgDLdoRrpphE9jiF+Jm
 +uzyuPQk0kPOAEASnK/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3Lc6nKAuE
 KVdJZno7zYmYm2vxgnxpKLV9eRKXB+qmRiPL2yiZj0+dIRnXAvH5pnveQ6HycXEJnHfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:U/fXi66nXxcmRV7+MgPXwT6BI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsj6KdgLNhRotKOTOJhILGFvAF0WKP+UyDJ8SczJ8j6U
 4DSdkGNDSYNzET5qybkWqF+r4bsaW6GcuT9IDjJhlWPGRXg/YK1XYFNu/XKDwBeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njHsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLldFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhC12dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtsgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4akWUmxjIbLH48JlO11Gh+e9
 MeTf00pcwmOm9yVkqp8lWGm7eXLzQO9hTveDlxhiXa6UkUoJlD9Tpo+CUupAZ/yHsDceg12w
 29CNURqFhvdL5jUUsvPpZ3fSOIYla9Mi4kdljiY2jaKA==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65815390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwpMfh6Wk12Kt4AFcsFHc4oVysprAVnUovEdd6BcPAlr0QQj9xiCkLaPnbmP2g+QqSS9f6erAgaxghIGjiIoDP+9o4k77PjAVYFm3MqwPbNEW0DQ34I5WsWPWmZNvIUYKyc9RUxuHXMc86Mt/kvyIxDz31EGE8xNNe/VDkz3zfNUE5fvTaRKBuXzhEb8pdrQT2KUhN2eXCHPUTDQSHKndwMH1lB6CtKgNE4Asa/Ajqx2pHb3PyNgNP5JiSrlmRUTrMiGSl25HwhgXQvfs5+RZ9JY44mP/CxGGtIobfgKsFoRoVRCPtsBRBA/zEEboqMzSXobEL6Ji7rpZxkBQz3yTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP8l3Y6EvHr8ZL+9KA8yAnkl33yvaCRA0iYuYR7ZPcg=;
 b=iVFJfL0Wul5Vt1pbEZaQq3OoScyPq44BUo6ozFyyRm04dVO0LmG6m4RNLRf/ORcMJGW4kPxaZNO+3E/4qifCNh21NX18CvSODQ9ZOdUnWNUF1JIvFLHkfNUgMzSdMynbFJk98heAjg3uaOoi10yMpOSUKQcuNAgYDlprMsbCJYugzEh1qP3R0/fc7/Hgb17uOUYDENgI8fQzFM9LhpnBAkDLYmPng8m+AMp4nnRXM0HMO6iCM7VXm0ZSDxmmA318pfUnA2d26Ab5x/xoZUFrFIyQhxI5GRIiHKvuXCKlMAqAvrVvs3akQnHpxRNHivbswOOE5a8xrynVMM5hOakLNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP8l3Y6EvHr8ZL+9KA8yAnkl33yvaCRA0iYuYR7ZPcg=;
 b=DwmMxX1iziTDdk2l9ZuTKx1aL2B7EuzkL3hW07tR3QXB+xw79F35eZYCYCLL2wQOM0LI866dUZu8UOTr94sMgAxM1ThFWhFur3Zeyiyl20iWZGkhcUS0r8bKBFQoxtJcnXvgferBvUD6ujGR6vc3hnlXuS3sKHKu8426WTuBDOk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v4 0/2] livepatch: enable -f{function,data}-sections compiler option
Date: Wed,  9 Mar 2022 13:28:44 +0100
Message-ID: <20220309122846.89696-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f38f626f-ea10-4653-4ae9-08da01c89467
X-MS-TrafficTypeDiagnostic: DM6PR03MB3596:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB35968DF1F4FF4CB31C90D9EA8F0A9@DM6PR03MB3596.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fz8s8Qu2VZb4xXWfAUox+LI5EWzujtWqBqd2mTp6nPeXpvPW2RpZDeihyva8IPsMr3Ca/zZ2ZBwazOrblOySI6nU64laZjWlbJMR+5qATse7zAwGwytscgljk3bvG83eE5DzTzOndWXRtm8LZFKlP4oZK9TDZnAcXS4OLe82NvZ8y5Jx1PHBgPkIbkWzupXgA+GRUYKUoJHmoqew3lwCGHPmYTq37QECyzE7Kv0SnSTdaXzhECCI2wJoInoPmJd0hXME4MH/Oag+CTWjKylHYFtH70DP1bbXpaFhbBoF7cYNttbwT/JMNcrx7Rouz2UcZxurgVfP5Z0yVvP3dL2qMaGqDfqHSkx+kzV8Lds1LPKAiRsKN6mEdn52oZRTPGB/5cRsmxipmg/doNKVCfJIEtshEBJSo0mO1gqwNrakZtcoqOog0/x1HKnalb0NKJL+EnyWNmIYvN8qtsbZYpXnLvr+1R3zNpUOs/LvoWHWcgwCNKLm8jrlXeWgj977a/DLQiCsEGtcb6bqxOkv72vEvt1nB4rFYZlkqxHtzTv+cgmE/+fBDZxi/4uYuRYwEHVTZ0sx/Yu+4uR4/CCot+UcNnxVsCcWHHCEuDayEPPUUTfkj8En21SzY0T4fRGjQWXoZ7NRGX73J24hgFu+jjA7cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(6506007)(83380400001)(6666004)(66946007)(6512007)(6486002)(26005)(38100700002)(2616005)(1076003)(5660300002)(2906002)(8936002)(508600001)(66556008)(66476007)(8676002)(316002)(107886003)(82960400001)(54906003)(36756003)(4326008)(6916009)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xnNDRQUHZXV1dHdVQ0V1ZxQmhsVDY0WW9tS1V3cmYwcVlqSmRiM1gwMlVr?=
 =?utf-8?B?eWFUL3R5UzhtelVacWpQZnJjOE1ZalZjdStGbzFPT1NtWmJTczNFYVVxRExs?=
 =?utf-8?B?T050bk1QUGVlcWdCUFpGOGxhUXpqeWcxd2hnd0laOVJpQ3RlRElyRnZzeFVq?=
 =?utf-8?B?RE5tMHNjMzVrdTlxOFR1WGM1MDhjUldOaGFrdEtPVmpQUzROQ0wyVnVFa01S?=
 =?utf-8?B?dkpEZElockNsL2ROcUlvMm92ZjNybzdmSHA3VXo2cHNJS1JuT284ODRaNXEr?=
 =?utf-8?B?UHlQRlVMa2lFTExhQWE1U1JjVjB5SmRZcVBaTGZnamxDT2J5VVVhOGMxYVV4?=
 =?utf-8?B?S0ZFMi9rTldLYVlldE9iaG8yeDJMbTcwclVETGFBejJubGpyZFZ5a2xrRW5M?=
 =?utf-8?B?OHAxdk1KbEw3V2dhT0RnSjBwZndicUVibytWbThVTndRMVJhUVF4THBtRUEx?=
 =?utf-8?B?YmpEZThZaW02UnlvdHpFajB0a2E5Y21RSFdSM1JQL2xJK2gxNS9BKzMvNEkr?=
 =?utf-8?B?bnZzZ2ltWVV5a1JveElFaW1uV2Z3UUZma1hqRlBmcm5SQU9oRWZRcUNEckhI?=
 =?utf-8?B?N0RKUHdnS0o3UFgxNGpqMmpSL25GU1dTZFVrWXd6N1VJVUNUQXJ3TldXWURW?=
 =?utf-8?B?VjIvc0RHZzlQcTBuS1ZPaTlYZmVXTFFlVWtVSmVyL01iSWtKNlZnakxiWTFI?=
 =?utf-8?B?N3NzNHp6SzZjajVOWksvci91eWFwMEpYVzUwUWxSUnpVd1JsUkFielQwSXFa?=
 =?utf-8?B?S0NXYTRxd2hJY1lvZFNoa3QvK3dFUDNIcHZqOG90NDhheW1relRZU3hEc2FL?=
 =?utf-8?B?MXorTFVuQ2xmajlCN2NRK3lTYnlNbEZ5ang3WW1tRjVvR0kzdy9Ca0tId2Jt?=
 =?utf-8?B?NWdVSTNKcHhNOEhBZVY4YUtLczNlMlYvdmdwZjhNQnRUU1F0aTVBU0VKQkRa?=
 =?utf-8?B?N0hobm4rTng1eXErQ0xyN2oxUDdNTjdKQSsxMEgyVTZLcnBCajJGaWRIZHBM?=
 =?utf-8?B?WHAzYXVBUEQvVmVtRDA0Q0xwMzgreURIdG5tVFdSRUozYno4VHRNb003Y1M5?=
 =?utf-8?B?RUZJMzJsT1M1emV5c0lrQjhoU21FQTJadlVSVVdVSjB3MHNSOXIyTUlxWU5J?=
 =?utf-8?B?c3R2bDNaRUk3OENPN2NodldmY2hXa2NueFlUbFlMM3JIWlRTUFk3QVdGSVlL?=
 =?utf-8?B?VmFNNHhBTFh2c25GNXUxY0paYkVXbGpQTXdpZGo0VlI1QjZPMHYxSnVNTFY5?=
 =?utf-8?B?TmJzVXBxUlJQK0MwSzNBTlduVHJaRWJYTkl2b0krNTF5T2ZOeUV0TktyZEhw?=
 =?utf-8?B?eWlWd3I0b0dZWkk2Z0pVckZncGFqc3RlR0FPeGF1aEcvMWNWOVFzUFF5UEww?=
 =?utf-8?B?MUxhME9YNE8zZ1ZzVSsvZVFINjFSdHc1NGl3NmhlbXkyMlY3dVdTekdici9L?=
 =?utf-8?B?dkpDRXRBQVJZRlp2YUhEY3MxSjhiSTQ0TGdUUTlkWUVuSExoU3NKcXpzWW12?=
 =?utf-8?B?MDhjMHEwOERhVXVCTjdiVnhzV1hlOEFnTmx5dzNFMHI0anhoT3E3VEQyR3NS?=
 =?utf-8?B?VWNYdUNRQkVkcm9ETmNzbnNNdmJBSzlKU3dRYkRwVEtuVlJzUzNZVm5wWUtk?=
 =?utf-8?B?b0RlWHRYUzJwNGNYVXpuSFM1cEJubVFXaHNFMTF5czlvaEswQ24xazYwRGxv?=
 =?utf-8?B?VEQ1UVQvckdjTlFFOW9mNURra0pkU2JxdkVteEVabk00VEtZcG5ERDBOaDBO?=
 =?utf-8?B?MG9yMFJTQ1UwSlBHVVJEK21CT21XY2FuQ0VSa3EyV0U4RUNGUS9zdUlYeElJ?=
 =?utf-8?B?R0NzR0F5R1UwaHNhbnBSOWF2Smw0VllUWDRURDcycHBNSDlXN0pIK0xMTUlx?=
 =?utf-8?B?c3BVcGVqRnFUdVZ2emlFM1J4dFp4ZUd0bmRMOFVuN2FrbTRkN2tacEd2Wklz?=
 =?utf-8?B?cUltWUtQenFudEpaQ0pLd3J4RDhJdEhFQkswbDZSSE92cW8vUFljQ21ROE0x?=
 =?utf-8?B?ZGpFQUNDM0RvMlZyakgzaHM5SFMzWmFISjhOT1FBVElCTkd5V0RpRG1wbThY?=
 =?utf-8?B?eVB5UlJXWm83WC9vYkVFU1V0ZndzOExEeW9LMUhFRldNa3VPN3dYaTJ2Ri9h?=
 =?utf-8?B?bXFRbGd1RHdEOVZmZ0hFTVJ0cFUwaHA1c1V6K0JYSndFREtrckZqMkZGUXc0?=
 =?utf-8?Q?RZVHUzWQ3LkS7/CGBwnGx20=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f38f626f-ea10-4653-4ae9-08da01c89467
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:30:22.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkUoptdasW9scB479aCqNT0woXEA8Ni+S6qhs+FZVYSrEBDPNs4VzG3V7EGpYJ3Hw8aKd753BlDM0iaewDF2pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3596
X-OriginatorOrg: citrix.com

Hello,

The content in v3 has been split in two patches, but is still mostly the
same. The main difference is that first patch does a bit of cleanup of
the build logic now that the header object file doesn't need to be the
first one passed to the linker script.

Thanks, Roger.

Roger Pau Monne (2):
  xen/build: put image header into a separate section
  livepatch: set -f{function,data}-sections compiler option

 xen/Kconfig                 |  4 +++
 xen/Makefile                |  2 ++
 xen/arch/arm/arch.mk        |  2 --
 xen/arch/arm/arm32/Makefile |  3 +--
 xen/arch/arm/arm32/head.S   |  1 +
 xen/arch/arm/arm64/Makefile |  3 +--
 xen/arch/arm/arm64/head.S   |  1 +
 xen/arch/arm/xen.lds.S      | 49 ++++++++++++++++++++-----------------
 xen/arch/x86/Makefile       |  5 ++--
 xen/arch/x86/arch.mk        |  2 --
 xen/arch/x86/boot/head.S    |  2 +-
 xen/arch/x86/xen.lds.S      | 20 +++++++++------
 xen/common/Kconfig          |  1 +
 13 files changed, 53 insertions(+), 42 deletions(-)

-- 
2.34.1


