Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A187474627
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246836.425686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Wa-0006ry-M8; Tue, 14 Dec 2021 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246836.425686; Tue, 14 Dec 2021 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Wa-0006pt-Hk; Tue, 14 Dec 2021 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 246836;
 Tue, 14 Dec 2021 15:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx9WZ-0006pk-Jd
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:15:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a97acfd1-5cf0-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:15:26 +0100 (CET)
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
X-Inumbo-ID: a97acfd1-5cf0-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639494926;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DOL4ZabMUwAbKdqSNR0cVvDQXxVUqA23V/kFpU5QhvE=;
  b=fBhNEsgactuua5wDEIPcY0tVW3wn+8B5h6Y/CI3C1Yu0lrPZWmJyJX5d
   2g8NpvyYeXVyyLGjBbbHQzwibA6uFfgIyG8yu6WF8eImdsR1KiHGEaQDQ
   56hXNHa/qR8CMBlmV5T3na3En2fChvXlB6h2Ucxa4cq/afZLOtD4fgiim
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ohebrPkhOuPel6yu0druO4yDrXy+hgXfnUlj7as8eJHBdq2xS3iCPV6DWnQRJb9U4kDx99/gG5
 AZYAwDrhKie6tsx6hO6k37QE51d24VxOycVrmK59gDJQdrPkq6McrbnpshMPWgcC+jMS0yxiZK
 uvCkUagMkTntLuW7xuh8EPv6f+LCkyuDcNH0UC5GnQRUfG2haon/F788js6zCFz57af97YEHKp
 UhqpbYOEs0x2hsTjOTYZK6W+8XFxTVRCQ6cBpy+nJZktLXMUnAWe07y2DHHP8zuTvtu7s+Go/U
 yrGvcgYLarz/d5nXQvIvozjV
X-SBRS: 5.1
X-MesageID: 59494132
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:u+rty64MCuCRTK0ikoBhJQxRtM/AchMFZxGqfqrLsTDasY5as4F+v
 mofXm2COPuDY2qjfdh2aIvi9kIBuMDcy98wTwY//CwxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj29Iw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 +pA7ZeKc0AQHaTWssswSzNyOChsMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWZs15wXRqy2i
 8wxUWJCQgvOUkF1GAklF4AlxvmzqWL6SmgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 mHL4WX/RA0bPdq3yDyZ/3bqjejK9Qv5Uo8PELyz9tZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZqV9F+v/UMAgUJ3
 0WjsP7xLxZEua+aHCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjv3jpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDCvIji7rnXzURhpdnh+pnzuJ5p1xWG3jZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiD7MfUuO9/vVJV6pUQFKTgDfqqLBjapSsIuHDJrAQk0PRLAt4wTuBZEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7FhhIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrLZf1c9Rjh+U6S5LHFIU9UNopm5X9zgp
 xmVckRZ1ED+lTvALwCLYWpkc7ThQdB0qndTAMDmFQ/AN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:dsj8l6EJrlpGin0NpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59494132"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzcfIc6HY1ys+7UT95Ov6+DrvxC3HDt/g4MDfUTfuwLm364q4ZOT0HCTM8OteXswRfwXopZ6ZbLriiNVSe7jQhZ58ttSyNDmTt3dfr8UDx1f/US/QrWT8PjKuhPai32BJaa45SNLt2FtXM4yM72FD2SmMBfcevSjBhnDVVFmoOpgkfVE3TvFTsLajTcROtPHNmBpqKrEQEpCpdFpwO3yKCq45R/nIETCjKkarjAXc7iNRgd+D3V1faxCT3t+QnBnSa8dOgXalrshuBc7gp7WvxpCYm6hduFA+bFUS7cVB5+odTgXrrP1EmUd6H2t5a7osjEwkzH1Pl+dtVXLuA8yKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN9lW1TI4ATp0d0WrCH5IjPExl0iV6e2d5QMJ/yvlEc=;
 b=FiHfsyCW1X1CIMMLB05rkCvFOIwdDle9zG8VLoA0Kgnii4cmsIyoHYcRjUeT+SlseQO4YCPJp/gq5odkSUAI97yZd4b9rE+/FkHOGfaDZ2vmEroeR3EGEsopChpCFZ+PIXtjvb1FzAsJea0MsY/piARm+pCDEjqsXyXN3qaO4OwJjgAIZmRnRqm2MbQ1KZHUbcrIjE1PIryWUbAfA079VUTzskFZbsY/rEdZ5sH3HZ42KMT66LO441Yfdd2MPPZwn6whZMt6cM1UMM40I7to0GtzZzLGD4UbDQHw81ZbsgZso1nTCgAk2fBP5XLktfb06sFyzzlrdeeCtUw49NJhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN9lW1TI4ATp0d0WrCH5IjPExl0iV6e2d5QMJ/yvlEc=;
 b=SY3tCHJ0k3r5xaWE4S1pINk8EcbWepglxe+65CWQV2iM44tHy4Zg8mzjKgfaamfJKCLJG+R3bH6nn/iVit4w3ttkIKBZstm7GjhF6s9nWrXZpxecs6miXkxEB+RmtYMQCIlyzD3iLoaRUV2B+kNXJfwc5Pq3PIXIbjQGPEhSCOo=
Date: Tue, 14 Dec 2021 16:15:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Message-ID: <Ybi1BJR+UybxeMMy@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbivUH/Er0o2PwsG@Air-de-Roger>
 <fb221da6-2ad5-e298-c582-364943b95198@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb221da6-2ad5-e298-c582-364943b95198@suse.com>
X-ClientProxiedBy: MR2P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0b512e8-2a7c-4eac-0e2b-08d9bf148ba3
X-MS-TrafficTypeDiagnostic: DM6PR03MB5081:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB5081F28E0DD84522999FEDF18F759@DM6PR03MB5081.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+ukeIGYe8BAxXVShjHKNK4i4uKP2IbyxFnMgVurNhSygsO+7CK59On3oOiumrMBVlz2lyUl+jtXIitDXOYMMqKomO5tS4OqGGNlkOPXTamtoAeLv4bFnNIZ+dRxeUcuhDuRbLI+KTVcwEMJNkO5CQXTX/wRS3sNUM40qR/1A1TOk9ydCU3gyukqH1SPhwmM5C1XpNJNFAneAceqGl8lCSbrMiW0iITIFErfUX70n0kN2sY8kwFaP2dWPkGSXlKxkY+xWwNhuCoFO2URk9x97H/17zAmEzcagpwqIwdrIgBkp0Fb+kEc4HgVMregGF7WdMAODEzCmEDC9R5VQs8WA0Il/+/ovEL07Cwj7dsJ43ZRmUWGmJw94yHtuZ0H9AUP/0cvHkS6Ojtar4GSjGZdp/d5lTpfYPfys/zJPWF3/Au5zsf+jdzFIQu2X4MxOzFwQYcjyW246yoFci3xlMNsD6jNa5lSj4IxB//c1wK+QsFP+6UeFBghQ8L6JW+qtf1oBXWtpxH3xCB8+MYnvuIetFruAvOD8iZttWr8+o90aaWG7KWhSFvtUvH66IiWXIikIMqrO6PngL1uwwZ8xnEa+jYHpMlki6DHmhe/opPzwTL1wuZfHHEIwd6UsmBjpe22zQXeMN495tVkEHHL0oDzsitcQwZ1MCWouRFyzipvqZKM/WUg1bbCO0NHr2E9dB0BlxO0+GI9osRih/QgoQZD8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(54906003)(316002)(6506007)(82960400001)(6916009)(8936002)(66476007)(6486002)(26005)(66556008)(186003)(53546011)(8676002)(2906002)(9686003)(508600001)(5660300002)(6666004)(66946007)(6512007)(4326008)(86362001)(33716001)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXR5UExVdUp2NFVOdkFHSVdVckpXaVNvUjVwTmJSTTR3OVJVUlV6RWcyd0la?=
 =?utf-8?B?OVF3ZmpTN1NJdFBmM2lmbllrek40RUdieU9IRXNMQkJaMjBESUh5OXJZZzV1?=
 =?utf-8?B?aGphWU9KSU11UVJ3a1AyaUpZYm5KSWhkclUvYjN3a0p0U2x0UHVEajEvNktS?=
 =?utf-8?B?ZzBWZi93Y3o4U0lROWkraE5rQkg3ZGVDd1c0SFdiaDBPVkx1V2dDU09Edmlq?=
 =?utf-8?B?bzVMRTZQT0RwS3lidzkyVVMwNklQQTM0V2UrQUJVcVAwWkhLaTZ4QW43T0pu?=
 =?utf-8?B?T1c4L1dLYWp4NHVORzZEbk1BM0VYVENjYmx4VlJFTTN3Njd4YllkNHljaWdV?=
 =?utf-8?B?V05XN3l2S2FVZUVjYjdUdTZaeHRTL3p6MHZkNFQrLzVtc0NjdmNUaXRkeGFR?=
 =?utf-8?B?aGhpaVA1QzBxMkRQR0VsUHdRdndVSDdNZDJJVVA5Y0NENlpuQWR1c2pSTnlh?=
 =?utf-8?B?M3Fzb2hwbVA0MTJVTWFhbXFFV2h3YTZaUnQzcWdhTWlSK3FYNFlDUkJ5blpM?=
 =?utf-8?B?YkhUSCtCc29EaVF2cmtXZ1h6NWluejdUYWd5a3p0STltdW05VjBIcGhDSzUz?=
 =?utf-8?B?U21VYU5wNDUrYWo2VHdCdVI1eE80REhDMFc5OXloemhaYWJ4b3Z6K1RMOFlT?=
 =?utf-8?B?NHh2emxYUGMyUmtnc1ZRbFpaWkZCZG5hL0kyTlkrVmh5OHk5blJ5TjRPQ1Ro?=
 =?utf-8?B?U1JVOXBhQU1UNFlSZUErdytSc2h3eFBscnQ2aE9tSmFidHBRcDhJVkVFdUlO?=
 =?utf-8?B?NUZMOTdlb0p3ZjZFOGtyOEtONnNISkpVcHExOGpSZHZZT1ZUQVNvYkRna3ln?=
 =?utf-8?B?SEN1eTJEVnlrM255UExkZGhnRlNsVzlBbmFOaW42bEs1VG51SnpKNGc2Mmg0?=
 =?utf-8?B?enIrZ1RPNzZFeUN6bE9nWU5YVHVnTHNsSHEwcDhRMlNVS2RhMVdMRGxpSy9n?=
 =?utf-8?B?N1RUVjJSYnZiS3dYOXJGbG5BeUpxOGh3c1ozalBENDRkTlArUUlGc3hrMFBs?=
 =?utf-8?B?aGdKS0JtT2s3U1l1VjEwNkRtNzlBWlZ0VmQza1pBMGgvSFI3SGZYSW1KY284?=
 =?utf-8?B?OWlVVEdHcjU2QWhPUUNwV2ljNVJkTCt5dXZ3RGNMM1NkUW5NZ3RCb1FXN3Ux?=
 =?utf-8?B?QmVmM2tGamtOWExPM2ZGTVhSRzlqMCtCa2U3bFFWc2pZOVoyWmZoZ0ZRQ0xT?=
 =?utf-8?B?R1VRQmlFLzZNNHQwaVlHZ3FYSTdycngzZE45V2E2M1Bzem16TTNXVmU0MUh4?=
 =?utf-8?B?cXozK0kwMkJSSFZWbEtQNGUwcmNWU3E5dU1hSHp6ZTBOT3c3MWhncG5iYmpv?=
 =?utf-8?B?c0RIb01qZkgyWFQ0KzBrblJVbEdyS2FrODc2VUp2cHhRMjNzTE1IQ2lyWWZX?=
 =?utf-8?B?Yk8zSW9wU3FsQ1RVRUZuc0E2MkRXSnhrUlNKamQ1Q1RNanBaMCtNL2lyNUty?=
 =?utf-8?B?TTVNTTc3Qmx2NExmWGVPYjg1SmFPY1JvdWFpVDhVTDc1ay9YcittYXpadHhI?=
 =?utf-8?B?Tko4UWJOL2tOdTk1NUJzV3BiY01CTER4N0thOVpBQkFteGk0Q2xINWpyVXU3?=
 =?utf-8?B?NW0yQ0xJUmt4QlB6eGlmVUY3SUVDVkk5dDZqSzVOMlBpaHRxbXVyOFFwR0No?=
 =?utf-8?B?Wk5KQVRJWG1QTnlya1I1S3N2U2xWeXYxdTZRS3JUa01Kc2lrbS9Sa0NWQ0hz?=
 =?utf-8?B?RmVLc1NhZCs4K0xHbFE0ZklHdk5sVWNnWkMyTHlqNzRQN2tKYWJ1KzE5bk5Q?=
 =?utf-8?B?amJnWDFjaUZXSFoyN0NsVmFtUnh3V2VuMkZxVkJXbW1QRU1GL3pnQmp6UVFR?=
 =?utf-8?B?ZkJTSTBNendveEIwVlZLbERNUENyWmljM05RdjRqaHJNbGdDSTFwMFFpMWlX?=
 =?utf-8?B?RmVDYjhjYkkzSWU4NUVWeGdlSjdhbHFJM3BHQ3E5VFJJVnBvOXVPRjdCd2FC?=
 =?utf-8?B?Kyt3MTlYWUxSRktyOFowQWJDL3J6d0U2Vk96aXRHSFJhQUJnOWd2WEtZWngx?=
 =?utf-8?B?MjJoeTdCaFVFZlpRNXNLelB1eWNuSG55cmd6L0lvUzNJdlpISU1LOU9CN2FQ?=
 =?utf-8?B?RkFoTHBGczlVcTZOOVR2UDNsY3Y5S1JRaStGQnJhbnlmR2tVTVlPTHpZTENa?=
 =?utf-8?B?aGFZVzMxclIrcGxLRjJESVd4WW5jcWZwQzlTVExkOFdvaXM4eHJaN0xUcnFO?=
 =?utf-8?Q?VXXERM/Ia5ijTztmb+vVL6w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b512e8-2a7c-4eac-0e2b-08d9bf148ba3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:15:21.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgLs66n8wt/EiCdFnVMH4pjfEid96cyGqTA5sD+yfeoEon7QTUMB2Ds5qUqCn67crxbZNVb7nkQoKWX3HFX7zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5081
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 04:05:27PM +0100, Jan Beulich wrote:
> On 14.12.2021 15:50, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
> >> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> >> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> >> @@ -445,6 +445,8 @@ union amd_iommu_x2apic_control {
> >>  #define IOMMU_PAGE_TABLE_U32_PER_ENTRY	(IOMMU_PAGE_TABLE_ENTRY_SIZE / 4)
> >>  #define IOMMU_PAGE_TABLE_ALIGNMENT	4096
> >>  
> >> +#define IOMMU_PTE_CONTIG_MASK           0x1e /* The ign0 field below. */
> > 
> > Should you rename ign0 to contig_mask or some such now?
> 
> Not sure. I guess I should attach a comment linking here.
> 
> > Same would apply to the comment next to dma_pte for VT-d, where bits
> > 52:62 are ignored (the comments seems to be missing this already) and
> > we will be using bits 52:55 to store the contiguous mask for the
> > entry.
> 
> Same here then.

I would prefer that.

> >> --- a/xen/drivers/passthrough/amd/iommu_map.c
> >> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> >> @@ -116,7 +116,19 @@ static void set_iommu_ptes_present(unsig
> >>  
> >>      while ( nr_ptes-- )
> >>      {
> >> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> >> +        ASSERT(!pde->next_level);
> >> +        ASSERT(!pde->u);
> >> +
> >> +        if ( pde > table )
> >> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> >> +        else
> >> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
> > 
> > You could even special case (pde - table) % 2 != 0, but this is debug
> > only code, and it's possible a mod is more costly than
> > find_first_set_bit.
> 
> Not sure why I would want to special case anything that doesn't need
> special casing. The pde == table case needs special care because there
> find_first_set_bit() cannot be called.

Well in iommu_alloc_pgtable you already special case odd entries by
explicitly setting the mask to 0 instead of using find_first_set_bit.

> >> @@ -450,7 +450,28 @@ struct page_info *iommu_alloc_pgtable(st
> >>          return NULL;
> >>  
> >>      p = __map_domain_page(pg);
> >> -    clear_page(p);
> >> +
> >> +    if ( contig_mask )
> >> +    {
> >> +        unsigned int i, shift = find_first_set_bit(contig_mask);
> >> +
> >> +        ASSERT(((PAGE_SHIFT - 3) & (contig_mask >> shift)) == PAGE_SHIFT - 3);
> >> +
> >> +        p[0] = (PAGE_SHIFT - 3ull) << shift;
> >> +        p[1] = 0;
> >> +        p[2] = 1ull << shift;
> >> +        p[3] = 0;
> >> +
> >> +        for ( i = 4; i < PAGE_SIZE / 8; i += 4 )
> >> +        {
> >> +            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
> >> +            p[i + 1] = 0;
> >> +            p[i + 2] = 1ull << shift;
> >> +            p[i + 3] = 0;
> >> +        }
> > 
> > You could likely do:
> > 
> > for ( i = 0; i < PAGE_SIZE / 8; i += 4 )
> > {
> >     p[i + 0] = i ? ((find_first_set_bit(i) + 0ull) << shift)
> >                  : ((PAGE_SHIFT - 3ull) << shift);
> >     p[i + 1] = 0;
> >     p[i + 2] = 1ull << shift;
> >     p[i + 3] = 0;
> > }
> > 
> > To avoid having to open code the first loop iteration.
> 
> I could, but I explicitly didn't want to. I consider conditionals
> inside a loop which special case just the first (or last) iteration
> quite odd (unless they really save a lot of duplication).
> 
> > The ternary
> > operator could also be nested before the shift, but I find that
> > harder to read.
> 
> If I was to make the change, then that alternative way, as it would
> allow to avoid the addition of 0ull:
> 
>     p[i + 0] = (i ? find_first_set_bit(i)
>                   : PAGE_SHIFT - 3ull) << shift;
> 
> I could be talked into going that route (but not the intermediate
> one you've suggested).

If you prefer to open code the first iteration I'm also fine with
that.

Thanks, Roger.

