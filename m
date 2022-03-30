Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B74EBDCA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296153.504081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUp1-0003qR-Jv; Wed, 30 Mar 2022 09:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296153.504081; Wed, 30 Mar 2022 09:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUp1-0003ng-FW; Wed, 30 Mar 2022 09:40:59 +0000
Received: by outflank-mailman (input) for mailman id 296153;
 Wed, 30 Mar 2022 09:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZUp0-0003nK-30
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:40:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df7cb0c-b00d-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 11:40:56 +0200 (CEST)
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
X-Inumbo-ID: 7df7cb0c-b00d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648633255;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6o5qA4346uoHHGfScy1463N2He1BRwPdpWUAKmUOriw=;
  b=XbR2w2svsPAPmTmY1Oo+kE2290evEtej7rCvqwnBSNwWTJpJTGnclCOu
   Ty2jL6CNXqHbZT8ylqlIPZ0LtHn7Ks7pyXogys+z8dKcZvM7TfMkZcL43
   kMrfRNqUBdP+8kbO/zACI7qXgpe3xAcRxInc4dnR51QsZhJqmtiMkVuwz
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67534225
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W6TutKpvisXIH/0fMkSAH/UnzM5eBmKHZRIvgKrLsJaIsI4StFCzt
 garIBnQP/qLYmvzfdkjYYSz8ksCupLcm9Q1G1Fv+C08RX5B9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 ouq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOZXphesYcCRkPCA5M/0B06WeJ3fkvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZVEMmY1NkmojxtnYg8KCY85kM6Ut1ahdiBYtFCsnKgM7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZoiVuf3H0OCzUZUFK6pb+yjUvWc95QJ
 0Eb4CMGsbk59EvtSML0GRK/vhasvAMYWtdWO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1+q+PqDKuOQAcNWIYeTIfVgwB/sXip4coyBnIS75LEqS4k9n0EjHY2
 C2RoW41gLB7pdUA0Lmnu1zOnTO3joPVRxQx7w+RX2XN0+9iTNf7PcryswGdtKseatbCJrWcg
 JQas8+myf0BCLKwqAOMB+tdW5qzvvCKazKJ1DaDAKId3ziq/neie6VZ7zd/OFplP644RNP5X
 KPAkVgPvcEOZRNGeYcyOtvsUJpykcAMAPy/Dpjpgsxyjo+dneNt1AVnfgau0m/kiyDAeolva
 M7AIa5A4Zv3YJmLLQZapc9AidfHJQhknAs/oKwXKTz9i9Jyg1bPFN843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyRrWMCs8pYPLLbfSuaDJI3HI6WLqV/GU9Y495m5a8+Sp
 i3tMqOm4ASXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB4CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHAQHlKKU3DafSmZHH+PlDSvvdIGmT0xzMTVla2rHBVVHvu76PTY
 dSIj2vmfHbKfCw7ZO7+Y/Oz1VKh+38bneN5RUzTJddPPk7r9eBXx+bZ15fb/+lkxc3/+wan
IronPort-HdrOrdr: A9a23:Z+CW0aGrFmXzmUNspLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y5o2mfvVmHp6VO91xNPdfKla9CC4kY1jiaWgOKsk8SgbwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="67534225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ba+lQdip4qxSl7WHs4MJ38wrOudXlihBEZwPmctcn6/IsTYvjSMOTfFxaGxcdhFZSvFNPi38jhL4r1X+o4z6LwHkuY760NRcXFPatuUB7xb4s+E1paThXInd9/mzL75cSfSKQd6XojuQo30xYXnqmsGZpox2C99VP0slrSuxo79M7duraB8SfX6w1U1VQNHCa83fczAqMAM2wnAuj+M3Mx7blsV93CVwtzDLP2OTJeSLFy4OA0HsC8zDFTyNHEtHmxXfwAGf0BqafO9Q6QCZN4d8BI4emna154vvd6Aq+OJVz1oQnc3JwpGnGh7bTEhbJDdJ6RSVtDBI+ThPbfaf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2SEi1/vL5PsnWQZ2WPvraI+wpAM1cg+DV4QwZnz2rs=;
 b=ZNGJgXmBEKtSJYxP2/Ajc6V+DTV2ML5DyyTcoQmzugKT3ThH8N38ErTWbF0nNMAmca6MFNWMLMyb5EBjeNYw90Z9VyVhlqsdQ88grucdEr5Q1kC4o5h6qUGiMKGxn4MwPlYrfOw3e0hLjAYjYelR2jsIJfjVY9JLYLNO1yl3RusWL6cVb0n0ib0SH8xyQBRuWAeO1uATJ0cqtYwMw1z1j8ALjrgUgkmG/A/q0PMef0caKbgC05IX/E94o3lxg3BibkcVVZmVbcefeZvalNcib5A2BtYjKJg4ZQcantsyLJ74S9QioHPyx6dM0ou6NEgUTfqZclexvDZGmHJtPRC63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2SEi1/vL5PsnWQZ2WPvraI+wpAM1cg+DV4QwZnz2rs=;
 b=jAHovnIKrc1DZoSAMKxaDetmSxeIJMaj0Gw+gfkQzxcAeFUGB+7zhNRBSiFx/FO9ByZj+VCt3+GzPGnXwoQb0A4p7sJaGXp246eMcfGXZtlP/MAcibAv1XkSDf287e9rz/PbM1FnFRxYKoz+OvT/3I0wWARHj6zqy94GXMD5ff4=
Date: Wed, 30 Mar 2022 11:40:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Message-ID: <YkQlkOWtXqGBAoM/@Air-de-Roger>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <YkK1dSS6RZ9hzyh6@Air-de-Roger>
 <ae3ba2f9-ace5-0c30-9190-06c747953b20@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae3ba2f9-ace5-0c30-9190-06c747953b20@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d7cfac1-6422-4182-cb4d-08da12315c12
X-MS-TrafficTypeDiagnostic: BN7PR03MB3826:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB382688BC8A885F5B9FA8C3388F1F9@BN7PR03MB3826.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mx5Kn0deKxO7ajcUiXRaIYDmqauFZ38XBqLqLJww1eyG5U16YFIa18+4MRLRJ0gzaKmLAPnEpCdyJ33Pn1AmVI62UHY3AYdxse+aWeD/g4rpmMCUGiiRCFBYltbbnJ/Yh0bEHQNsZhA/RjyArwqWr9z43MDAHW2axhhxyh0vur7QC1ZV47qevYcUKo5RzyFke/RDW7VMAIBYYAahBtSFjEhdSyHjcyANQE4G38owxIGmmztlPEeVfH7WzwWl6N+54ZAHgk9Dv7m1NYFI5cHAs5jFeoz/03CWDjtkTmi0GAqcTZM35NRH9MLs1tECOx1en8lx7402OW/NErgeUVel5HcRnzsJnvniB6xr49fQXh+5vNMRLvW0x+e4y1/mj7Ggv6b2R16Jb/4CzRnP3gW7LNm0UU+e8xrzEk6akDn6VLcJS25zAVc0/VH1nA3vwhslmsOoEWYO2SffqX7wsw+u2snOv3Bl22xA0k8n4lvDiu0hCSIgsXGyXNhSG1mupef49oK225T7xQFy6pY0KEtC76ENxZsb5YoL04tPl9gAXcbasSE+D+XJ5KUo/uJxkWzspzldz0IQopClahNEgz2iu6Fkvjr64CRPwJ5QtervVre3fFlmhSWOgvLyFtEqAscvxBKB8xBW8TKkC/4mb8uY/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(316002)(6666004)(86362001)(508600001)(66556008)(6916009)(66946007)(5660300002)(85182001)(54906003)(82960400001)(38100700002)(8936002)(4326008)(8676002)(6486002)(83380400001)(53546011)(186003)(2906002)(6512007)(6506007)(26005)(9686003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVvcHZhSmxzTDBmVWJUSzRUYlp3QStCOUpMQlRtdi9EZy82Ums0cmR1czYx?=
 =?utf-8?B?UUNWMVg0eUtiQThCTGVtOU1zRXh5UGlvekd1Wjk4NGZ2a2VGTHBPSjZsZEdP?=
 =?utf-8?B?NEdER1FONC9JK0ltbHAyZWdHUnliMkFXbEVOREhvazkvTDRjVU14SzVJNU5U?=
 =?utf-8?B?ZWY5OVZ1a0d0RDFKWXc2clpOV1VRZXZPazlqN3dCNmExbHZUNmRGS3F2R3Vq?=
 =?utf-8?B?R2NrQVpRZnVVRk5sZEpkcjZZd2lvWUNzMkpLUk9wZ25rU1dLM2RsQ1pDenNZ?=
 =?utf-8?B?YTE5czdzeVFMM1hyaHhiVlZJbWdlRld2M2hSc1J1cjI0T1BLODBqcWJsOVJ3?=
 =?utf-8?B?T0prTkZaMVZlek9pK3UrU2E2TXNScWlJbjlVcGp0N0xSUTBNRnB4VncyYlc2?=
 =?utf-8?B?SlBsRXBXV3lSREYwYVA1b0gxUGNBR2tCbjhpZnNHWEpRMVlyL1l5Vnd3Sktl?=
 =?utf-8?B?OGtFTkF5NjhTODVVRkFzU2VBQUtIb3dRdkZaNzMzSkk3ZUJoekw2S0UwN0Nx?=
 =?utf-8?B?cnNaTGlENDMrTHhldnQ5NzFXMDBzQ0ZtUEpPcUhHZGdjNlFyTTVCdWk3L1g4?=
 =?utf-8?B?RlBPZER2bkNLQWU1Z3g2K0VUUDVmNUJiZEN5N2IrLzlJYWFHMVBsdTAxVUpI?=
 =?utf-8?B?ZUdvSVowMGE5Ny9aRTZvOENYcWJ4eWVweURWYUszcEVldkVWeVNJQzhaaHBV?=
 =?utf-8?B?dGM4VGRrdU1jVklEV2tOK1JldzhGd3UrbDIvOFo0QWphZmFURENZa3dKbXdZ?=
 =?utf-8?B?a3JtaDZGaFRBK1Znc1VaMisrV01DbHltQThFU0ZaN3J6bHp2aHNlY2RGN0Fs?=
 =?utf-8?B?Q1AwOTBXRlVSTDlraEtiazFtV0s3REErVVNZODM5NkhuVUd3SVlZMWE4aGFa?=
 =?utf-8?B?Y0Ura1N6T1VVMXg1QWlLdlJXMVdibFhxMnBCNnhYcW1BQWVIemlhNFgydkVz?=
 =?utf-8?B?TThTTk1CMmxuMU1BYThVN2g3MDNYRmI4UVFzMEViQzQ5QXZSY3NPYlFSajhr?=
 =?utf-8?B?Tlcrc1RNOEtwb3BISG1obU9DRUcvNk9nOHI5M3JWNUtGYkd2cm9RM2c4YWVx?=
 =?utf-8?B?YThtMWtQRTJhNys4emd4VXBKb0N4N2pQa1R6c0JjSVgvTVlMUWlyaWtoRDZv?=
 =?utf-8?B?TVM2Zmc4cDl4NlBnMkVGdGMvYXA5dDc3Y3FyZHRqbXBvQlRJcW96WXlyMG5n?=
 =?utf-8?B?ckd2bk03eTZRVFZkdU43YUdkN0tVZFVqTUJENnlzTGhQM2F5VnVlMFEvVFl2?=
 =?utf-8?B?MEY4UnVIZUhLMmpENFNDVjRYNE1Zc2w1WVZUQ2xEaTkyZWFYMkxMemxOZzQ2?=
 =?utf-8?B?ZGtSUGVzbit2VFVsMVQvTjVvMnR1U3dqNjk0L044Zmp6QmhqZXFPa0tXV2Vu?=
 =?utf-8?B?YXhlZUNkOCtQdUFkOEhEWnVoRUpXVE42VWREajJnOTliWWtWaTRQM0xmRmxL?=
 =?utf-8?B?REZuZllma0tVdjZkTTFiMEtzVHN6WEJINERGeENxNitwQnhkS0ROV2tQbzFp?=
 =?utf-8?B?QlU4dnBtNDZzSkJpTlB5MmVkWm13SWdCTXdmU0k2Zmhvb3IzMkt2SVdjQnh4?=
 =?utf-8?B?a0dzRkxJT0hEM1gzYXBlcGdFODBrcHl2M280NXI4WUtWKzAxU05LdEpRbmdj?=
 =?utf-8?B?OCtpdzlFZ0tWWFExeHd1QW5OOHQwM0xJeWdEeVI3MnBoNFNYL2orVHdoOHI4?=
 =?utf-8?B?Q0hSelU4K0xFQkc0NktiU2RyRmxkTE9OZmpOUC82RkFja1RUS3ptOC9mZldv?=
 =?utf-8?B?K1hPTmlkd0FSVXo0cmdDYjdYbDh0c2FqajBVOUd4N0dBVjlwcWlNK2xxYkxS?=
 =?utf-8?B?SEQrMHZJVEsySVB6cFBUS2VnTDR5ZGhsWW1GUzF1UEZSeWdhUU1LKzRBNjRO?=
 =?utf-8?B?ZlRHZ3dtc2pqUXZVdnEzc2JmZ2xFK1VJSFh0c0Z1R01hdVNoYmp5b2E0MXc5?=
 =?utf-8?B?NHhNbmp0Y3VVeVl1RFRYcUZsYVhhK2VNQkhjUG9kcWY3NXJCU1pjTHY4UXh4?=
 =?utf-8?B?dElZSFpCYVlCUElONGNnVFFQekZvbmxFdHB4NHdUeG03QVlZSjJzQ2ZoS2lh?=
 =?utf-8?B?WDdTZjE0SHU4N093S0ZwZm1sdnluMkhXOFRxaWptSGxjYnduY0NSdFRselVq?=
 =?utf-8?B?Wm9yK0EweWNCMjFKSUdRREtHQmZJQkZTL2RSYXpib0dsN3BlRTlFZmZmTDht?=
 =?utf-8?B?YTNQaytyZTltdGJQTGc1NGRMLzZ4Wm45a1pTVlBNbFFxRTlQZzloaC9LSzdF?=
 =?utf-8?B?ZDRaWHNucXhNbGlxTFVWT3EwMG10cEtLUG1jdGx2ZW1YWmhFL25DdWlxK2h6?=
 =?utf-8?B?QmVxTGtGRysvZXVXSEdETnBDNUE5a3hBL2JqOFNpNGNxb25LbUpYdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7cfac1-6422-4182-cb4d-08da12315c12
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:40:43.5497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dy7eVi4fpPGBTjImwXmFtytPbtTl0sxTXrPAXdHmqPFVi6FLml9AekibZINuOM8MLTNgpuQ46JsvB3kfY+YxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3826
X-OriginatorOrg: citrix.com

On Tue, Mar 29, 2022 at 07:12:56PM -0400, Daniel P. Smith wrote:
> On 3/29/22 03:29, Roger Pau Monné wrote:
> > On Mon, Mar 28, 2022 at 04:36:22PM -0400, Daniel P. Smith wrote:
> >> During domain construction under dom0less and hyperlaunch it is necessary to
> >> allocate at least the event channel for xenstore and potentially the event
> >> channel for the core console. When dom0less and hyperlaunch are doing their
> >> construction logic they are executing under the idle domain context. The idle
> >> domain is not a privileged domain, it is not the target domain, and as a result
> >> under the current default XSM policy is not allowed to allocate the event
> >> channel.
> > 
> > I've not been following the discussion around this patch, but I would
> > assume such privileges are only required for init code when no other
> > domains are running?
> 
> At this time, correct.
> 
> > Since it's only at that point where the idle domain context needs to
> > allocate event channels would it make sense to temporary elevate it's
> > privileges by setting d->is_privileged while doing the domain creation?
> 
> This is initially what I did but it seemed like there was some
> reluctance. As I was looking to formalize/abstract this in XSM instead
> of doing direct manipulations, I realized I could achieve it in the hook
> which would allow the hyperlaunch and dom0less code work without having
> to ensure priv escalation is properly handled.
> 
> > That way we wouldn't need to grant those permissions for the lifetime
> > of the host when they are only needed for initialization code.
> 
> Correct, which is why I adjusted the effective default policy only on
> the check instead of in xsm_default_action() as Jan has suggested.
> Outside of a code fault, all other times that evtchn_alloc_unbound() is
> called `current->domain` should be pointing at the caller of the hypercall.
> 
> This works as an interim solution with minimal impact as it is all
> internal to XSM and can easily be evolved. My concern is that exposing a
> function call to provide priv escalation for the idle domain as an
> interim solution for dom0less and hyperlaunch will have more impactful
> code churn in both of these when a longer term approach is adopted.
> 
> > Another option would be switching to the initial vCPU of the domain
> > being created, but that's likely to be more complex, or even create a
> > short lived system domain with is_privileged set just for the purpose
> > of building other domains.
> 
> Longer term I would like to explore doing this in general. Some initial
> thinking is the fact that hypervisor has a few contexts, relative to
> external entities, under which it is executing. When it is handling
> internal house keeping (e.g. scheduler and security server), when it is
> interacting with guest domains, when it is interacting with hardware
> (e.g. vpci), and now when it is processing boot material to construct
> domains. It  has been mentioned that today in Xen if one of these
> contexts acting with external entities is corrupted, it can interfere
> with operations occurring in the other contexts. In the past the have
> advocated and been working to split these contexts using hard L0/L1
> separation. As noted in other discussions, some architectures are
> gaining hardware features that can be used in hard L0/L1 partitioning
> but also could be used in a more "soft" partitioning more a kin to
> Nested Kernel[1] and Dune[2]. Again just some initial thoughts.
> 
> > Overall I'm not sure it's worth giving those extra privileges to the
> > idle domain when they are just need for a known and bounded period of
> > time.
> 
> IMHO that is a slight over simplification. Setting is_privileged to the
> idle domain while it is processing domain construction data from outside
> the hypervisor means that during that bounded period the idle domain is
> complete unrestricted and may invoke any XSM protected call.

The domain builder code executed in the idle domain context can make
direct calls to any functions that are otherwise protected behind an
XSM check on the hypercall paths, so I don't see much difference.  The
code executed by the idle domain in order to do domain creation is
already part of the trusted code base (ie: it's hypervisor code)
likewise with the data used as input.

> Contrast
> this with only granting the idle domain the ability to allocate event
> channels between domains at any time with the only codified usage is
> during init/setup. While I am unsure how, theoretically malformed
> construction data could expose a logic flaw to do some very unsavory
> allocations without any guards.

It's kind of like that already, it's just that in other instances the
calls done by the domain builder in idle domain context bypass the
hypercall XSM checks.

This might be giving you a false sense of security, but what's done in
the idle domain context in order to do domain creation would strictly
speaking require the idle domain to be a fully privileged entity, it's
just that we mostly bypass the XSM checks by calling functions
directly instead of using the hypercall entry paths.

> Whereas during runtime if the idle
> domain was tricked into establishing an event channel between two
> domains, it would only serve to provide a covert channel between the two
> domains. Neither is desirable but IMHO I find the former a little more
> concerning than the latter.
> 
> With that said, I am not completely against doing the priv escalation if
> overall this is the direction that is preferred. If so, I would prefer
> to provide a pair of static inlines under XSM name space to provide a
> consistent implementation and be able to easily locate the places where
> it is applied if/when a longer term approach is implemented.

I think those helpers must be __init, and we need to assert that by
the time domains are started the idle domain is no longer
privileged.

From my PoV increasing the privileges of the idle domain just for the
time it acts as a domain builder is merely formalizing what is already
a fact: if the domain building was executed outside of Xen it would
require the context domain to be privileged.

Thanks, Roger.

