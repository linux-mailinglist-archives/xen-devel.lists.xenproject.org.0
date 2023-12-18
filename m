Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDBF81740B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656087.1024046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFErt-0006Ee-TO; Mon, 18 Dec 2023 14:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656087.1024046; Mon, 18 Dec 2023 14:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFErt-0006CQ-PZ; Mon, 18 Dec 2023 14:45:17 +0000
Received: by outflank-mailman (input) for mailman id 656087;
 Mon, 18 Dec 2023 14:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrWQ=H5=oracle.com=steven.sistare@srs-se1.protection.inumbo.net>)
 id 1rFEqs-0006BL-6z
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:44:14 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7bbef76-9db3-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:44:12 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BIDkDS1009144; Mon, 18 Dec 2023 14:43:59 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3v12tc3f26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Dec 2023 14:43:58 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3BIEBlYn030910; Mon, 18 Dec 2023 14:43:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3v12bbd178-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Dec 2023 14:43:57 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by DM4PR10MB6911.namprd10.prod.outlook.com (2603:10b6:8:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 14:43:53 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::d609:b162:ba7c:4e96]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::d609:b162:ba7c:4e96%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 14:43:53 +0000
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
X-Inumbo-ID: e7bbef76-9db3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=ds/yykHR1Lt1xrxhWUv2WCfWkTRu6xTHu9L2lF05jgE=;
 b=U0mDmAp4c1GAyzdXrGIYXfu3sqdL6lNQOGcD6cZQgvtWr8FBZr5OObx9y71yxKru58BM
 Cgiup38E+uoPx5lwrVNpgADBtaQAzmdI2fCmH2BZeD+1Ao+GsTaYsKZ8ZXu/MOFZxgF/
 0KktszeT6BVwDKzDukGTpdzHukkTko4FUestoPyCh89g1RMMNoxmePO+855VMIsh3FfR
 P+TfIgTZ+dOpPWplX/we0awdnnPDLWDsuFCh/G9TVD2BpvM9x/u0DcDHzs3RpVH7vIDP
 7vEbCjchsBYEq64tlXSV4H1ykMcH7U1qp69VGWgFb5rHN0Hbcgjb4IWn4WlP/MNZfUW6 aA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJBbJjtnmfgvTB+tbvqBcsxcj/l1rLnb2DDtZndfbgapWLZMlcY76QiOc+HPvSkYhskOQAtBsOsLaBfixYwiGgYfXRYKeHE89iJk3PO7O4m9cAaW2h8SmRUvxb3fFry0mu4mZO3EzUfejueLJ5SQ7uFc6pdmGhXNXOrvrbZcXEEw4bstOt3aP2VH0SH/y745Ab0QnsPvZC/AQsSfUdRirVXEyhT2wmRj6NX8E788sEd4VVLMX+sdvDiVYWH/Y+ppfeSKttNrAn2ruyJJU4yL5pHwlAFgGV4jRcApoYUV/qsC0MITUn9E3iXn3rpmo2uznfFa4preKHo37+TKjtDITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ds/yykHR1Lt1xrxhWUv2WCfWkTRu6xTHu9L2lF05jgE=;
 b=UkPfLv4zjBCfgx9yIecD8PzRPJ4IAsLd0jhpStVfMUOII4fMXiHdQEqOXNR/uSrKFP/r+fvdGKnMfY/PeiTqP2zhlC+Kksrns4zXpU4RMN09Roj/ejF5jEMLvjgQG7+miyK2a0tHuIH8YSlV3L+7h1SWCAz15nzwIdyQGsuisvwcH6B2ToIJYBhtGi/NKcjPdA4Sx1TIMLMNrY72UXbVO7bsvvtmCtNruxVZJk/apkPa8ZAwmK3o67xH4dUmfW5DphsLBitK3zSAWh1Q1Ei9ruB5sW/ffdJhTL3WYrm3IaldK/FWFWczREBwKkBCO6E5PfTMzzn3MK9qkj1OqzFe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ds/yykHR1Lt1xrxhWUv2WCfWkTRu6xTHu9L2lF05jgE=;
 b=yR4eivliYxh+1hGMkJVZlNvVakIP4wauJ+nyGq+AJQCmf9u+/7qrGsYvsdMYBJqjvPZu0P9+xEJeV4iB49Uv9YSyGw/TLFIW46oYVj39x7wzPJHeELfQdS1NAWb6jYKze/0KJPP99uSvRKtGjcZNF3U4T/5P05t4z2r8aELd2Nw=
Message-ID: <8f6ef8e1-5f22-4db4-bd60-a481e7b4433e@oracle.com>
Date: Mon, 18 Dec 2023 09:43:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 00/12] fix migration of suspended runstate
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        Fabiano Rosas <farosas@suse.de>, Leonardo Bras <leobras@redhat.com>,
        qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Gerd Hoffmann
 <kraxel@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Laurent Vivier <lvivier@redhat.com>, xen-devel@lists.xenproject.org
References: <1702481421-375368-1-git-send-email-steven.sistare@oracle.com>
 <a9ddc1b2-d4fc-44de-857b-2aeb35fa0925@oracle.com> <ZX_VS_KDsoiL9T2X@x1n>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <ZX_VS_KDsoiL9T2X@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|DM4PR10MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc05405-b87e-491f-38ff-08dbffd7c1af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FVYtNNZSrwPPxnpmuHoTqtTvyBU4p+5VCEg3juEbSjdtw3T/9Vbks4595wgVHoHnhWQvrW5uHjVqFWaouUU7GeS61tSouQZh6EkiQdF8QEJN5VeGzlu6RNMqknIA8MCRYPKIZVieEz5O7slvwcum0Kxff1D/xcbdwVICfWjmgJJmKk3YhEsISLUkyFEavCC8x/gUCnByEPuSeROZY7ry5UsAIbeCpgxRQsDK0dsfQv5vTyvaLuWHi8mnAWtrzwZ0wOmMmXpisA008RfYX7v77BJFyEKanEibX7bjwwzbBU+m4vChAWEpfXWXRGZDFizNpXtLxm8+bot88RqFoc14nM2Bs1VxSKYaVQFrYiDAlAnKWM+XZOC9MbumAsSGUgRXkj05WF+x4q2sljL8Edq7qce3wKLvQOmqzxTM6Hhvwjz9B9kC4WDMJuRBmJG497pgPb/dB/E7eMKdm2yBEYoCIDqffIyCFd95dzuVOumHz4n5PBDjHsaRA0DR3776GzM12Hauzgi3EzjobZb5dk1ezBs9YREtVY9eCgENAPm9XtvhPLVhtxoHmLEA1dqoxvYfPQtVLgMUCbZcWMlyoaBM12pGn+ByURG2e4phHMi7D2Dn++f6mSLpZhCAn9eqRU1Ze78aYWfoXomkrjtJPs2z8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4684.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(36916002)(2616005)(6506007)(53546011)(6512007)(6666004)(83380400001)(7416002)(15650500001)(478600001)(5660300002)(2906002)(8676002)(8936002)(4326008)(41300700001)(316002)(44832011)(6486002)(54906003)(66476007)(66946007)(66556008)(966005)(6916009)(38100700002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzF5cWJsUm1IWmhqWlhPNys0bWFUNDMwUkY2OTlldDFjRkxvZjJBL0lYdy9m?=
 =?utf-8?B?aC8zVTdnT3FxRkZKbTczRHFYeWNhblBJa2VWL2xwLzlsQ05CaEd0Y0VLM0pu?=
 =?utf-8?B?Z2dnNTdWY3hpdCttY0dXZ0wwZUZ5R2h4VjdRTmdTSmd4SXQraW5GN0hyRTVi?=
 =?utf-8?B?TXRvTGRORzJ6TzZQRGxuUlY5dFZxbzNlRmJKajhxWUF3WTF1RnFYYy9UWWFE?=
 =?utf-8?B?YjhzWFFDOHh1NTB1dUhxZFRuTm5jMmduclVkRDNBRGd6eldSTmZpU2Vmcndl?=
 =?utf-8?B?R2Q5eTY0TFk1NGxJWStoUlZJWldIbnp5M1c1bDhzWW5KUG03dzMvYUNWcU5O?=
 =?utf-8?B?ZTdGYUFHeXd0c1NRT1g4V0x5V2QwRTZXRVRSYVBtOXRtbHF5VGJsUFd0dmt4?=
 =?utf-8?B?Z01MVjVFN29EcWx5L2pyeG9PbnBqYXpvSHNjNENqOWlCSzNva0NRaFlzUjBr?=
 =?utf-8?B?YTI5REpxdGF4VzVndURDSVBGTEptbzhoeGMxS2FCVzRscGczQW5jNjdBZFZy?=
 =?utf-8?B?NWMyTmJNQTVBaWVJSVYvbmpIUUNjL3BEVzVJYUI3U1dmb0xsM1lFaERGaGpl?=
 =?utf-8?B?MFVvVk56NjUrdmVlaENmQzBwcStaU2ZpZE9WdkRGZ3ZKVHB0ODZrRTF4VENQ?=
 =?utf-8?B?L2pvQmdwamVSa28waERYVkZZWURaUElNVFZkOXU0VS9oSnhtdUxpbVZOTjF0?=
 =?utf-8?B?L2VmUGozWGc4ZE0vYUU1NWxRVGVmbTFrZ3dXRys1elZXNllDNlY3WGlOMDg0?=
 =?utf-8?B?SGt1TWp1ZjRGUXpYQVlWWDFKcDlvNFdubCs2NGt4Mk5oVEdVdEgrd1JZaHNI?=
 =?utf-8?B?TkwyQ1lINnFodjdKQVJHUFNreGlWWmVoT28zOHg2VjVsM0I3UHFIRzVsNGZ3?=
 =?utf-8?B?cldnUG1GWkRyY0hJSlRBWVBaVDZ2Lyt1N3pmdG5ycnVhdnJEVUtLc2ZaZkJF?=
 =?utf-8?B?eGpaKzF1MkxlVVd3V2wwbEJySkU5Q3JER2ZOQlh0SisyanZoUXBlVUxpQU1o?=
 =?utf-8?B?Q0RoZW1ZaDRnTXZ6UGJ3c0xuTmRmTjdOb05sNHk4eFNud2YxcmZ2QkhWS3NF?=
 =?utf-8?B?M25ZeXl0MFNLNGNpZ0VrQXRCWGUvdFAyUkN0RlJGNm1oZ0xwWjZFUUlvMU03?=
 =?utf-8?B?VUw2b2VwOGFWVldkbHF5cDcxMVhjRnpuS2p1Q3BqdGlzQlc0eWRXK2daMzNm?=
 =?utf-8?B?WmlDT214RGpzWDRHYjhpa3ZGbXAvQjZxcmVib1k3K05MdlE2QllNaDBENmZB?=
 =?utf-8?B?Q2xEd1NSL1d1KzlOUlRGU1E1a2NHemNBbStyOCt3SEordzZ0YXBrdzZQcCt0?=
 =?utf-8?B?Q3ZOWitOdnB6Tk5MVWV4VUhUTEI0bmR0WldldnkrdC9wZ3AyYmdTWGtHUzZO?=
 =?utf-8?B?ZWpqVU8vM00xS0N2OGUzSThvRk40aHo4THBvbEdjV1dIL1ovWE53WWZkSkc1?=
 =?utf-8?B?NUxtTUh6SEIwSUtmQlBkbVFVemFjV0RvQlVLYjQrLzBkZjE4N2t6cGJKaFlK?=
 =?utf-8?B?ODlEd25WMW1xSG1udFhmZGNEeStXWDdVNmZOVXh0RE80UHpEdGQxdUtrZUJF?=
 =?utf-8?B?WW5nU0p6SjJndk8yMUcwT3dIWkpaZXBucW02ZlJYR1pyZ0xFMTgxdjFjWlpL?=
 =?utf-8?B?d3VGQzRlNzhiTFlSN0QrN3U1VVdFNm5zYzJJMDFIaVozbUIzRE5ZNHlDUXVI?=
 =?utf-8?B?SUREMWZPVjNscFdKV08xK0lxREpia3RwR1d4UW5BdkRrc1VEUHBURnVDOEJM?=
 =?utf-8?B?ZFBvNGp4RHBWQlJ1dlNOTEhNM1RRM2tuTTMvYVBHMTNoWHJUcjV3OUYzZTJm?=
 =?utf-8?B?NUJoeURSQUhlT1YvT1BqK29IeUg3Q1FINyt1a28vOG0yVE50d2hmUzlydzIw?=
 =?utf-8?B?dkt5N05XUzdwOVFsRmhVWTlhVm9xMjlOOWNTQjgwUWpwdkNES29XcTRvTHNy?=
 =?utf-8?B?eDh0ZGkrd3hPR3YyeDZ6RGwxZE1PRnpueTA1SEEyNkFJR1BDaG5FbXA4SXU0?=
 =?utf-8?B?SmQ4bkZrdEJOY2xOSmUxNytzcFRGT3FIM0xSeHZBTFRLaXZ6Ryt6WnJPK1FD?=
 =?utf-8?B?L01wbEpsN1pWeWJpY0hpTVltL3IrZFYzLzVJTEtxbnE1b2dIaWVCelREbG1R?=
 =?utf-8?B?aEx4ZjZCNVRFcklTbGdFOTZoaXZwOXIvUjM3dVlHU0s4akwvblJ0VHp5VVkw?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	szq4+6QF7sKvj14FQNT8IWXYw7rXfOb5o97gw83kWbXB4iHDSb64V2UbCSeKCBvWPLIEOvGNQ3uMAkwqdZ1DdPHAtH7SKTWwsMsuyUE5VQM88Iq47J4whMYfEsImsbFCYmXmoSajKqvEOEcZI2RJC11BdJatgLlbNXgYXB2ePDPIfdWg8PSd7wRkHIm1GEbp3vwZD3d5px2E6nNQWHB9atJIIHwT/bsIpdD10AoHa4CZP+PRe3TXMA4pUlmV126JVvQlEiGl+YudOEmjJLEnRmcEva9n809k39froz9geyd0ittNu5Y4uZNUXMNd8kFCZnCyrRx2bjv5Y+TnGNLsc39/ko7N/TZvj0x0W8QJ/ujIEzmCqzwhD3Xy8xTu2923Phov+XEIihL0lDKB7SgDVEDY4ozee1nGOtvXY6PCYmnEQvl+opKjq8PqZkxyv33aKR2JEydHCgMTLUMbY79uUMDM3tXWgqLQDQeJFGYgOlwN9ORc3W7jzthzKNdf4dyq6l9kGsZ4tmFfrnFx5pcCGChYcWPFvf4jgAJz5G3y/p0MqNGhmVl7nwXMShOWNNMuacTDl66rgfwplSukwFIFHgbSFb9bh77pvrfrUvslc6o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc05405-b87e-491f-38ff-08dbffd7c1af
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 14:43:53.7851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ehcb+qo5sXQHXVQ83XCcoEB+nYXexQLXaO+th4UoePdndqVumCh8a+lWjhVtnSJ3i6/+OiYFPRS31+BrfFPeMu4ojaR018eTpH5K+dObddY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-18_09,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312180107
X-Proofpoint-ORIG-GUID: saPKuyxTkOv0A4HLNWDeTudp2xNpvIdP
X-Proofpoint-GUID: saPKuyxTkOv0A4HLNWDeTudp2xNpvIdP

On 12/18/2023 12:14 AM, Peter Xu wrote:
> On Wed, Dec 13, 2023 at 10:35:33AM -0500, Steven Sistare wrote:
>> Hi Peter, all have RB's, with all i's dotted and t's crossed - steve
> 
> Yes this seems to be more migration related so maybe good candidate for a
> pull from migration submodule.
> 
> But since this is still solving a generic issue, I'm copying a few more
> people from get_maintainers.pl that this series touches, just in case
> they'll have something to say before dev cycle starts.

The key aspects are summarized by the cover letter and the commit messages
pasted below for the first 6 patches:

https://lore.kernel.org/qemu-devel/1702481421-375368-1-git-send-email-steven.sistare@oracle.com

---------------------------------------------------------------------------

[PATCH V8 00/12] fix migration of suspended runstate

Migration of a guest in the suspended runstate is broken.  The incoming
migration code automatically tries to wake the guest, which is wrong;
the guest should end migration in the same runstate it started.  Further,
after saving a snapshot in the suspended state and loading it, the vm_start
fails.  The runstate is RUNNING, but the guest is not.
---------------------------------------------------------------------------

[PATCH V8 01/12] cpus: vm_was_suspended

Add a state variable to remember if a vm previously transitioned into a
suspended state.
---------------------------------------------------------------------------

[PATCH V8 02/12] cpus: stop vm in suspended runstate

Currently, a vm in the suspended state is not completely stopped.  The VCPUs
have been paused, but the cpu clock still runs, and runstate notifiers for
the transition to stopped have not been called.  This causes problems for
live migration.  Stale cpu timers_state is saved to the migration stream,
causing time errors in the guest when it wakes from suspend, and state that
would have been modified by runstate notifiers is wrong.

Modify vm_stop to completely stop the vm if the current state is suspended,
transition to RUN_STATE_PAUSED, and remember that the machine was suspended.
Modify vm_start to restore the suspended state.

This affects all callers of vm_stop and vm_start, notably, the qapi stop and
cont commands.  For example:

    (qemu) info status
    VM status: paused (suspended)

    (qemu) stop
    (qemu) info status
    VM status: paused

    (qemu) system_wakeup
    Error: Unable to wake up: guest is not in suspended state

    (qemu) cont
    (qemu) info status
    VM status: paused (suspended)

    (qemu) system_wakeup
    (qemu) info status
    VM status: running

---------------------------------------------------------------------------

[PATCH V8 03/12] cpus: check running not RUN_STATE_RUNNING

When a vm transitions from running to suspended, runstate notifiers are
not called, so the notifiers still think the vm is running.  Hence, when
we call vm_start to restore the suspended state, we call vm_state_notify
with running=1.  However, some notifiers check for RUN_STATE_RUNNING.
They must check the running boolean instead.

No functional change.
---------------------------------------------------------------------------

[PATCH V8 04/12] cpus: vm_resume

Define the vm_resume helper, for use in subsequent patches.
---------------------------------------------------------------------------

[PATCH V8 05/12] migration: propagate suspended runstate

If the outgoing machine was previously suspended, propagate that to the
incoming side via global_state, so a subsequent vm_start restores the
suspended state.  To maintain backward and forward compatibility, reclaim
some space from the runstate member.
---------------------------------------------------------------------------

[PATCH V8 06/12] migration: preserve suspended runstate

A guest that is migrated in the suspended state automaticaly wakes and
continues execution.  This is wrong; the guest should end migration in
the same state it started.  The root cause is that the outgoing migration
code automatically wakes the guest, then saves the RUNNING runstate in
global_state_store(), hence the incoming migration code thinks the guest is
running and continues the guest if autostart is true.

On the outgoing side, delete the call to qemu_system_wakeup_request().
Now that vm_stop completely stops a vm in the suspended state (from the
preceding patches), the existing call to vm_stop_force_state is sufficient
to correctly migrate all vmstate.

On the incoming side, call vm_start if the pre-migration state was running
or suspended.  For the latter, vm_start correctly restores the suspended
state, and a future system_wakeup monitor request will cause the vm to
resume running.
---------------------------------------------------------------------------

