Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2BD33D10E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 10:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98236.186269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM6Ei-0007dG-6p; Tue, 16 Mar 2021 09:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98236.186269; Tue, 16 Mar 2021 09:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM6Ei-0007cr-3F; Tue, 16 Mar 2021 09:43:36 +0000
Received: by outflank-mailman (input) for mailman id 98236;
 Tue, 16 Mar 2021 09:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sz1a=IO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lM6Eg-0007cm-Pi
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 09:43:34 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 631c2e8a-ac56-46b6-b4ef-076a9137fa33;
 Tue, 16 Mar 2021 09:43:33 +0000 (UTC)
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
X-Inumbo-ID: 631c2e8a-ac56-46b6-b4ef-076a9137fa33
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615887813;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GD6J4yQnRJatN/Re/S+emCfZY9wFlpXF++z0J13EmiA=;
  b=MfqvbouDUe784Lm7Tfee+k/e9v/VHS5F4AzzsNf/jEiJKk2/nrC6Jl1B
   C+PJIORf8GqSXHZCH2K0KEVVlcvvc1iYGPmxhawa0wYEaADTEFxjP7XZo
   n4uliNcruB7usu68CyVg3Xrxw+8xty9uyWPcJgNAQq8XVsQqh9pAUlt2E
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oVJ0cUotRVM93uwQGmpXp3zPVcNc8jcCIaTZ/hEV/xBNLeGwmpZg0vgICNGm9ExVmnKTN9jnhS
 rly6Dl9PgmMNyXopECexYdVSi1cttvqV16/b8DG0xMOlHfI/0TSYTwM0Ugg+avBYOtAP7mNFsG
 B2q2IH+K3kEBo3PpKfU0jkIVTQPq7BOV3goptWGImzsWhxpDc22Z+4nKcVnNyASkrwCcpc6nCS
 sPg2rndGH+JN1QwrB6tZDGy3WLmYflLzIKtJj+8xoYumf+kVV5hW7sGQHIEDzRFXh4d7tdbcY/
 Pxw=
X-SBRS: 5.2
X-MesageID: 39380055
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Tcb646pEEETwss8Y+FvWgRAaV5u4KtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYytLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh5Y8HoodrXmJX6JSMXHhJP0nj1sRqEyp7fVyKZ0BAXTi9Vzd4ZkF
 TtvgTl6syYwpSG4zDG0Wu71eUzpPLAzZ95CNWImowpLFzX+3qVTaBAf5HHgzwvuuGo7z8R4a
 nxijMtJd565X+UXkzdm2qU5yDa3Dwj62DvxDaj6BOJy6GJJ0NZerh8rLlUfRfD500rsMsU6t
 Mx40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ0nbaIibtZq3Osi1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmArhD3I1
 +R7ml0+OrERTKK0dcheugNCFUTTEg383J5+uyeM6XWFQWxbulGuH63KGW0frMYaK+LH9wr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBfqIPzjkI58Az/WKfXKWgqWr58avjDD4DRuDAn5o+r
 FtRAg3dcRMij4rkYst9DO9I5aH+34Yrw==
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="39380055"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAkT87ypccD2OCHYgJjf/0jzk4xneycbelU19wkKvN1Qob9Q2vq65Opi9w46iq9jc3qCv9T3dH7P3y1zMJUiqAjwwnJUc3YGgtC3mLCRFp6SucgSXh7Z9MA2LiwGwhsTyfPh2pqAfMdNcw2rJecoIyMdgVaGA2Ge2T3PkGQJ5aGPNXjHbFNVZiQoX8m7h7dxQQ/ZQLZr7SHSkcPL8h78RYtIxA0aiudvzjCOIP9r6+tLGF2TtJPrGonsg+TrRDFWMwihauyNn11fVgiYWiD5zcI0Sp/anSOgbMjDBAxDJ74LJ8Wk7P/w5rHveaEUdVP8ABBLo0LtlnoqD05NeSyWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jY+H3aeiJdIw5LYC3xAbVdwK0B+UdoN9Ybvz3FB+Ugs=;
 b=m6oXz/IFvG4/+6qrMJxvUwyLnRQRNPhaEU0M6vsbuMs9aDj9rDl4DfFIC3cknm/OtWW0rN17KU82R0Oi9EdI178qBkrWnx9O2tyWbMj3XlOXCfMQoXCfgMga/5lBhifvl3iLGdaKa/a7kjLHNMcVs3DguelvofYto2dUm+p0VGg9vUgw3V00KtSjmm4WrW4wTcNE3DjDG6arXl975FKphcF6OFVi5LrcMlJ0VHXOp/gO7XjxKY/a6sk9fOz2CQxq5fi/ap3EDU1Fuq2uKiKFO0GFnK5ZydgjgXOz64CPu1uZTaw7q2jqmuUZkUUQNQiAvrC1GArMCBChmFgcvW3KAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jY+H3aeiJdIw5LYC3xAbVdwK0B+UdoN9Ybvz3FB+Ugs=;
 b=vLqf12mzF0o0o6186UCsl+S2WPo3xQxGe0gvTlF4YlX8m+enQDOImas1BxKgmUkq4gmX6FhKf4NWWAwT+iAtnx4yWN2zjc9NWlYg9RK9Rm6z5CBEA0qe1nsKXudxii+odYCjO43Ku4Vq9dk6d2uSxXEjrKMnkhRnqaII/llZgGE=
Date: Tue, 16 Mar 2021 10:43:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?RnLDqWTDqXJpYw==?= Pierret
	<frederic.pierret@qubes-os.org>, Dario Faggioli <dfaggioli@suse.com>,
	<committers@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [ANNOUNCE] Xen 4.15 release update - still in feature freeze
Message-ID: <YFB9ux/06pP4hh/Y@Air-de-Roger>
References: <24655.20609.834996.744652@mariner.uk.xensource.com>
 <4531d373-3915-ad90-ef99-4f8cbbdb5054@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4531d373-3915-ad90-ef99-4f8cbbdb5054@suse.com>
X-ClientProxiedBy: MR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe08838f-21de-4b87-aa1e-08d8e85ff464
X-MS-TrafficTypeDiagnostic: DM5PR03MB2715:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2715A2B3E402AE0ED0CE3D2C8F6B9@DM5PR03MB2715.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ar5zQI+uk1mgGMt137iWRkqWeqex0lf2brqVUY3yQ2n16XMCF+p/D1ojqO2dKcyY33FaflUfyDeHKGvIWd+ZECKjlIEMnUXZdy2JvpdFX/Lvo9qtt7cphuPzR3VtCX7eD5r2B7hu3bcRWQKHkxXn+PReVkgvBk25wBlgWI+m0dpsFLh6GKld1/lFD4yatj/jNQQEXZGWOrqh/aovdStVY1ZJ6fbzsBkii1SKdJdYbfHv+E0QOQ9Ga8Ahu5WogBWxBcyUPDMTnNTDgEM+ogsJ2vShJZn5VdlGmT4mQGFC8RbNPbAx7tUXK0/tfRaiB8JOeqWc5CRIIEMvvw70PoestHOBqPXi7u4AALETXr1rK3cviQiv1zUYcavYoffjUXBDRSajVE2i5hP2tSEkIlyM8Vs0o4rA+tbVvjf/E5eGpmmOycGxFdBn5OLP/HjYTGBM04M6QwM2HRlqsFQwZKCvV/xsbzPwbZwPjDoS9lJQ2vPoUKisWz5dVzOAkqAk73M9vIhzCDMqaTDIfKZkblOx43VguhmwLVfUM/NlE/8siGYfN4UepqaEyAsQdv3Kg0a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(2906002)(6916009)(33716001)(83380400001)(8936002)(16526019)(66476007)(6486002)(85182001)(66556008)(4326008)(53546011)(316002)(86362001)(8676002)(956004)(66946007)(26005)(54906003)(6666004)(6496006)(478600001)(9686003)(186003)(5660300002)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGRDV2drWGNJWFJYVTZsOW5iN0dPNlllMDdoNTNjNGZVVHczTlQwcVFab041?=
 =?utf-8?B?a0NHcVNJdmVMTW83Y0ljSUlZdkdnVjJKcldBTEFnTXFvL1ArMHBoT2FPckRY?=
 =?utf-8?B?ZW9KSEx2NFJWaXd3bzh5VzdGMGx4d1kxbjVra0kyd3BQMXRKREZaNE5LSGV6?=
 =?utf-8?B?YzRRSmhRTFNzZEs2WEIvYkc2UllTRzNUcDNrenlWV2hLNkROdGVwYjluVytO?=
 =?utf-8?B?SGlNMVZ6aS9EV2diWTc3TDJxOE1HQzRVSG5vY09iSUlQSGMyakowMkJMelFD?=
 =?utf-8?B?cVdkdThHdFRHcXY0a01CWkhaanJYYWxFQVNvU0YrRmdqdnlVellPd3VqajlD?=
 =?utf-8?B?ai9mRG81N2ZpSi9GQ2NVaStUZGJobWFUWVNlTUlVMnJxUW9FM1VSNzQzR01L?=
 =?utf-8?B?eFBZdUs0Z05tNjNWdVBlRlJtTy8zQmxMNkxSR2FFNDFzanp2Q3hjWDN3dExn?=
 =?utf-8?B?ZFNrRnZ2SW0rSHlBRldZUUJZTktERzcvNGtIY2lHbVNwNE9vb0RhbHo5QURX?=
 =?utf-8?B?SmREVndnamErUWxhOVEzNUg1RmxFQTE2aUlHdzZnL0IybjBzMC80WDdyMS9m?=
 =?utf-8?B?aHFDZTdiYjk2ZUZwM1Jub0NhU3dFM1I1azl2OGp1U1U4aVFrMUFnVWFTbm5q?=
 =?utf-8?B?RUY1NHJITUxzUEN3c0VUTlFsRmtTTlE5aTBXUlBITmZhN2ZQL29scmhLeTky?=
 =?utf-8?B?b0xXWll3TVpKaW0zc1VHL1hxTTFDQU1abE4rL3pYditiSDNYTkVMYlVLWEpv?=
 =?utf-8?B?SjVPN28rRTVQVll4UTVDNG44Q2s1TkdxakJuUCt3a3VKNU1laU5lRG5qYTl1?=
 =?utf-8?B?SksvVVdndW55a09oWktXUzJDMDBLWFRzaUpBQjJhV3ROZ0VLdTRNTnNLSTlP?=
 =?utf-8?B?d2JSSlZSUlNSVEpkaXRDcW1COHRTb2NwY3pqM0hYcUhXWjBoSHVUeTBhbVJV?=
 =?utf-8?B?UVlEZ3dxRnZjVUJYanArbEpOT0xzUE9Xb2pQMWgyeTVkWkJyRFUrdk1McW1v?=
 =?utf-8?B?Y1YvdGNUUEVYdkJpQS8yUVRnNGEvU2NnNmpCSWtMQk9nSE5wNXdpUkI0MkFk?=
 =?utf-8?B?TkI0RXJBUWsrVUVFZkxlQzFFL2dkWkhvTjh1b2IxeVQ0OVkwMERMNWxYVWx1?=
 =?utf-8?B?ckROZi9tOXhSZTZPbUIwTlRlUGxjUys3emRxV1J0cDRDTGxGREdSNytqUS9h?=
 =?utf-8?B?ZjhVSERqVDl5T2JqMWlOcmNtMEs4RWZBV3B1b0Z4QkdaRDIzZUZpUmJMa2JY?=
 =?utf-8?B?Y0ovaENhb0sxZ3Z5VnJNTnd3WC9MRUJia1QzTzcwN3RIRmpvRmF1TTJybDJG?=
 =?utf-8?B?OHEvV0hZbGpsSUhhM2N4eXYxUVRmWE10TWZDRm1xcEhObkNmVnFwbmRvNnY4?=
 =?utf-8?B?bURCTENDbVF4bWVXb0tUbUR4YmFNdG50OERGWDE5eXhTQzVDMlV0eU1XclUr?=
 =?utf-8?B?M2s0TnVweVpzQmdENTloTjNBUWpMajYxWGtNT0h2SzhsSUZDOVZOMDJhb3Q3?=
 =?utf-8?B?ZXlmd1NKVDM3OGlTNTBqcW9qVytWK3JPRmVQemMwZHNtSWEzZmpSL1h4b09i?=
 =?utf-8?B?SnNGcVd2SVhNRFJjUlNBbjJ5Z25XNW5mbVpiVGVqOFFCWENnNldFa1JuaXV2?=
 =?utf-8?B?MGVwc29pSUMzdWxkSmVINHNMamwzYU5BYmJtMUdQTDFWS2hZNWZZZVBaRUlt?=
 =?utf-8?B?MUZxdkl3NzVNSzNYSzlKMW1VazJSVzZhbkN5SkJCWEtnbmEzZElmODh0Zm5O?=
 =?utf-8?Q?8IwE33oehoaS3Hojzc4zIkvTvbJ1qSqAKYaCP+a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe08838f-21de-4b87-aa1e-08d8e85ff464
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 09:43:29.5199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUKD9cHwe7f7sR9cyQhTvyQHnjzOfEkXGuBZ0iI/6eHHShKWmjTiW5vvXKQ6scNGdo+Ow78PI26LREP7hmZkIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2715
X-OriginatorOrg: citrix.com

On Mon, Mar 15, 2021 at 02:46:07PM +0100, Jan Beulich wrote:
> On 15.03.2021 13:18, Ian Jackson wrote:
> > ISSUES BELIEVED NEWLY RESOLVED
> > ==============================
> > 
> > Fallout from MSR handling behavioral change.
> > 
> > I think there are now no outstanding patches to fix/change MSR
> > behaviour and there is no longer any blocker here ?
> 
> In addition to what Andrew has said, while not a blocker in that
> sense I think the excessive verbosity of the logging is also an
> issue.

I think you meant the logging done for each MSR that's not explicitly
handled?

While I agree it might be too verbose, I don't see how we can change
that right now. We could introduce a command line parameter to select
whether to print those messages or not, but I think that's too
specific for a command line option.

We should look into some kind of logging improvements that allow
selecting which messages to print on a per-domain basis IMO.

In any case, those messages will only show up in debug builds, so it's
mostly annoying to developers but transparent to consumers of the
production build.

Thanks, Roger.

