Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A686428C43
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205867.361284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtiQ-0006eq-RH; Mon, 11 Oct 2021 11:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205867.361284; Mon, 11 Oct 2021 11:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtiQ-0006cV-OA; Mon, 11 Oct 2021 11:43:34 +0000
Received: by outflank-mailman (input) for mailman id 205867;
 Mon, 11 Oct 2021 11:43:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZtiP-0006cN-92
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:43:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75301d92-2a88-11ec-80d5-12813bfff9fa;
 Mon, 11 Oct 2021 11:43:32 +0000 (UTC)
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
X-Inumbo-ID: 75301d92-2a88-11ec-80d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633952612;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ksmLdh6X1qeS0oowY9h8h/tj4F+GPZUT5tLWBNa6yk8=;
  b=Os3IfI5zKrt2eMwhi8x5hmGUviOU7lresqoe8pXyQ9f33hQZXa0i0lmc
   KeAfiKWOKdZvwaVraUE4Dp1qzZArhRy9ZnWM5i811iuB2fk8pEC/0N/+u
   HPeeDUXzzo87tGJ1lE8fr3slGXOBC4hMgofDUk2p2DfhNfwqEzW4O+LTB
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YA8DR4wDJqlK88M37de5vFrY2J5AWR01Qg6VxCNuieYR+7rizBd3wqGO9CXv19nTZ+RXqD4eOi
 AiYkQGbC3stkcw/xzPZklKJPNTfzHiFEjPs3pKcFpijiER/XAG3V0VZms7D4uuw4AvyETzpMEy
 0IQf37S9konCUGOLQwLJcd0JZ+BBm86IZjqRTMxtBn8DpKWSYpSZ3DKFYrLbt+AblpTnTAyys0
 t4DHqwfsZgVxb6isjOfX1THv+1OwgqfHslKqau6aFnY+c1iCMm/XLMr8+X3ryAA4KgVodCjACg
 vxdbZoQv34cwovKcP9tlrLZ+
X-SBRS: 5.1
X-MesageID: 54845201
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jGSLGK/Cg9DVabScbzyRDrUDz3iTJUtcMsCJ2f8bNWPcYEJGY0x3n
 DQeW2vQb/fZYTD2KY8gaYyy8kgG7MXTx4BgGQA+qiE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhMz
 +drqr2ATz53FbPUgckwTBdzEHFhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgGds25oWRJ4yY
 eIHdGswYA79TyEXGVYXWcsOsMirqiLgJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3A
 koY4CdolbIg5VOiVNDVVge95nWDu3Y0QdNQDul88wCLxar86hycQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAfIHUefyYCQU0A6sP6vYAophvVS5BoF6vdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqw+rlL7Wbz4z31v8QHq8wy5maqWmN5P9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr2v6jdYVUwlXYqRsN7r238pBZPaKgJuGkmTHqFJProbtMAj
 KX7gghW+INIdEWjaat6cupd4Ox7kPC+S7wJuh3SB+eig6SdlifbrEmChmbKhggBdXTAd4llZ
 P93lu72XB4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgDVPrFhs/rd/FuOm
 zq6Cyds404FOAEZSnOGmbP/0HhQdSRrbXwIg50/mhG/zvpORzh6Vq65LUIJcI15haVF/tokD
 VnmMnK0PGHX3CWdQS3TMygLQOq2Af5X8CJqVQRxbA3A8yVyPu6SAFI3KsJfkU8Pr7c4k5aZj
 pAtJq29Pxi4Ym2foWpCNsOh8NUKmdbCrVvmAhdJqQMXJvZIbwfI5sXlbk3o8iwPBTCwrswwv
 /ur0QazfHbJb1gK4B/+ZK39wlWvk2Iane4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtH6tIuE7tiwa8kycHoortWklZtEHnRNgz5AbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVN8POqZ1PwSlj3D1tgPIR33tH1t4b6KcUROJB3Q2iZTG6R4bdE+y
 uA7tc9ItwHm0kg2MsyLhzx//niXKiBSSL0us5wXDdO5igcvzV0eM5XQBjWvvcOKYtRIdEIrP
 iWVlOzJgLEFnhjOdH86FH7s2+tBhMtR5EAWnQFaf1nZyMDYgvIX3QFK9WVlRwtY+RxLzuZvN
 zU5LEZyP6iPo29licUrs7pAwO2d6Ml1InDM9mY=
IronPort-HdrOrdr: A9a23:+YxRFqBmvcgzlCDlHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54845201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDxBnxzTe1opMOfzUHJcKIAP3yhpbnZstyCMBKYlEAQCcKzLe08MmN6m/rw+b4DklfSfim8M4SjI7sB4HNjS6DvipL6OKVmWNSUWv32ecOB0aoYRfGS6JGDS3lI/lfW0LZfHyenxA/+u//9MLUYveL9YLod0Im8cGA7JTMyrJ1ui4z3wLuzfbREtJxqTh+qs3h7ipx1kvFkovgrefttgE7RtujeemAI7SqRmRimreAHIGSKV7ZHPWgDmHiHhY4QWti+Wn7grL3mYm0LotlNNCEsQMD3rCVNlPR/TAtODQo+FdOibwU+UfQu2dJnK2rSKT4c+tvNRYGClQhH0J8TZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiXvTFGTVaqb92zcizGZa4jU/TpikAjbs09bimXZZ6A=;
 b=UXjUhf3IJEO2CjyILq2Nbjr27EaAzcv5n6aRQdegt+bD+P62aTBmRH8EE/386ia+VL7RLYjQHj8H4MqcpDMcnC/mr2220lpkYnqV9fNSrIwCRShs2q5uFq5ifF/4gy6cThutxCT5zpL9ICSXg11tIbsyC1N1ZnZuq2exS/cDIa5fCcZa5iVT/PReDcsX+yWF3o3t6hDJswwdDFEVnx4iws0/OXdsIBF2906PQjZEarXeLpuliTBmytmFTpqtxG0lYpwTLuRBzQ2CEhFNb6JWVKpliHuy2aT1EsB9DNmq3q5i/N1LOMfh+odQdk/dFXAx5jxCOJeeKUxvJ9ZIgLbCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiXvTFGTVaqb92zcizGZa4jU/TpikAjbs09bimXZZ6A=;
 b=PReqeiAtfHOTB+v3Q6l7Ct8RKciu8tvIf8sRSEUz0AfFLBBixn/G8KBPVNwbmUqiT3ppTagSpA5N3j4LrDFlbr9a1AI0zACCwgxlIIN///STUQ6MckXYmGTNLstrrNioonMzu4QzByJpP2ocvW3CCvVtA2bNfq+Cz0o3qvvUaps=
Date: Mon, 11 Oct 2021 13:43:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 09/11] xen/arm: Transitional change to build HAS_VPCI
 on ARM.
Message-ID: <YWQjTOypE96IqWmA@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b9653c6247060574cf68e1f780ef1db3dd0c20d3.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9653c6247060574cf68e1f780ef1db3dd0c20d3.1633540842.git.rahul.singh@arm.com>
X-ClientProxiedBy: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44813c56-706a-45d0-e045-08d98cac4f42
X-MS-TrafficTypeDiagnostic: DM6PR03MB3484:
X-Microsoft-Antispam-PRVS: <DM6PR03MB34846BE5D4BF22281C6A285F8FB59@DM6PR03MB3484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFwjTOYE6mIOWbhTkw5DdAWG4h4DAn3FDOdEfAI9/RqPozaNUh/DqJHUw3qJYt4OesijwuphW0TmL2Nl7Tw1NUJiDEKNmWaxXNyH5vZI1pSJaX8c5WDEPksr611z+VIqJbE0Ei+3guZlltHPo1ew2MOjW32J3foqg6Hh3N3Rvq7qglhzqXTBDE4OsC6dgrHVMGn2tniTYy0BpCkokjH6rVc6hEZE8KDkbF+ZUFkyodnUnp3XYFerOnpKui4Pjad1C3vzMEgMJqU3AZjxjEeqmxtxRpq6Z1AMKNj4x7HGv9MK5n6+JVv2cg9LjXM/DWNbJMe8I5eLlMcG/T3JSDKb8SGyRkmz0T6k/7QY0YCR9KTHqzH7b473lGVswYbBA/PKjVgY15QfSMjjpG5/KW2Y6yztQHMczYPiq6v8AqDBjp0SHcUYtnNy5NDWV5NW6kVhgISwJP73zuMb9EJ7n9owro6NnOhNk2pO6XiTf8IkvwFr8D/YmHAyJWh+4w958cyDylC2vKDHI87oeDHVaoTtnSs6kp0MqravGIbeE4AbAXEvFkkvzFJw+zMFv39NtcGiS7UcFfAAmzU8Byw2pSKyuZKB/tA//wp5Yh8LwF6BQvbAxP+fD2Pe1zGlsb6NWelpd2Gma2qOf3SVx2xuultEnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(956004)(6666004)(6486002)(6916009)(2906002)(6496006)(66476007)(66556008)(9686003)(8676002)(66946007)(38100700002)(4326008)(83380400001)(186003)(54906003)(508600001)(26005)(85182001)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRUUHZJOVRySXNKOHRQT2tWRzk4Y1F3RXFHdG45MmlRT2tYdDVFbW83Slgx?=
 =?utf-8?B?Y3I0NjBNTnlSc3FPSUpJblB1UDNaeXhTcFdjSnlPbkpXTFRnSGFyc0FGOWxy?=
 =?utf-8?B?YzN1RHFCK2lUaTZ5ZzlaWm1EdGxCRzUxM0Mva3pJTnRBRTc4dEpLNkR1aUNB?=
 =?utf-8?B?cUpZWDNUbmZJencvREpVM3dqdDVIRmF5TTJlbzFmSWZ6aG5mVHpzb3dFbkJ4?=
 =?utf-8?B?bnp3bk1GVVYwMW1KR3pmZm9QMGJMa0ZCc2FmTjl6WStOWHd0VFhOaEhKT0xI?=
 =?utf-8?B?Q2VhbTRrTkdQNXNOb2tpVkw2NnN3N3l0WXI2REhSanl3OGZEUWREWkl6dVp0?=
 =?utf-8?B?dUZCWENmOTgrYXN4M05uN2Fmc2JOK2lxdGxHRjJKSFFsUnQ0b0JzS0d1Vytp?=
 =?utf-8?B?QjMxZmt0Q1Y1K21na0dlWVVrT2xrV25TZllYcWtCQmpyaElrZ3pvM1ZKNDRs?=
 =?utf-8?B?eHQ3dHY4cGMwR1o5VE5VbENLQnBqU3g5VE5qTDhnckhWUHNHbzlxUEtyN0xC?=
 =?utf-8?B?a1Z1R1BmbjBFR0QrY0NGbSt6Tm9RUm5sbzNjeVcxbE0rYVQrM0RZWVNLNFhx?=
 =?utf-8?B?OHpIZ29mMUdGa2h6MVI3UE9oTlAyUUpjZWVBT2pzM3ZMMDR3eUFpQW5aUkQr?=
 =?utf-8?B?UWI0SFdXNGVMMzVFOGY1WThnVCtTY0pTVUF2QTlIc0RQcnZhUUk0VHBJUnhp?=
 =?utf-8?B?dFNGU2ZhUG1tSDVZSktpUEgyNTRkc2tuTjJDMUxoeXRnR0MvbTBEUEdlNDgx?=
 =?utf-8?B?UFRvVXI2U1JFKzdVM09rbFJmZy93allGSFRmaWpHTnk5OGtZMTRaVUpWL1Vo?=
 =?utf-8?B?VXd0cDhXdUJhSmhEL1VsTGN1Nm5rQVVEWXlmWFN2MEtVYXIxckVxQ1VDWmk5?=
 =?utf-8?B?YkxRYnNZM2ErZGl6TUVScmszWkVPeWNwR1hhK0MwWGtTdHdTNGdYbWd2eExk?=
 =?utf-8?B?UXR2a1Y1eDdxdFc2dmFNTCtTOU1hWWkrZUpiUndhMGtKeVlpQUtSOGVidnMr?=
 =?utf-8?B?dUFRT3ljaWVZZyt6YjhhaktZbEVIRE4xL2ZKWVZ3K0lSa3hjdnFpQkV1UzBV?=
 =?utf-8?B?WWsyNUdFU002MUtkRUQ1NlFRNGVGMjliMjRQZ2pzdjdYazhGMkF6aWJ2VTNx?=
 =?utf-8?B?L0NHM1daRzFTS2k5UE1lU3FCb3Buc2pCR3pFeFlEZUxHOTlDR2xKQit5dU1O?=
 =?utf-8?B?OTMwTEdCazFtT0tZMzRnQUhTL2QwZ1duSEVzdjJHWHRlcWx6cDZpaWp1bjBx?=
 =?utf-8?B?eENlM09xNUIwTWhVdU5YbENwM2pUSXprcGQxSk5nV2xOUlE3S2I2Qjg4aWNw?=
 =?utf-8?B?TFA0bEMzSmJDUEFVS2pGZXc4ZHRNQXFEMEh3Zy9FOXVRK0h6L0xPNG0yTUZu?=
 =?utf-8?B?b2U3bURUV1ZJQ3U1TEU2REdEZ0xENzVOU0xjQTE4SlA4cmNUMmdwd0xqblZh?=
 =?utf-8?B?eU9icGsvbnlESFFPcloyTE9BQ3VJeDZsOVorYzZJaVp0TWk0dGNLbHZ2K3ZW?=
 =?utf-8?B?aHRHakFpMlZURldlVkdWY0VMalhrMFJTVSsyNWFNTi9QU2RmZjZzZ1ovVWor?=
 =?utf-8?B?b0VRbVBybFNqSDNCYmdkaWFUTmM2K2tGNVhMMmlJNDJKMkRxOTc3QUJMUGNX?=
 =?utf-8?B?VlQ3ZVFLb0pBMWZFOFBTNUFrL1FsME1iUUQ5R0tWSE81Vm4wd0t4MDN4Y1JB?=
 =?utf-8?B?OHRnMHl3RDdNTzlYNSs4ZTlDNHordGJCZW4xTEg0bFJNaGRQU0lMcGkwZ05U?=
 =?utf-8?Q?twclk3DDjnODP0O9E4uX//jO6RqITsIliU28asf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44813c56-706a-45d0-e045-08d98cac4f42
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:43:14.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWO8/b661WYvyYgsMFzaK/k5z18ne/8omsdwlbWdij/vRsUMdNw4rPH13kwnPNmnCNGg55QY3LUeU+NJM9FovQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3484
X-OriginatorOrg: citrix.com

On Wed, Oct 06, 2021 at 06:40:35PM +0100, Rahul Singh wrote:
> This patch will be reverted once we add support for VPCI MSI/MSIX
> support on ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Roger Pau Monné <rogewr.pau@citrix.com>

> ---
> Change in v5: none
> Change in v4:
> - Added Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> - Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Change in v3: none
> Change in v2: Patch introduced in v2
> ---
> ---
>  xen/drivers/vpci/Makefile | 3 ++-
>  xen/drivers/vpci/header.c | 2 ++
>  xen/include/asm-arm/pci.h | 8 ++++++++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 55d1bdfda0..1a1413b93e 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1 +1,2 @@
> -obj-y += vpci.o header.o msi.o msix.o
> +obj-y += vpci.o header.o
> +obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba9a036202..f8cd55e7c0 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>       * FIXME: punching holes after the p2m has been set up might be racy for
>       * DomU usage, needs to be revisited.
>       */
> +#ifdef CONFIG_HAS_PCI_MSI
>      if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>          return;
> +#endif

FWIW, I would also be fine with providing a dummy inline function for
vpci_make_msix_hole when !CONFIG_HAS_PCI_MSI, but I assume this is a
temporary workaround until MSI is implemented for Arm.

Thanks, Roger.

